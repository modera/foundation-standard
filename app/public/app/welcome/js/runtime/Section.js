Ext.define('App.welcome.runtime.Section', {
    extend: 'MF.runtime.MediatorSection',

    // override
    getActivities: function(callback) {
        callback({
            main: Ext.create('App.welcome.runtime.MainActivity')
        });
    }
});
