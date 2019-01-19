/*
 * This file is part of the Sulu CMS.
 *
 * (c) MASSIVE ART WebServices GmbH
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */


// 'text!./item.html'
//
// /Users/zorkyy/www/web-projects/netexy/vendor/sulu/sulu/src/Sulu/Bundle/ContentBundle/Resources/public/js/components/teaser-selection/main.js

// todo: web/bundles/sulucontent/js/components/teaser-selection/main.js:230 - make use of event handlers.

/**
 * Handles articles for teaser-selection.
 *
 * @class ListArticleTeaser
 * @constructor
 */
define([
    'underscore',
    'config',
    'services/sulumedia/collection-manager',
    'services/sulumedia/user-settings-manager',
    // 'text!./skeleton.html'
    'text!./item.html'
    ], function(_, Config, CollectionManager, UserSettingsManager, itemTemplate) {

    'use strict';

    var constants = {
            listContainerSelector: '.list-container',
            overlayBackButtonSelector: '.overlay-container .back',
            dropzoneWrapperContainer: '.dropzone-wrapper-container',
            newFormSelector: '#collection-new'
        },

        emptyCollection = {
            title: '',
            description: ''
        },

        getRootData = function() {
            return {
                title: this.sandbox.translate('sulu.media.all-collections'),
                hasSub: true
            };
        };

    return {


        // templates: [
            // '/admin/media/template/collection/new'

        // ],

        defaults: {
            options: {
                // eventNamespace: 'sulu.article-selection',
                // dataAttribute: 'article-selection',
                dataDefault: [],
                resultKey: null,
                searchFields: [],
                instanceName: 'teaser-selection',
                selectCallback: function(item) {
                },
                preselected: [],
                url: '/admin/api/media',
                // singleSelect: false,
                singleSelect: true,
                removeable: true,
                locale: UserSettingsManager.getMediaLocale(),
                types: null,
                removeOnClose: false,
                openOnStart: false,
                saveCallback: function() {
                    return;
                },
                removeCallback: function() {
                    return;
                }
            },

            templates: {
                item: itemTemplate,
                url: [
                    '<%= url %>?locale=<%= locale %>',
                    '<% if (!!types) {%>&types=<%= types %><% } %>',
                    '<% _.each(params, function(value, key) {%>&<%= key %>=<%= value %><% }) %>'
                ].join('')
            },

            translations: {
                save: 'sulu-media.selection.overlay.save',
                remove: 'public.remove',
                uploadInfo: 'media-selection.list-toolbar.upload-info',
                allMedias: 'media-selection.overlay.all-medias'
            }
        },

        events: {
            names: {
                setItems: {
                    postFix: 'set-items',
                    type: 'on'
                },
                open: {
                    postFix: 'open',
                    type: 'on'
                }
            },
            namespace: 'sulu.media-selection-overlay.'
        },

        filter: {},

        items: [],


        loadedItems: {},

        initialized: false,

        initialize: function() {
            this.data = {};

            // this.initializeDialog();
            // var $container = $('<div/>');
            this.openMediaOverlay(this.$el);

            // this.startSandbox();

            // if (!initialized) {
                this.bindCollectionViewEvents();
                // this.bindDomEvents();
                this.bindCustomEvents();
            // }

            // this.initialized = true;
        },

        startSandbox: function(){
            this.sandbox.start([
                {
                    name: 'overlay@husky',
                    options: {
                        triggerEl: this.$addButton,
                        cssClass: 'article-content-overlay',
                        el: $container,
                        removeOnClose: false,
                        container: this.$el,
                        instanceName: this.options.instanceName,
                        skin: 'large',
                        slides: [
                            // {
                            //     title: this.translations.overlayTitle,
                            //     okCallback: getAddOverlayData.bind(this),
                            //     tabs: tabs,
                            //     data: $data
                            // },
                            {
                                title: this.translations.authoredTitle,
                                cssClass: 'authored-slide',
                                contentSpacing: true,
                                okDefaultText: this.translations.apply,
                                okCallback: function() {
                                    this.sandbox.emit('sulu_article.article-selection.' + this.options.instanceName + '.ok-button.clicked');

                                    return false;
                                }.bind(this),
                                cancelCallback: function() {
                                    this.sandbox.emit('husky.overlay.' + this.options.instanceName + '.slide-to', 0);

                                    return false;
                                }.bind(this)
                            },
                            {
                                title: this.translations.contactTitle,
                                cssClass: 'contact-slide',
                                contentSpacing: true,
                                okDefaultText: this.translations.apply,
                                okCallback: function() {
                                    this.sandbox.emit('sulu_article.article-selection.' + this.options.instanceName + '.ok-button.clicked');

                                    return false;
                                }.bind(this),
                                cancelCallback: function() {
                                    this.sandbox.emit('husky.overlay.' + this.options.instanceName + '.slide-to', 0);

                                    return false;
                                }.bind(this)
                            },
                            {
                                title: this.translations.categoryTitle,
                                cssClass: 'category-slide',
                                contentSpacing: true,
                                okDefaultText: this.translations.apply,
                                okCallback: function() {
                                    this.sandbox.emit('sulu_article.article-selection.' + this.options.instanceName + '.ok-button.clicked');

                                    return false;
                                }.bind(this),
                                cancelCallback: function() {
                                    this.sandbox.emit('husky.overlay.' + this.options.instanceName + '.slide-to', 0);

                                    return false;
                                }.bind(this)
                            },
                            {
                                title: this.translations.tagTitle,
                                cssClass: 'tag-slide',
                                contentSpacing: true,
                                okDefaultText: this.translations.apply,
                                okCallback: function() {
                                    this.sandbox.emit('sulu_article.article-selection.' + this.options.instanceName + '.ok-button.clicked');

                                    return false;
                                }.bind(this),
                                cancelCallback: function() {
                                    this.sandbox.emit('husky.overlay.' + this.options.instanceName + '.slide-to', 0);

                                    return false;
                                }.bind(this)
                            },
                            {
                                title: this.translations.pageTitle,
                                cssClass: 'page-slide data-source-slide',
                                contentSpacing: true,
                                okDefaultText: this.translations.apply,
                                okCallback: function() {
                                    this.sandbox.emit('sulu_article.article-selection.' + this.options.instanceName + '.ok-button.clicked');

                                    return false;
                                }.bind(this),
                                cancelCallback: function() {
                                    this.sandbox.emit('husky.overlay.' + this.options.instanceName + '.slide-to', 0);

                                    return false;
                                }.bind(this)
                            }
                        ]
                    }
                }
            ]);
        },


        getItem: function(id) {
            var items = this.getData().items || [],
                parts = id.split(';');

            return _.find(items, function(item) {
                return item.type == parts[0] && item.id == parts[1];
            });
        },


        openMediaOverlay: function($element) {
            var $container = $('<div/>'),
                id = $element.data('id'),
                _this = this,
                options = this.options,
                sandbox = this.sandbox;
            // apiItem = this.getApiItem(id);
            this.$el.append($container);
            this.$el.closest('.husky-overlay-container').replaceWith($container);
            this.$el = $container;

            // debugger;
            this.sandbox.start([{
                name: 'media-selection/overlay@sulumedia',
                options: {
                    el: $container,
                    // preselected: [apiItem.mediaId],
                    preselected: options.preselected,
                    instanceName: options.instanceName,
                    // instanceName: 'teaser-' + options.instanceName,
                    removeOnClose: true,
                    openOnStart: true,
                    singleSelect: true,
                    locale: this.options.locale,
                    // saveCallback: function (items) {
                    //     var item = items[0],
                    //         $image = $element.find('.image-content');
                    //
                    //     console.log('Item to render: ', getItemContent(item));
                    //
                    //     $image.removeClass('fa-picture-o');
                    //     $image.html('<img class="mediaId" data-id="' + item.id + '" src="' + item.thumbnails['sulu-50x50'] + '"/>');
                    // },
                    // removeCallback: function () {
                    //     var $image = $element.find('.image-content');
                    //
                    //     $image.addClass('fa-picture-o');
                    //     $image.html('');
                    // }
                }
            }])
                .then(function () {
                    this.setItems(options.preselected);

                    if (!!options.openOnStart) {
                        // this.startOverlayComponents();

                        return;
                    }

                    sandbox.once('husky.overlay.' + options.instanceName + '.opened', function () {
                        // this.startOverlayComponents();
                    }.bind(this));

                }.bind(this) )
        },

        bindCustomEvents: function() {
            // this.sandbox.on('husky.datagrid.' + this.options.instanceName + '.item.select', function(id) {
            //     this.options.selectCallback({type: this.options.type, id: id});
            // }.bind(this));
            // this.sandbox.on('husky.datagrid.' + this.options.instanceName + '.item.deselect', function(id) {
            //     this.options.deselectCallback({type: this.options.type, id: id});
            // }.bind(this));
            this.sandbox.once('sulu_content.teaser-selection.' + this.options.instanceName + '.cancel-button.clicked', function() {
                this.$el.parent().removeClass('limited');
                this.sandbox.emit('husky.overlay.' + this.options.instanceName + '.slide-to', 0);
            }.bind(this));
        },

        bindCollectionViewEvents: function() {
            this.sandbox.once(
                'sulu.collection-view.' + this.options.instanceName + '.asset.clicked',
                function(id, item) {
                    if (this.options.singleSelect) {
                        this.setItems([item]);
                        this.save();
                        this.sandbox.emit('husky.overlay.' + this.options.instanceName + '.close');
                    }
                },
                this
            );

            this.sandbox.once('sulu.collection-view.' + this.options.instanceName + '.asset.added', function(id, item) {
                this.addItem(item);
            }.bind(this));

            this.sandbox.once('sulu.collection-view.' + this.options.instanceName + '.asset.removed', function(id) {
                this.removeItem(id);
            }.bind(this));

            // this.sandbox.on(
            //     'sulu.collection-view.' + this.options.instanceName + '.folder.clicked',
            //     this.renderCollectionView,
            //     this
            // );
            //
            // this.sandbox.on(
            //     'sulu.collection-view.' + this.options.instanceName + '.folder.breadcrumb-clicked',
            //     this.handleBreadcrumbClick,
            //     this
            // );
            //
            // this.sandbox.on(
            //     'sulu.collection-view.' + this.options.instanceName + '.folder.add-clicked',
            //     this.slideToAddForm,
            //     this
            // );
        },

        getItemContent: function(item) {
            // var localItem = this.getItem(item.teaserId),
            // edited = this.isEdited(localItem);

            // this.apiItems[item.teaserId] = item;

            // item = _.defaults(localItem, item);

            // fixme: temporary solution.
            item.mediaId = item.id;
            item.apiItem = {
                title: item.title,
                moreText: ''
            };
            // item.descriptionText =

            return this.templates.item(
                _.defaults(item, {
                    // apiItem: this.apiItems[item.teaserId],
                    translations: this.translations,

                    // descriptionText: item.description,
                    // types: this.options.types,
                    // translate: this.sandbox.translate,

                    descriptionText: '',
                    type: 'media_teaser',
                    types: {
                        media_teaser: {
                            title: 'Media Teaser'
                        }
                    },
                    translate: this.sandbox.translate,

                    locale: this.options.locale,
                    mediaId: null,
                    // edited: edited
                    edited: false
                })
            );
        },

        saveCallback: function (items) {
            var item = items[0],
                $container = this.$el.closest('.teaser-selection-container').find('.content>.items-list');

            console.log('Item to render: ', this.getItemContent(item));
            // todo: fix; make sortable
            var rendered = '<li data-id="' + 'media;' + item.mediaId + '">' + this.getItemContent(item) + '</li>';
            $container.append(rendered);

            // $image.removeClass('fa-picture-o');
            // $image.html('<img class="mediaId" data-id="' + item.id + '" src="' + item.thumbnails['sulu-50x50'] + '"/>');
        },
        removeCallback: function () {
            var $image = this.$el.find('.image-content');
            debugger;

            $image.addClass('fa-picture-o');
            $image.html('');
        },

        save: function() {
            // todo: test
            this.saveCallback.call(this, this.getData());
            // todo: all as "LI"
            // $el.closest('.husky-overlay-container');
        },

        getData: function() {
            return _.map(this.items, function(item) {
                if (!this.loadedItems || !this.loadedItems[item.id]) {
                    return item;
                }

                return this.loadedItems[item.id];
            }.bind(this));
        },

        setItems: function(items) {
            this.items = items;

            var ids = _.map(this.items, function(item) {
                return parseInt(item.id);
            });

            this.sandbox.emit('husky.datagrid.' + this.options.instanceName + '.selected.update', ids);
        },

        addItem: function(item) {
            if (this.has(item.id)) {
                return false;
            }

            this.items.push(item);

            console.log('Item added!', item);

            return true;
        },

        removeItem: function(id) {
            this.items = _.filter(this.items, function(item) {
                if (item.id === id) {
                    console.log('Item removed!', item);
                }
                return item.id !== id;
            });
        },

        has: function(id) {
            return !!_.filter(this.items, function(item) {
                return item.id === id;
            }).length;
        },


        changeType: function(item) {
            var type = item.id;
            if (item.id === 'all') {
                type = null;
            }

            this.sandbox.emit('husky.datagrid.' + this.options.instanceName + '.url.update', {type: type});
        }
    };
});






