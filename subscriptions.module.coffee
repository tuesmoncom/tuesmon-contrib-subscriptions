moduleName = 'subscriptions'

window.tuesmonContribPlugins = [] if !window.tuesmonContribPlugins

window.tuesmonContribPlugins.push({
        type: 'userSettings',
        template: 'compile-modules/tuesmon-contrib-subscriptions/partials/tuesmon-app.html',
        name: 'Tuesmon App',
        slug: 'tuesmon-app',
        module: moduleName,
        userMenu: true,
        headerMenu: true,
        authenticated: true,
    },
    {
        type: 'userSettings',
        template: 'compile-modules/tuesmon-contrib-subscriptions/subscriptions.html',
        name: 'Paid Plans',
        slug: 'subscriptions',
        module: moduleName,
        userMenu: true,
        headerMenu: true,
        authenticated: true,
        headerHtml: (user) ->
            if user.get('max_private_projects') == 1
                return "<div class='upgrade-header-button'>Upgrade</div>"
            return ""
})

angular.module(moduleName, [])
