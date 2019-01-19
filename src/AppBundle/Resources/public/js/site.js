var scriptFile = (function() {
    var
        filename = "fileName"
        , stack = "stack"
        , stacktrace = stack + "trace"
        , loc
        , matcher = function (stack, matchedLoc) {
            loc = matchedLoc;
        }
    ;

    try {
        0();
    } catch (ex) {
        if (filename in ex) { // Firefox
            loc = ex[filename];
        } else if (stacktrace in ex) { // Opera
            ex[stacktrace].replace(/called from line \d+, column \d+ in (.*):/gm, matcher);
        } else if (stack in ex) { // WebKit, Blink, and IE10
            ex[stack].replace(/at.*?\(?(\S+):\d+:\d+\)?$/g, matcher);
        }
        return loc;
    }
}());
// to know relative path to this script
var baseURI = location.protocol + "//" + location.host + "/";
var currentScriptLocation = scriptFile.substr(baseURI.length - 1);
currentScriptLocation = currentScriptLocation.substr(0, currentScriptLocation.lastIndexOf("/"));

!function (e) {
    function t(n) {
        if (i[n]) return i[n].exports;
        var r = i[n] = {exports: {}, id: n, loaded: !1};
        return e[n].call(r.exports, r, r.exports, t), r.loaded = !0, r.exports
    }

    var i = {};

    return t.m = e, t.c = i, t.p = currentScriptLocation, t(0)
}([function (e, t, i) {
    e.exports = i(1)
}, function (e, t, i) {
    "use strict";

    function n(e) {
        return e && e.__esModule ? e : {default: e}
    }

    var r = i(2), s = n(r), o = function () {
            document.documentElement.classList.remove("no-js"), document.documentElement.classList.add("js"), i(3), i(4), i(6), i(12), i(13), i(14), i(15)(), i(17)()
        }, a = function () {
            return "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", o) : o()
        },
        l = ["Array.prototype.find", "Element.prototype.classList", "Element.prototype.dataset", "IntersectionObserver", "matchMedia", "Promise"],
        c = currentScriptLocation + "/polyfill.min.js";
    (0, s.default)(c, {success: a})
}, function (e, t, i) {
    var n, r, s;
    !function (i, o) {
        r = [], n = o, s = "function" == typeof n ? n.apply(t, r) : n, !(void 0 !== s && (e.exports = s))
    }(this, function () {
        function e(e, t) {
            e = e.push ? e : [e];
            var i, n, r, s, o = [], a = e.length, u = a;
            for (i = function (e, i) {
                i.length && o.push(e), u--, u || t(o)
            }; a--;) n = e[a], r = l[n], r ? i(n, r) : (s = c[n] = c[n] || [], s.push(i))
        }

        function t(e, t) {
            if (e) {
                var i = c[e];
                if (l[e] = t, i) for (; i.length;) i[0](e, t), i.splice(0, 1)
            }
        }

        function i(e, t) {
            e.call && (e = {success: e}), t.length ? (e.error || o)(t) : (e.success || o)(e)
        }

        function n(e, t, i, r) {
            var s, a, l = document, c = i.async, u = (i.numRetries || 0) + 1, d = i.before || o;
            r = r || 0, /(^css!|\.css$)/.test(e) ? (s = !0, a = l.createElement("link"), a.rel = "stylesheet", a.href = e.replace(/^css!/, "")) : (a = l.createElement("script"), a.src = e, a.async = void 0 === c || c), a.onload = a.onerror = a.onbeforeload = function (o) {
                var l = o.type[0];
                if (s && "hideFocus" in a) try {
                    a.sheet.cssText.length || (l = "e")
                } catch (e) {
                    l = "e"
                }
                return "e" == l && (r += 1, r < u) ? n(e, t, i, r) : void t(e, l, o.defaultPrevented)
            }, d(e, a) !== !1 && l.head.appendChild(a)
        }

        function r(e, t, i) {
            e = e.push ? e : [e];
            var r, s, o = e.length, a = o, l = [];
            for (r = function (e, i, n) {
                if ("e" == i && l.push(e), "b" == i) {
                    if (!n) return;
                    l.push(e)
                }
                o--, o || t(l)
            }, s = 0; s < a; s++) n(e[s], r, i)
        }

        function s(e, n, s) {
            var o, l;
            if (n && n.trim && (o = n), l = (o ? s : n) || {}, o) {
                if (o in a) throw"LoadJS";
                a[o] = !0
            }
            r(e, function (e) {
                i(l, e), t(o, e)
            }, l)
        }

        var o = function () {
        }, a = {}, l = {}, c = {};
        return s.ready = function (t, n) {
            return e(t, function (e) {
                i(n, e)
            }), s
        }, s.done = function (e) {
            t(e, [])
        }, s.reset = function () {
            a = {}, l = {}, c = {}
        }, s.isDefined = function (e) {
            return e in a
        }, s
    })
}, function (e, t) {
    "use strict";
    var i = '.external, [rel="external"], [href$=".pdf"]';
    document.body.addEventListener("click", function (e) {
        "A" === e.target.tagName && e.target.matches(i) && (e.preventDefault(), window.open(e.target.href))
    })
}, function (e, t, i) {
    "use strict";
    i(5)(), window.Element.prototype.matches || (window.Element.prototype.matches = window.Element.prototype.msMatchesSelector)
}, function (e, t, i) {
    var n, r;
    !function (i, s) {
        n = [], r = function () {
            return i.svg4everybody = s()
        }.apply(t, n), !(void 0 !== r && (e.exports = r))
    }(this, function () {/*! svg4everybody v2.1.8 | github.com/jonathantneal/svg4everybody */
        function e(e, t, i) {
            if (i) {
                var n = document.createDocumentFragment(), r = !t.hasAttribute("viewBox") && i.getAttribute("viewBox");
                r && t.setAttribute("viewBox", r);
                for (var s = i.cloneNode(!0); s.childNodes.length;) n.appendChild(s.firstChild);
                e.appendChild(n)
            }
        }

        function t(t) {
            t.onreadystatechange = function () {
                if (4 === t.readyState) {
                    var i = t._cachedDocument;
                    i || (i = t._cachedDocument = document.implementation.createHTMLDocument(""), i.body.innerHTML = t.responseText, t._cachedTarget = {}), t._embeds.splice(0).map(function (n) {
                        var r = t._cachedTarget[n.id];
                        r || (r = t._cachedTarget[n.id] = i.getElementById(n.id)), e(n.parent, n.svg, r)
                    })
                }
            }, t.onreadystatechange()
        }

        function i(i) {
            function r() {
                for (var i = 0; i < g.length;) {
                    var a = g[i], l = a.parentNode, c = n(l);
                    if (c) {
                        var u = a.getAttribute("xlink:href") || a.getAttribute("href");
                        if (!u && o.attributeName && (u = a.getAttribute(o.attributeName)), s) if (!o.validate || o.validate(u, c, a)) {
                            l.removeChild(a);
                            var d = u.split("#"), p = d.shift(), v = d.join("#");
                            if (p.length) {
                                var y = h[p];
                                y || (y = h[p] = new XMLHttpRequest, y.open("GET", p), y.send(), y._embeds = []), y._embeds.push({
                                    parent: l,
                                    svg: c,
                                    id: v
                                }), t(y)
                            } else e(l, c, document.getElementById(v))
                        } else ++i, ++m
                    } else ++i
                }
                (!g.length || g.length - m > 0) && f(r, 67)
            }

            var s, o = Object(i), a = /\bTrident\/[567]\b|\bMSIE (?:9|10)\.0\b/, l = /\bAppleWebKit\/(\d+)\b/,
                c = /\bEdge\/12\.(\d+)\b/, u = /\bEdge\/.(\d+)\b/, d = window.top !== window.self;
            s = "polyfill" in o ? o.polyfill : a.test(navigator.userAgent) || (navigator.userAgent.match(c) || [])[1] < 10547 || (navigator.userAgent.match(l) || [])[1] < 537 || u.test(navigator.userAgent) && d;
            var h = {}, f = window.requestAnimationFrame || setTimeout, g = document.getElementsByTagName("use"), m = 0;
            s && r()
        }

        function n(e) {
            for (var t = e; "svg" !== t.nodeName.toLowerCase() && (t = t.parentNode);) ;
            return t
        }

        return i
    })
}, function (e, t, i) {
    "use strict";
    var n = i(7), r = i(8), s = i(10), o = n.block("header").selector, a = document.querySelector(o()),
        l = document.querySelector(o("placeholder")), c = function () {
            return a && s.mq("tablet-small")
        }, u = a && a.classList.contains("site-header--overlay"), d = null, h = null, f = 0, g = !0, m = null,
        p = function () {
            if (c()) {
                var e = l.getBoundingClientRect(), t = document.body.getBoundingClientRect().top;
                d = e.bottom - t, h = e.top - t, m = a.getBoundingClientRect().bottom - t
            }
        }, v = function (e, t) {
            if (c()) {
                var i = t < f, r = t + (d - h) <= m, s = t < d && (u || g || t <= h);
                i && a.classList.toggle(n.states.static, s), a.classList.toggle(n.states.active, i && (!u || !r) || s), f = t, g = s
            }
        };
    s.addListener("header", p), p(), r.addListener("header", v)
}, function (e, t) {
    "use strict";
    e.exports = {
        states: {active: "is-active", static: "is-static"}, block: function (e) {
            if (!e) throw new Error("Empty block name.");
            return {
                event: function (t) {
                    return e + ":" + t
                }, selector: function (t) {
                    return ".js-" + e + (t ? "__" + t : "")
                }
            }
        }
    }
}, function (e, t, i) {
    "use strict";
    var n = i(9), r = 0, s = 0, o = {}, a = function () {
        return Object.keys(o).forEach(function (e) {
            return o[e](r, s)
        })
    }, l = function () {
        r = window.pageXOffset, s = window.pageYOffset, n(a)
    };
    window.addEventListener("scroll", l), l(), e.exports = {
        get x() {
            return r
        }, get y() {
            return s
        }, addListener: function (e, t) {
            o[e] = t
        }, removeListener: function (e) {
            delete o[e]
        }
    }
}, function (e, t) {
    "use strict";
    e.exports = function (e) {
        window.requestAnimationFrame ? window.requestAnimationFrame(e) : e()
    }
}, function (e, t, i) {
    "use strict";
    var n = 0, r = 0, s = void 0, o = void 0, a = null, l = {}, c = {}, u = i(11), d = function () {
        s = n, o = r, n = window.innerWidth, r = window.innerHeight, Object.keys(c).forEach(function (e) {
            c[e](s !== n, o !== r)
        })
    };
    window.addEventListener("resize", function () {
        clearTimeout(a), a = setTimeout(d, 300)
    }), d(), Object.keys(u.breakpoints).forEach(function (e) {
        var t = u.breakpoints[e];
        u["em-media-queries"] && (t /= u["browser-default-font-size"] || 16), l[e] = t
    }), e.exports = {
        get width() {
            return n
        }, get height() {
            return r
        }, addListener: function (e, t) {
            c[e] = t
        }, removeListener: function (e) {
            delete c[e]
        }, mq: function (e) {
            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "min",
                i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "width", n = l[e];
            if (!n) throw new Error("Unkown breakpoint: " + e + " is not defined");
            "max" === t && (n -= u["em-media-queries"] ? .01 : 1);
            var r = u["em-media-queries"] ? "em" : "px";
            return window.matchMedia("only screen and (" + t + "-" + i + ": " + n + r + ")").matches
        }
    }
}, function (e, t) {
    "use strict";
    e.exports = {
        "rems-on": !0,
        "em-media-queries": !0,
        "browser-default-font-size": 16,
        breakpoints: {
            phone: 375,
            "phone-wide": 480,
            phablet: 560,
            "tablet-small": 640,
            tablet: 768,
            "tablet-wide": 1024,
            desktop: 1248,
            "desktop-wide": 1500
        }
    }
}, function (e, t) {
    "use strict";

    function i() {
        var e = new google.maps.LatLng(53.797376, -1.534393), t = new google.maps.LatLng(53.798912, -1.532769),
            i = new google.maps.LatLng(53.797237, -1.53183), r = new google.maps.LatLng(53.796483, -1.536953),
            s = new google.maps.LatLng(53.79706, -1.53413), o = 16, a = [{
                featureType: "administrative",
                elementType: "labels.text.fill",
                stylers: [{color: "#444444"}]
            }, {
                featureType: "administrative.neighborhood",
                elementType: "geometry",
                stylers: [{visibility: "off"}, {saturation: "0"}]
            }, {
                featureType: "landscape",
                elementType: "all",
                stylers: [{color: "#f2f2f2"}]
            }, {
                featureType: "landscape.man_made",
                elementType: "all",
                stylers: [{visibility: "on"}]
            }, {
                featureType: "landscape.natural.terrain",
                elementType: "geometry",
                stylers: [{visibility: "off"}]
            }, {featureType: "poi", elementType: "all", stylers: [{visibility: "off"}]}, {
                featureType: "road",
                elementType: "all",
                stylers: [{visibility: "simplified"}, {saturation: "-100"}]
            }, {
                featureType: "road",
                elementType: "geometry",
                stylers: [{visibility: "simplified"}, {saturation: "0"}, {weight: "3.34"}]
            }, {featureType: "road", elementType: "geometry.fill", stylers: [{lightness: "56"}]}, {
                featureType: "road",
                elementType: "geometry.stroke",
                stylers: [{lightness: "-50"}]
            }, {featureType: "road", elementType: "labels", stylers: [{visibility: "simplified"}]}, {
                featureType: "road",
                elementType: "labels.text",
                stylers: [{weight: "3.89"}]
            }, {featureType: "road", elementType: "labels.text.fill", stylers: [{weight: "5.69"}]}, {
                featureType: "road",
                elementType: "labels.text.stroke",
                stylers: [{weight: "4.47"}]
            }, {
                featureType: "road",
                elementType: "labels.icon",
                stylers: [{visibility: "off"}]
            }, {
                featureType: "road.highway",
                elementType: "all",
                stylers: [{visibility: "simplified"}, {lightness: "-13"}]
            }, {
                featureType: "road.highway",
                elementType: "labels.text",
                stylers: [{lightness: "-39"}, {weight: "0.01"}, {visibility: "on"}]
            }, {
                featureType: "road.highway",
                elementType: "labels.text.fill",
                stylers: [{weight: "5.69"}]
            }, {
                featureType: "road.highway",
                elementType: "labels.text.stroke",
                stylers: [{weight: "2.71"}, {color: "#ffffff"}]
            }, {
                featureType: "road.arterial",
                elementType: "labels.icon",
                stylers: [{visibility: "off"}]
            }, {
                featureType: "transit",
                elementType: "all",
                stylers: [{visibility: "off"}]
            }, {
                featureType: "transit.station.bus",
                elementType: "all",
                stylers: [{visibility: "on"}, {lightness: "-70"}]
            }, {
                featureType: "transit.station.bus",
                elementType: "geometry",
                stylers: [{lightness: "-53"}]
            }, {featureType: "water", elementType: "all", stylers: [{color: "#ffee00"}, {visibility: "on"}]}], l = {
                zoom: o,
                center: e,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                styles: a,
                zoomControl: !0,
                zoomControlOptions: {position: google.maps.ControlPosition.RIGHT_CENTER},
                panControl: !1,
                streetViewControl: !1,
                scrollwheel: !1,
                navigationControl: !1,
                mapTypeControl: !1,
                scaleControl: !1,
                draggable: !1
            }, c = new google.maps.Map(n, l),
            u = new google.maps.MarkerImage("/assets/img/module/map/icon-parking.png", null, null, null, new google.maps.Size(60, 66)),
            d = new google.maps.MarkerImage("/assets/img/module/map/icon.png", null, null, null, new google.maps.Size(60, 66)),
            t = new google.maps.Marker({map: c, animation: google.maps.Animation.DROP, position: t, icon: u}),
            i = new google.maps.Marker({map: c, animation: google.maps.Animation.DROP, position: i, icon: u}),
            r = new google.maps.Marker({map: c, animation: google.maps.Animation.DROP, position: r, icon: u});
        new google.maps.Marker({map: c, animation: google.maps.Animation.DROP, position: s, icon: d, zIndex: 9999});
        google.maps.event.addListener(c, "zoom_changed", function () {
            c.getZoom() != o && (c.setCenter(s), o = !1)
        })
    }

    var n = document.getElementById("map-canvas");
    n && google.maps.event.addDomListener(window, "load", i)
}, function (e, t, i) {
    "use strict";
    var n = i(10), r = i(6), s = document.querySelector("#navigation-overlay"),
        o = document.querySelector(".site-header__toggle"), a = s.querySelector(".navigation-overlay__close"),
        l = s.querySelector("nav > div"), c = !1, u = function () {
            if (c) {
                l.style.top = 0, s.classList.toggle("is-static", r.isStatic);
                var e = l.offsetHeight;
                n.height > e && (l.style.top = (n.height - e) / 2 + "px")
            }
        }, d = function (e) {
            c = !c, s.classList[c ? "add" : "remove"]("is-visible"), c && u(), e.preventDefault()
        };
    n.addListener("navigationOverlay", u), o.addEventListener("click", d), a.addEventListener("click", d), s.classList.add("is-active")
}, function (e, t, i) {
    "use strict";
    var n = i(7), r = i(10).mq, s = i(9), o = i(10),
        a = [].slice.call(document.querySelectorAll(n.block("lazy").selector())), l = function (e) {
            var t = void 0, i = e.dataset.srcset && JSON.parse(e.dataset.srcset);
            i && Object.keys(i).forEach(function (e) {
                !t && r(e) && (t = i[e])
            }), t = t || e.dataset.src, new Promise(function (e) {
                var i = new window.Image;
                i.src = t, i.onload = e
            }).then(function () {
                e.setAttribute("src", t), s(function () {
                    return e.classList.add(n.states.active)
                })
            })
        }, c = new window.IntersectionObserver(function (e) {
            e.forEach(function (e) {
                e.isIntersecting && (c.unobserve(e.target), l(e.target))
            })
        }, {rootMargin: "10% 0px", threshold: .01});
    o.addListener("lazy", function () {
        a.forEach(function (e) {
            e.classList.contains(n.states.active) && l(e)
        })
    }), a.forEach(function (e) {
        return c.observe(e)
    })
}, function (e, t, i) {
    "use strict";
    var n = i(7), r = i(10), s = i(16), o = n.block("slider"), a = 5e3, l = r.width > 768, c = void 0, u = void 0,
        d = void 0, h = !1, f = null, g = null, m = void 0, p = function () {
            return !g && m.next()
        }, v = function () {
            g = !1, h || (f = window.setInterval(p, a))
        }, y = function () {
            g = !0, f && window.clearInterval(f)
        }, b = function () {
            u.forEach(function (e, t) {
                e.classList.toggle(n.states.active, t === m.currentSlide)
            })
        }, w = function () {
            c.forEach(function (e, t) {
                var i = e.querySelector(o.selector("video"));
                i && i[t === m.currentSlide ? "play" : "pause"]()
            })
        }, E = function () {
            b(), l && w()
        }, T = function (e) {
            h = !0, y(), m.goTo(u.indexOf(e.currentTarget)), E()
        }, k = function (e) {
            var t = e.currentTarget.classList.contains(o.class("control", "next"));
            h = !0, y(), m[t ? "next" : "prev"]()
        };
    e.exports = function () {
        d = document.querySelector(o.selector()), d && (u = [].slice.call(document.querySelectorAll(o.selector("pagination"))), c = [].slice.call(document.querySelectorAll(o.selector("bg"))), c.forEach(function (e) {
            var t = e.querySelector(o.selector("video"));
            t && !l && t.remove()
        }), m = new s({
            duration: 500,
            easing: "cubic-bezier(.215,.61,.355,1)",
            loop: !1,
            onChange: E,
            selector: d.querySelector(o.selector("inner"))
        }), d.addEventListener("mouseenter", y), d.addEventListener("mouseleave", v), u.forEach(function (e) {
            e.addEventListener("click", T)
        }), [].slice.call(document.querySelectorAll(o.selector("control"))).forEach(function (e) {
            e.addEventListener("click", k)
        }), E(), v())
    }
}, function (e, t, i) {
    !function (t, i) {
        e.exports = i()
    }(this, function () {
        return function (e) {
            function t(n) {
                if (i[n]) return i[n].exports;
                var r = i[n] = {i: n, l: !1, exports: {}};
                return e[n].call(r.exports, r, r.exports, t), r.l = !0, r.exports
            }

            var i = {};
            return t.m = e, t.c = i, t.i = function (e) {
                return e
            }, t.d = function (e, i, n) {
                t.o(e, i) || Object.defineProperty(e, i, {configurable: !1, enumerable: !0, get: n})
            }, t.n = function (e) {
                var i = e && e.__esModule ? function () {
                    return e.default
                } : function () {
                    return e
                };
                return t.d(i, "a", i), i
            }, t.o = function (e, t) {
                return Object.prototype.hasOwnProperty.call(e, t)
            }, t.p = "", t(t.s = 0)
        }([function (e, t, i) {
            "use strict";

            function n(e, t) {
                if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }

            Object.defineProperty(t, "__esModule", {value: !0});
            var r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (e) {
                return typeof e
            } : function (e) {
                return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
            }, s = function () {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }

                return function (t, i, n) {
                    return i && e(t.prototype, i), n && e(t, n), t
                }
            }(), o = function () {
                function e(t) {
                    var i = this;
                    n(this, e), this.config = e.mergeSettings(t), this.selector = "string" == typeof this.config.selector ? document.querySelector(this.config.selector) : this.config.selector, this.selectorWidth = this.selector.offsetWidth, this.innerElements = [].slice.call(this.selector.children), this.currentSlide = this.config.startIndex, this.transformProperty = e.webkitOrNot(), ["resizeHandler", "touchstartHandler", "touchendHandler", "touchmoveHandler", "mousedownHandler", "mouseupHandler", "mouseleaveHandler", "mousemoveHandler"].forEach(function (e) {
                        i[e] = i[e].bind(i)
                    }), this.init()
                }

                return s(e, [{
                    key: "init", value: function () {
                        if (window.addEventListener("resize", this.resizeHandler), this.config.draggable && (this.pointerDown = !1, this.drag = {
                                startX: 0,
                                endX: 0,
                                startY: 0,
                                letItGo: null
                            }, this.selector.addEventListener("touchstart", this.touchstartHandler, {passive: !0}), this.selector.addEventListener("touchend", this.touchendHandler), this.selector.addEventListener("touchmove", this.touchmoveHandler, {passive: !0}), this.selector.addEventListener("mousedown", this.mousedownHandler), this.selector.addEventListener("mouseup", this.mouseupHandler), this.selector.addEventListener("mouseleave", this.mouseleaveHandler), this.selector.addEventListener("mousemove", this.mousemoveHandler)), null === this.selector) throw new Error("Something wrong with your selector ðŸ˜­");
                        this.resolveSlidesNumber(), this.selector.style.overflow = "hidden", this.sliderFrame = document.createElement("div"), this.sliderFrame.style.width = this.selectorWidth / this.perPage * this.innerElements.length + "px", this.sliderFrame.style.webkitTransition = "all " + this.config.duration + "ms " + this.config.easing, this.sliderFrame.style.transition = "all " + this.config.duration + "ms " + this.config.easing, this.config.draggable && (this.selector.style.cursor = "-webkit-grab");
                        for (var e = document.createDocumentFragment(), t = 0; t < this.innerElements.length; t++) {
                            var i = document.createElement("div");
                            i.style.cssFloat = "left", i.style.float = "left", i.style.width = 100 / this.innerElements.length + "%", i.appendChild(this.innerElements[t]), e.appendChild(i)
                        }
                        this.sliderFrame.appendChild(e), this.selector.innerHTML = "", this.selector.appendChild(this.sliderFrame), this.slideToCurrent(), this.config.onInit.call(this)
                    }
                }, {
                    key: "resolveSlidesNumber", value: function () {
                        if ("number" == typeof this.config.perPage) this.perPage = this.config.perPage; else if ("object" === r(this.config.perPage)) {
                            this.perPage = 1;
                            for (var e in this.config.perPage) window.innerWidth >= e && (this.perPage = this.config.perPage[e])
                        }
                    }
                }, {
                    key: "prev", value: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 1, t = arguments[1];
                        if (!(this.innerElements.length <= this.perPage)) {
                            var i = this.currentSlide;
                            0 === this.currentSlide && this.config.loop ? this.currentSlide = this.innerElements.length - this.perPage : this.currentSlide = Math.max(this.currentSlide - e, 0), i !== this.currentSlide && (this.slideToCurrent(), this.config.onChange.call(this), t && t.call(this))
                        }
                    }
                }, {
                    key: "next", value: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 1, t = arguments[1];
                        if (!(this.innerElements.length <= this.perPage)) {
                            var i = this.currentSlide;
                            this.currentSlide === this.innerElements.length - this.perPage && this.config.loop ? this.currentSlide = 0 : this.currentSlide = Math.min(this.currentSlide + e, this.innerElements.length - this.perPage), i !== this.currentSlide && (this.slideToCurrent(), this.config.onChange.call(this), t && t.call(this))
                        }
                    }
                }, {
                    key: "goTo", value: function (e, t) {
                        if (!(this.innerElements.length <= this.perPage)) {
                            var i = this.currentSlide;
                            this.currentSlide = Math.min(Math.max(e, 0), this.innerElements.length - this.perPage), i !== this.currentSlide && (this.slideToCurrent(), this.config.onChange.call(this), t && t.call(this))
                        }
                    }
                }, {
                    key: "slideToCurrent", value: function () {
                        this.sliderFrame.style[this.transformProperty] = "translate3d(-" + this.currentSlide * (this.selectorWidth / this.perPage) + "px, 0, 0)"
                    }
                }, {
                    key: "updateAfterDrag", value: function () {
                        var e = this.drag.endX - this.drag.startX, t = Math.abs(e),
                            i = Math.ceil(t / (this.selectorWidth / this.perPage));
                        e > 0 && t > this.config.threshold && this.innerElements.length > this.perPage ? this.prev(i) : e < 0 && t > this.config.threshold && this.innerElements.length > this.perPage && this.next(i), this.slideToCurrent()
                    }
                }, {
                    key: "resizeHandler", value: function () {
                        this.resolveSlidesNumber(), this.selectorWidth = this.selector.offsetWidth, this.sliderFrame.style.width = this.selectorWidth / this.perPage * this.innerElements.length + "px", this.slideToCurrent()
                    }
                }, {
                    key: "clearDrag", value: function () {
                        this.drag = {startX: 0, endX: 0, startY: 0, letItGo: null}
                    }
                }, {
                    key: "touchstartHandler", value: function (e) {
                        e.stopPropagation(), this.pointerDown = !0, this.drag.startX = e.touches[0].pageX, this.drag.startY = e.touches[0].pageY
                    }
                }, {
                    key: "touchendHandler", value: function (e) {
                        e.stopPropagation(), this.pointerDown = !1, this.sliderFrame.style.webkitTransition = "all " + this.config.duration + "ms " + this.config.easing, this.sliderFrame.style.transition = "all " + this.config.duration + "ms " + this.config.easing, this.drag.endX && this.updateAfterDrag(), this.clearDrag()
                    }
                }, {
                    key: "touchmoveHandler", value: function (e) {
                        e.stopPropagation(), null === this.drag.letItGo && (this.drag.letItGo = Math.abs(this.drag.startY - e.touches[0].pageY) < Math.abs(this.drag.startX - e.touches[0].pageX)), this.pointerDown && this.drag.letItGo && (this.drag.endX = e.touches[0].pageX, this.sliderFrame.style.webkitTransition = "all 0ms " + this.config.easing, this.sliderFrame.style.transition = "all 0ms " + this.config.easing, this.sliderFrame.style[this.transformProperty] = "translate3d(" + (this.currentSlide * (this.selectorWidth / this.perPage) + (this.drag.startX - this.drag.endX)) * -1 + "px, 0, 0)")
                    }
                }, {
                    key: "mousedownHandler", value: function (e) {
                        e.preventDefault(), e.stopPropagation(), this.pointerDown = !0, this.drag.startX = e.pageX
                    }
                }, {
                    key: "mouseupHandler", value: function (e) {
                        e.stopPropagation(), this.pointerDown = !1, this.selector.style.cursor = "-webkit-grab", this.sliderFrame.style.webkitTransition = "all " + this.config.duration + "ms " + this.config.easing, this.sliderFrame.style.transition = "all " + this.config.duration + "ms " + this.config.easing, this.drag.endX && this.updateAfterDrag(), this.clearDrag()
                    }
                }, {
                    key: "mousemoveHandler", value: function (e) {
                        e.preventDefault(), this.pointerDown && (this.drag.endX = e.pageX, this.selector.style.cursor = "-webkit-grabbing", this.sliderFrame.style.webkitTransition = "all 0ms " + this.config.easing, this.sliderFrame.style.transition = "all 0ms " + this.config.easing, this.sliderFrame.style[this.transformProperty] = "translate3d(" + (this.currentSlide * (this.selectorWidth / this.perPage) + (this.drag.startX - this.drag.endX)) * -1 + "px, 0, 0)")
                    }
                }, {
                    key: "mouseleaveHandler", value: function (e) {
                        this.pointerDown && (this.pointerDown = !1, this.selector.style.cursor = "-webkit-grab", this.drag.endX = e.pageX, this.sliderFrame.style.webkitTransition = "all " + this.config.duration + "ms " + this.config.easing, this.sliderFrame.style.transition = "all " + this.config.duration + "ms " + this.config.easing, this.updateAfterDrag(), this.clearDrag())
                    }
                }, {
                    key: "updateFrame", value: function () {
                        this.sliderFrame = document.createElement("div"), this.sliderFrame.style.width = this.selectorWidth / this.perPage * this.innerElements.length + "px", this.sliderFrame.style.webkitTransition = "all " + this.config.duration + "ms " + this.config.easing, this.sliderFrame.style.transition = "all " + this.config.duration + "ms " + this.config.easing, this.config.draggable && (this.selector.style.cursor = "-webkit-grab");
                        for (var e = document.createDocumentFragment(), t = 0; t < this.innerElements.length; t++) {
                            var i = document.createElement("div");
                            i.style.cssFloat = "left", i.style.float = "left", i.style.width = 100 / this.innerElements.length + "%", i.appendChild(this.innerElements[t]), e.appendChild(i)
                        }
                        this.sliderFrame.appendChild(e), this.selector.innerHTML = "", this.selector.appendChild(this.sliderFrame), this.slideToCurrent()
                    }
                }, {
                    key: "remove", value: function (e, t) {
                        if (e < 0 || e >= this.innerElements.length) throw new Error("Item to remove doesn't exist ðŸ˜­");
                        this.innerElements.splice(e, 1), this.currentSlide = e <= this.currentSlide ? this.currentSlide - 1 : this.currentSlide, this.updateFrame(), t && t.call(this)
                    }
                }, {
                    key: "insert", value: function (e, t, i) {
                        if (t < 0 || t > this.innerElements.length + 1) throw new Error("Unable to inset it at this index ðŸ˜­");
                        if (this.innerElements.indexOf(e) !== -1) throw new Error("The same item in a carousel? Really? Nope ðŸ˜­");
                        this.innerElements.splice(t, 0, e), this.currentSlide = t <= this.currentSlide ? this.currentSlide + 1 : this.currentSlide, this.updateFrame(), i && i.call(this)
                    }
                }, {
                    key: "prepend", value: function (e, t) {
                        this.insert(e, 0), t && t.call(this)
                    }
                }, {
                    key: "append", value: function (e, t) {
                        this.insert(e, this.innerElements.length + 1), t && t.call(this)
                    }
                }, {
                    key: "destroy", value: function () {
                        var e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0], t = arguments[1];
                        if (window.removeEventListener("resize", this.resizeHandler), this.selector.style.cursor = "auto", this.selector.removeEventListener("touchstart", this.touchstartHandler), this.selector.removeEventListener("touchend", this.touchendHandler), this.selector.removeEventListener("touchmove", this.touchmoveHandler), this.selector.removeEventListener("mousedown", this.mousedownHandler), this.selector.removeEventListener("mouseup", this.mouseupHandler), this.selector.removeEventListener("mouseleave", this.mouseleaveHandler), this.selector.removeEventListener("mousemove", this.mousemoveHandler), e) {
                            for (var i = document.createDocumentFragment(), n = 0; n < this.innerElements.length; n++) i.appendChild(this.innerElements[n]);
                            this.selector.innerHTML = "", this.selector.appendChild(i), this.selector.removeAttribute("style")
                        }
                        t && t.call(this)
                    }
                }], [{
                    key: "mergeSettings", value: function (e) {
                        var t = {
                            selector: ".siema",
                            duration: 200,
                            easing: "ease-out",
                            perPage: 1,
                            startIndex: 0,
                            draggable: !0,
                            threshold: 20,
                            loop: !1,
                            onInit: function () {
                            },
                            onChange: function () {
                            }
                        }, i = e;
                        for (var n in i) t[n] = i[n];
                        return t
                    }
                }, {
                    key: "webkitOrNot", value: function () {
                        var e = document.documentElement.style;
                        return "string" == typeof e.transform ? "transform" : "WebkitTransform"
                    }
                }]), e
            }();
            t.default = o, e.exports = t.default
        }])
    })
}, function (e, t, i) {
    "use strict";

    function n(e) {
        return e && e.__esModule ? e : {default: e}
    }

    function r(e, t) {
        if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
    }

    var s = function () {
        function e(e, t) {
            for (var i = 0; i < t.length; i++) {
                var n = t[i];
                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
            }
        }

        return function (t, i, n) {
            return i && e(t.prototype, i), n && e(t, n), t
        }
    }(), o = i(7), a = n(o), l = i(8), c = n(l), u = i(10), d = n(u), h = function () {
        function e(t) {
            r(this, e), this._id = e.counter, this.$inView = t, this.data = this.$inView.dataset, this.settings = {
                top: null,
                bottom: null,
                offset: parseInt(this.data.offset, 10)
            }, this.init = this.init.bind(this), this.onResize = this.onResize.bind(this), this.onScroll = this.onScroll.bind(this), this.triggerActive = this.triggerActive.bind(this), this.init()
        }

        return s(e, [{
            key: "id", get: function () {
                return this._id
            }
        }], [{
            key: "block", get: function () {
                return a.default.block("in-view")
            }
        }, {
            key: "counter", get: function () {
                return e._counter = (e._counter || 0) + 1, e._counter
            }
        }]), s(e, [{
            key: "init", value: function () {
                d.default.addListener("in-view" + this.id, this.onResize), this.onResize(), c.default.addListener("in-view" + this.id, this.onScroll), this.onScroll()
            }
        }, {
            key: "onResize", value: function () {
                var e = this.$inView.getBoundingClientRect(), t = e.top, i = e.bottom;
                this.settings.top = t, this.settings.bottom = i
            }
        }, {
            key: "onScroll", value: function () {
                this.settings.offset ? c.default.y + d.default.height >= this.settings.top + this.settings.offset && this.triggerActive() : c.default.y + d.default.height >= this.settings.bottom && this.triggerActive()
            }
        }, {
            key: "triggerActive", value: function () {
                this.$inView.classList.add(a.default.states.active), d.default.removeListener("in-view" + this.id), c.default.removeListener("in-view" + this.id)
            }
        }]), e
    }();
    e.exports = function () {
        [].slice.call(document.querySelectorAll(h.block.selector())).forEach(function (e) {
            return new h(e)
        })
    }
}]);
//# sourceMappingURL=site.js.map
