Ext.define('App.welcome.runtime.MainActivity', {
    extend: 'MF.activation.activities.AbstractActivity',

    // override
    workbenchPadding: '15px',

    // l10n
    welcomeText: 'Welcome to Modera Foundation',

    // override
    isHomeActivity: function() {
        return true;
    },

    // override
    getId: function() {
        return 'main';
    },

    // override
    doCreateUi: function(params, callback) {
        callback(Ext.create('Ext.panel.Panel', {
            basePanel: true,
            layout: {
                type: 'vbox',
                align: 'center',
                pack: 'center'
            },
            items: [
                {
                    xtype: 'box',
                    html: this.welcomeText,
                    style: {
                        fontSize: '20px'
                    },
                }
            ]
        }));
    }
});
