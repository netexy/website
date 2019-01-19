/*
 * This file is part of the Sulu CMS.
 *
 * (c) MASSIVE ART WebServices GmbH
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */

/**
 * handles media selection
 *
 * @class MediaSelection
 * @constructor
 */
define([
    'underscore',
    'services/sulumedia/overlay-manager',
    'services/sulumedia/user-settings-manager'
], function(_, OverlayManager, UserSettingsManager) {

    'use strict';

    var defaults = {
            eventNamespace: 'sulu.media-selection',
            thumbnailKey: 'thumbnails',
            thumbnailSize: 'sulu-50x50',
            formats: [],
            resultKey: 'media',
            dataAttribute: 'media-selection',
            actionIcon: 'fa-file-image-o',
            types: null,
            url: '/admin/api/media',
            navigateEvent: 'sulu.router.navigate',
            locale: '',
            dataDefault: {
                displayOption: 'top',
                ids: []
            },
            hideConfigButton: true,
            translations: {
                noContentSelected: 'media-selection.nomedia-selected',
                addImages: 'media-selection.add-images',
                choose: 'public.choose',
                collections: 'media-selection.collections',
                upload: 'media-selection.upload-new',
                collection: 'media-selection.upload-to-collection',
                createNewCollection: 'media-selection.create-new-collection',
                newCollection: 'media-selection.new-collection',
                crop: 'sulu-media.crop'
            }
        },

        /**
         * raised when a record has been deselected
         * @event sulu.media-selection.record-deselected
         */
        RECORD_DESELECTED = function() {
            return createEventName.call(this, 'record-deselected');
        },

        /**
         * returns normalized event names
         */
        createEventName = function(postFix) {
            return this.options.eventNamespace +
                '.' + (this.options.instanceName ? this.options.instanceName + '.' : '') + postFix;
        },

        templates = {
            contentItem: function(id, collection, title, thumbnail, fallbackLocale, type, cropText) {
                var content = [
                    '<a href="#" class="media-selection-item link" data-id="', id, '" data-collection="', collection, '">'
                ];

                if (thumbnail) {
                    content.push([
                        '<span class="image">',
                        '    <img src="', thumbnail, '"/>',
                        '</span>'
                    ].join(''));
                }

                if (fallbackLocale) {
                    content.push('<div class="badges">');
                    content.push('    <span class="badge">', fallbackLocale, '</span>');
                    content.push('</div>');
                }

                content.push('<span class="title">', title, '</span>');
                if (type === 'image') {
                    content.push('<span class="crop"><span class="fa-crop"></span>', cropText, '</span>');
                }

                content.push('</a>');

                return content.join('');
            }
        },

        /**
         * custom event handling
         */
        bindCustomEvents = function() {
            this.sandbox.on(this.DISPLAY_OPTION_CHANGED(), function(position) {
                setData.call(this, {displayOption: position}, false);
            }, this);

            this.sandbox.on(this.DATA_RETRIEVED(), function(data) {
                var ids = [];
                this.sandbox.util.foreach(data, function(el) {
                    this.items[el.id] = el;
                    ids.push(el.id);
                }.bind(this));

                setData.call(this, {ids: ids}, false);
            }, this);

            this.sandbox.on(this.ADD_BUTTON_CLICKED(), function() {
                var items = this.getItems();

                this.sandbox.emit(
                    'sulu.media-selection-overlay.' + this.options.instanceName + '.set-items',
                    items
                );
                this.sandbox.emit('sulu.media-selection-overlay.' + this.options.instanceName + '.open');
            }.bind(this));
        },

        /**
         * Bind events to dom elements
         */
        bindDomEvents = function() {
            this.$el.on('click', '.crop', function(event) {
                event.preventDefault();
                event.stopImmediatePropagation();

                var id = $(event.currentTarget).parents('a').data('id');
                OverlayManager.startEditMediaOverlay.call(
                    this,
                    id,
                    UserSettingsManager.getMediaLocale(),
                    'crop',
                    this.options.formats
                );
            }.bind(this));

            this.$el.on('click', 'a.link', function(e) {
                var id = this.sandbox.dom.data(e.currentTarget, 'id'),
                    collection = this.sandbox.dom.data(e.currentTarget, 'collection');

                this.sandbox.emit(
                    this.options.navigateEvent,
                    'media/collections/edit:' + collection + '/files/edit:' + id
                );

                return false;
            }.bind(this));
        },

        /**
         * Starts the selection-overlay component
         */
        startSelectionOverlay = function() {
            var $container = this.sandbox.dom.createElement('<div/>');
            this.sandbox.dom.append(this.$el, $container);
            this.sandbox.start([{
                name: 'media-selection/overlay@sulumedia',
                options: {
                    el: $container,
                    url: this.options.url,
                    instanceName: this.options.instanceName,
                    preselected: this.getItems(),
                    removeOnClose: false,
                    autoStart: false,
                    removeable: false,
                    types: this.options.types,
                    locale: this.options.locale,
                    saveCallback: function(items) {
                        var data = this.getData();
                        _.each(data.ids, this.removeItemById.bind(this));

                        data.ids = _.map(items, function(item) {
                            this.addItem(item);
                            this.items[item.id] = item;

                            return item.id;
                        }.bind(this));

                        this.setData(data, false);
                    }.bind(this)
                }
            }]);
        },

        setData = function(data, reinitialize) {
            var oldData = this.getData();

            for (var propertyName in data) {
                if (data.hasOwnProperty(propertyName)) {
                    oldData[propertyName] = data[propertyName];
                }
            }

            this.setData(oldData, reinitialize);
        };

    return {
        type: 'itembox',

        items: [],

        initialize: function() {
            // extend default options
            this.options = this.sandbox.util.extend(true, {}, defaults, this.options);

            var data = this.getData();

            this.options.ids = {
                container: 'media-selection-' + this.options.instanceName + '-container',
                addButton: 'media-selection-' + this.options.instanceName + '-add',
                configButton: 'media-selection-' + this.options.instanceName + '-config',
                displayOption: 'media-selection-' + this.options.instanceName + '-display-option',
                content: 'media-selection-' + this.options.instanceName + '-content',
                chooseTab: 'media-selection-' + this.options.instanceName + '-choose-tab',
                uploadTab: 'media-selection-' + this.options.instanceName + '-upload-tab',
                loader: 'media-selection-' + this.options.instanceName + '-loader',
                collectionSelect: 'media-selection-' + this.options.instanceName + '-collection-select',
                dropzone: 'media-selection-' + this.options.instanceName + '-dropzone'
            };

            bindCustomEvents.call(this);
            bindDomEvents.call(this);

            this.render();

            // set display option
            if (!!data.displayOption) {
                this.setDisplayOption(data.displayOption);
            }

            startSelectionOverlay.call(this);
        },

        getItems: function() {
            return _.map(this.getData().ids, function(id) {
                if (this.items[id]) {
                    return this.items[id];
                }

                return {id: id};
            }.bind(this))
        },

        isDataEmpty: function(data) {
            return this.sandbox.util.isEmpty(data.ids);
        },

        getUrl: function(data) {
            var delimiter = (this.options.url.indexOf('?') === -1) ? '?' : '&';

            return [
                this.options.url,
                delimiter,
                this.options.idsParameter, '=', (data.ids || []).join(','),
                '&locale=', this.options.locale
            ].join('');
        },

        getItemContent: function(item) {
            return templates.contentItem(
                item.id,
                item.collection,
                item.title,
                item.thumbnails ? item.thumbnails[this.options.thumbnailSize] : null,
                item.locale !== this.options.locale ? item.locale : null,
                item.type,
                this.sandbox.translate(this.options.translations.crop)
            );
        },

        sortHandler: function(ids) {
            var data = this.getData();
            data.ids = ids;

            this.setData(data, false);
        },

        removeHandler: function(id) {
            var data = this.getData();
            delete this.items[id];

            for (var i = -1, length = data.ids.length; ++i < length;) {
                if (data.ids[i] === id) {
                    data.ids.splice(data.ids.indexOf(id), 1);
                    break;
                }
            }
            this.sandbox.emit(RECORD_DESELECTED.call(this), id);
            this.setData(data, false);
        }
    };
});
