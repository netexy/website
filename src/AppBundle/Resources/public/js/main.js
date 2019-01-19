require.config({
    paths: {
        // 'teaser-media-selection': '../teaser-media-selection',
        suluframework: '../../suluframework/js',
        sulucontent: '../../sulucontent/js'
    }
});

define(function() {

    'use strict';

    // alert('aaaaaaa')

    return {

        name: "App Bundle",

        initialize: function(app) {

            // alert('src')

            app.components.addSource('suluframework', '/bundles/suluframework/js/components');

            app.sandbox.mvc.routes.push({
                route: 'netexy/webspace',
                callback: function() {
                    return '<div data-aura-component="teaser-media-selection/list@suluframework" data-aura-name="sulu" />';
                }
            });
        }
    };
});
