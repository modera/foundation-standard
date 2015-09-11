# Notes, thoughts regarding upgrade to Modera Foundation 3.0

MF 3.0 will presumably require:

 * Symfony 3.x
 * ExtJs 6.x
 * (?)PHP 5.5>= (same min version that Symfony 3.0 will require; [Symfony 3.0 roadmap](http://symfony.com/blog/symfony-3-0-the-roadmap) -
 it is not certain yet what version it will be)
 * Review existing in-house code base and if something can be done with Symfony/other trusted libraries - use them. Goal:
 minimize code-base we need to maintain

## API

Questions to asnwer - what is considered to be API of a bundle and how we will designate it ? For example,
Symfony marks those classes which are part of its public API with annotation @api. By default, all semantic configuration
exposed by its bundles are also considered as public API. We need to think about similar process for us as well.

Questions:

 * Services from DI container, how we will mark those as public/private API ?
 * Extension points are marked as part of public API by default ? How to designate them ? Some mechanism to mark
 and make it very easy to see that a given extension point is deprecated ?
 * An easy way for a developer to see a public API exposed by a bundle ? Create some piece of software that would
 automatically generate some nicely formatted document that can be used to see which public API is ?

Once this question is answered we will be more confident about what we can change it our bundles without making
developers who use our solutions to suffer (they can use our private APIs of course, but if they do they will have
to understand that this piece of API they rely on might be gone without prior notice).

## Current BC layer

### Blocking/non-blocking assets for backend

Before 3.0 all contributed JS/CSS assets to backend are considered as blocking, when 3.0 is released  all assets will be considered
as non blocking and if you still want your asset to be considered as blocking suffix it with "!". Already now you can
start marking your assets as blocking using ! if you are sure that those are needed to be loaded before backend page
has rendered.

If you still want to mark some assets as non-blocking even now, then you can use `non_blocking_assets_patterns` configuration
property. This, for instance, will mark all assets which match `^/bundles/moderabackend.*` regexp as non-blocking:

    modera_backend_on_steroids:
        non_blocking_assets_patterns:
            - ^/bundles/moderabackend.*

`non_blocking_assets_patterns` configuration property will be removed from `\Modera\BackendOnSteroidsBundle\DependencyInjection\Configuration`.