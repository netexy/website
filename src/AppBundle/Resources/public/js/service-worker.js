var CACHE_PREFIX = 'vrt-page-';
var CACHE_VERSION = 1;
var CACHE_NAME = CACHE_PREFIX + CACHE_VERSION;
var MAX_AGE = 2592000;
var cacheUrls = [
          '/',
          '/index.html',
          '/js/widget-all.js',
          '/css/style-112.css',
          '/img/cover/if/cover-mobile.jpg',
          '/img/icons/logo-144.png',
          '/img/products/mobile-hydropark_deluxe.jpg',
          '/img/products/mobile-lystopad.jpg',
          '/img/products/mobile-mistechko_kozacke.jpg',
          '/img/products/mobile-veselka_richkova.jpg',
          '/fonts/sfpro/text/sf-pro-text_regular.woff2',
          '/fonts/sfpro/display/sf-pro-display_semibold.woff2',
          '/fonts/sfpro/display/sf-pro-display_light.woff2',
          '/fonts/iconfont/MaterialIcons-Regular.woff2',

          // Do not replace/delete/edit the sw.js/ and manifest.js paths below
          '/sw-119.js/',
          '/manifest.js',

          // These are links to the extenal social media buttons that should be cached if any exists.

          'https://connect.facebook.net/uk_UA/sdk.js#xfbml=1&version=v2.11&appId=185925898632558'
];

//after a service worker is installed and the user navigates to a different page or refreshes, 
//the service worker will begin to receive fetch events
self.addEventListener('fetch', function (event) {
    event.respondWith(caches.open(CACHE_NAME).then(function (cache) {      
                 // ищем запрошенный ресурс среди закэшированных
        return caches.match(event.request).then(function(cachedResponse) {
            var lastModified, fetchRequest;

            // если ресурс есть в кэше
            if (cachedResponse) {
                // получаем дату последнего обновления
                lastModified = new Date(cachedResponse.headers.get('last-modified'));
                // и если мы считаем ресурс устаревшим
                if (lastModified && (Date.now() - lastModified.getTime()) > MAX_AGE) {
                    
                    fetchRequest = event.request.clone();
                    // создаём новый запрос
                    return fetch(fetchRequest).then(function(response) {
                        // при неудаче всегда можно выдать ресурс из кэша
                        if (!response || response.status !== 200) {
                            return cachedResponse;
                        }
                        // обновляем кэш
                        caches.open(CACHE_NAME).then(function(cache) {
                            return cache.addAll(cacheUrls);
                        });
                        // возвращаем свежий ресурс
                        return response;
                    }).catch(function() {
                        return cachedResponse;
                    });
                }
                return cachedResponse;
            }

            // запрашиваем из сети как обычно
            return cachedResponse || fetch(event.request);
        })
    }));
});
