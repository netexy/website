require.config({
    paths: {
        // 'teaser-media-selection': '../teaser-media-selection',
        suluframework: '../../suluframework/js'
    }
});

define(function() {

    'use strict';

    return {

        name: "App Bundle",

        initialize: function(app) {
            alert('dist');

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
