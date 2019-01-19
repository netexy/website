! function t(e, n, i) {
  function r(a, s) {
    if (!n[a]) {
      if (!e[a]) {
        var l = "function" == typeof require && require;
        if (!s && l) return l(a, !0);
        if (o) return o(a, !0);
        var c = new Error("Cannot find module '" + a + "'");
        throw c.code = "MODULE_NOT_FOUND", c
      }
      var u = n[a] = {
        exports: {}
      };
      e[a][0].call(u.exports, function (t) {
        var n = e[a][1][t];
        return r(n || t)
      }, u, u.exports, t, e, n, i)
    }
    return n[a].exports
  }
  for (var o = "function" == typeof require && require, a = 0; a < i.length; a++) r(i[a]);
  return r
}({
  1: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("nl-event-emitter"),
      o = t("nl-element-watcher"),
      a = t("nl-client"),
      s = t("./analytics"),
      l = [],
      c = function (t) {
        var e = new function (t) {
          var l, c = {
              crossfade: function (t, n) {
                var i = e.elements.slideContainer.find("> .current"),
                  r = e.elements.slides.eq(t);
                e.config.onCrossfadeStart && e.config.onCrossfadeStart(i, r, e), a.supports.transition ? (r.on("transitionend.crossfade msTransitionEnd.crossfade webkitTransitionEnd.crossfade", function (t) {
                  r.off("transitionend.crossfade msTransitionEnd.crossfade webkitTransitionEnd.crossfade"), e.config.onCrossfadeEnd && e.config.onCrossfadeEnd(i, r, e)
                }), i.removeClass("current")) : (i.removeClass("current"), e.config.onCrossfadeEnd && e.config.onCrossfadeEnd(i, r, e)), r.addClass("current"), n && n(e)
              },
              "fade-over": function (t) {
                var n = e.elements.slideContainer.find("> .current"),
                  i = e.elements.slides.eq(t);
                if (n.length && i.length) {
                  var r = e.elements.slideContainer.find("> li").not(n).not(i);
                  n.removeClass("current"), n.css("z-index", 1), i.css("z-index", 2), r.css("z-index", 0), i.on("animationend.fadeOver", function () {
                    i.off("animationend.fadeOver"), i.attr("data-animating", !1), e.config.onFadeOverStop && e.config.onFadeOverStop(n, i, e)
                  }), i.addClass("current"), i.attr("data-animating", !0), e.config.onFadeOverStart && e.config.onFadeOverStart(n, i, e)
                }
              }
            },
            u = function () {
              return e.elements.slides.length
            },
            d = function () {
              return !e.explicitlyPaused && ("true" === e.config.auto || $(window).width() > 600 && "desktop" === e.config.auto)
            };
          this.getCurrentIndex = function () {
            return e.elements.slideContainer.find(".current").index()
          }, this.pause = function () {
            e.elements.container.attr("data-paused", "true"), e.isPaused = !0, clearInterval(l)
          }, this.play = function () {
            e.elements.container.attr("data-paused", "false"), e.isPaused = !1, l && clearInterval(l), l = window.setInterval(function () {
              var t = (e.getCurrentIndex() + 1) % e.elements.slides.length;
              e.transitionTo(t)
            }, e.config.speed)
          }, this.transitionTo = function (t, n) {
            e.pageCounter.update(t + 1), "true" === e.config.pagination && (e.elements.container.find(".pagination .current").removeClass("current"), e.dots.eq(t).addClass("current")), "true" === e.config.customNav && (e.navControls.removeClass("current"), e.navControls.eq(t).addClass("current")), (c[e.config.transition] || c.crossfade)(t, n), e.trigger("nl-gallery-transition"), e.trigger("index-selected", t)
          };
          var h = function (t) {
            this.transitionTo((e.getCurrentIndex() + 1) % u(), t)
          }.bind(this);
          this.next = i.debounce(h, 500, !0);
          var p = function (t) {
            this.transitionTo(e.getCurrentIndex() - 1, t)
          }.bind(this);
          this.previous = i.debounce(p, 500, !0), this.init = function () {
            var t = e.config;
            e.elements = {}, e.elements.container = t.element, e.elements.slideContainer = e.elements.container.find("> .nl-slides"), e.elements.slides = e.elements.slideContainer.children(), e.elements.container.data("controller", e), e.elements.container.data("nlGalleryController", e), r.createEmitter(e), t.arrows = {}, t.arrows.mobile = "true" === t.arrowsMobile || !0 === t.arrowsMobile ? "true" : "false" === t.arrowsMobile || !1 === t.arrowsMobile ? "false" : t.arrowsMobile ? "true" : e.elements.container.attr("data-arrows-mobile") || "true", t.arrows.desktop = "true" === t.arrowsDesktop || !0 === t.arrowsDesktop ? "true" : "false" === t.arrowsDesktop || !1 === t.arrowsDesktop ? "false" : t.arrowsDesktop ? "false" : e.elements.container.attr("data-arrows-desktop") || "false", t.auto = "true" === t.auto || !0 === t.auto ? "true" : "false" === t.auto || !1 === t.auto ? "false" : "desktop" === t.auto ? "desktop" : t.auto ? "false" : e.elements.container.attr("data-auto") || "false", t.pagination = "true" === t.pagination || !0 === t.pagination ? "true" : "false" === t.pagination || !1 === t.pagination ? "false" : t.pagination ? "true" : e.elements.container.attr("data-pagination") || "true", t.speed = t.speed ? t.speed : e.elements.container.attr("data-speed") ? parseInt(e.elements.container.attr("data-speed"), 10) : 4500, t.transition = t.transition ? t.transition : e.elements.container.attr("data-transition-style") || "crossfade", e.elements.container.attr("data-transition-style", t.transition), t.customNav = "true" === t.customNav || !0 === t.customNav ? "true" : "false" === t.customNav || !1 === t.customNav ? "false" : t.customNav ? "false" : e.elements.container.attr("data-custom-pagination") || "false", t.pageCount = "true" === t.pageCount || !0 === t.pageCount ? "true" : "false" === t.pageCount || !1 === t.pageCount ? "false" : t.pageCount ? "false" : e.elements.container.attr("data-page-count") || "false", e.elements.container.addClass("ready"), e.elements.container.get(0).className = e.elements.container.get(0).className, e.pageCounter = {}, e.pageCounter.update = function () {}, "true" === t.pageCount && (e.pageCounter.$el = $('<p class="counter" data-template="{currentIndex} of {slideCount}"></p>').prependTo(e.elements.container), e.pageCounter.update = function (t) {
              e.pageCounter.$el.text(e.pageCounter.$el.attr("data-template").replace(/\{currentIndex}/g, t).replace(/\{slideCount}/g, u()))
            }), "true" === t.pagination && function () {
              var i, r, o = document.createElement("div"),
                a = document.createElement("div");
              o.className = "controls", a.className = "pagination";
              for (var l, c = 0, d = u(); c < d; ++c) l = document.createElement("div"), a.appendChild(l);
              if (o.appendChild(a), "true" === t.arrows.mobile) {
                var h = function (t) {
                  t.preventDefault(),
                    function (t) {
                      var i = $(t);
                      i.hasClass("left") ? (e.previous(), s.track([n, "changed-slide", "forward to slide " + e.getCurrentIndex()])) : i.hasClass("right") && (e.next(), s.track([n, "changed-slide", "backward to slide " + e.getCurrentIndex()]))
                    }($(this))
                };
                i = document.createElement("a"), r = document.createElement("a"), i.className = "left", i.href = "#next", r.className = "right", r.href = "#previous", o.insertBefore(i, a), o.appendChild(r), i.addEventListener("click", h), r.addEventListener("click", h)
              }
              $(o).prependTo(e.elements.container), e.dots = $(a).find("div"), $(a).on("click", "div", function () {
                e.transitionTo($(this).index())
              })
            }(), "true" === t.arrows.desktop && ("holiday-gallery" === e.elements.container.attr("id") ? $('<a class="arrow left" href="#"></a><a class="arrow right" href="#"></a>').appendTo(this.config.element) : $('<div class="arrow-container"><a class="arrow left" href="#"></a><a class="arrow right" href="#"></a></div>').appendTo(this.config.element), e.arrows.left = e.elements.container.find(".arrow.left"), e.arrows.right = e.elements.container.find(".arrow.right"), e.elements.container.attr("data-left-loc") && e.arrows.left.attr("title", e.elements.container.attr("data-left-loc")), e.elements.container.attr("data-right-loc") && e.arrows.right.attr("title", e.elements.container.attr("data-right-loc")), e.arrows.right.on("click", function (t) {
              t.preventDefault(), this.next()
            }.bind(this)), e.arrows.left.on("click", function (t) {
              t.preventDefault(), this.previous()
            }.bind(this))), "true" === t.customNav && (e.navControls = $(".pagination-custom").find("button, a"), $(".pagination-custom").on("click", "button, a", function () {
              e.transitionTo($(this).index())
            })), o.add({
              element: this.elements.container,
              persist: !0,
              enter: function () {
                d() && e.play()
              },
              exit: function () {
                e.pause()
              }
            }), e.transitionTo(0), d() && e.play(), Modernizr.touchevents && e.elements.container.swipe({
              allowPageScroll: "vertical",
              maxTimeThreshold: 500,
              swipeLeft: function () {
                e.pause(), e.next(), e.trigger("swipeleft"), s.track([n, "swiped next", "on slide " + e.getCurrentIndex()])
              },
              swipeRight: function () {
                e.pause(), e.previous(), e.trigger("swiperight"), s.track([n, "swiped previous", "on slide " + e.getCurrentIndex()])
              }
            }), e.elements.container.on("click", function () {
              e.explicitlyPaused = !0, e.pause()
            })
          }, this.init()
        }(t);
        return l.push(e), e
      };
    $(".nl-gallery").each(function () {
      "false" !== $(this).attr("data-initialize") && c($(this))
    }), e.exports = {
      create: c,
      instances: l
    }
  }, {
    "./analytics": 136,
    "nl-client": 42,
    "nl-element-watcher": 45,
    "nl-event-emitter": 47,
    underscore: 58
  }],
  248: [function (t, e, n) {
    "use strict";
    e.exports = {
      init: function () {
        var t = $('[href^="tel:"]');
        t.each(function (t, e) {
          e.innerHTML = function (t) {
            return t.replace(/-/g, "&#8209;").replace(/\s/g, "&nbsp;")
          }(e.innerHTML)
        }), Modernizr.touchevents || t.each(function (t, e) {
          if ("A" === e.tagName) {
            var n = e.attributes,
              i = $(e),
              r = $("<span>");
            i.after(r.html(i.html())).remove();
            for (var o = 0; o < n.length; o++) r.attr(n[o].name, n[o].value)
          }
        })
      }
    }
  }, {}],
  249: [function (t, e, n) {
    "use strict";
    Array.prototype.includes || (dataLayer.push({
      event: "gaEvent",
      gaCategory: "site functions",
      gaAction: "polyfills",
      gaLabel: "Array.prototype.includes"
    }), Object.defineProperty(Array.prototype, "includes", {
      value: function (t, e) {
        if (null == this) throw new TypeError('"this" is null or not defined');
        var n = Object(this),
          i = n.length >>> 0;
        if (0 === i) return !1;
        for (var r = 0 | e, o = Math.max(r >= 0 ? r : i - Math.abs(r), 0); o < i;) {
          if (function (t, e) {
              return t === e || "number" == typeof t && "number" == typeof e && isNaN(t) && isNaN(e)
            }(n[o], t)) return !0;
          o++
        }
        return !1
      }
    })), String.prototype.includes || (dataLayer.push({
      event: "gaEvent",
      gaCategory: "site functions",
      gaAction: "polyfills",
      gaLabel: "String.prototype.includes"
    }), String.prototype.includes = function (t, e) {
      return "number" != typeof e && (e = 0), !(e + t.length > this.length) && -1 !== this.indexOf(t, e)
    })
  }, {}],
  250: [function (t, e, n) {
    "use strict";
    "document" in self && ("classList" in document.createElement("_") ? function () {
      function t(t) {
        dataLayer.push({
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "polyfills",
          gaLabel: "classList partial polyfill: " + t
        });
        var e = DOMTokenList.prototype[t];
        DOMTokenList.prototype[t] = function (t) {
          var n, i = arguments.length;
          for (n = 0; n < i; n++) t = arguments[n], e.call(this, t)
        }
      }
      var e = document.createElement("_");
      if (e.classList.add("c1", "c2"), e.classList.contains("c2") || (t("add"), t("remove")), e.classList.toggle("c3", !1), e.classList.contains("c3")) {
        var n = DOMTokenList.prototype.toggle;
        DOMTokenList.prototype.toggle = function (t, e) {
          return void 0 !== arguments[1] && this.contains(t) == e ? e : n.call(this, t)
        }
      }
    }() : function (t) {
      function e(t, e) {
        this.name = t, this.code = DOMException[t], this.message = e
      }

      function n(t, n) {
        if ("" === n) throw new e("SYNTAX_ERR", "An invalid or illegal string was specified");
        if (/\s/.test(n)) throw new e("INVALID_CHARACTER_ERR", "String contains an invalid character");
        return Array.prototype.indexOf.call(t, n)
      }

      function i(t) {
        for (var e = String.prototype.trim.call(t.className || ""), n = e ? e.split(/\s+/) : [], i = 0, r = n.length; i < r; i++) this.push(n[i]);
        this._updateClassName = function () {
          t.className = this.toString()
        }
      }

      function r() {
        return new i(this)
      }
      if (dataLayer.push({
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "polyfills",
          gaLabel: "classList full polyfill"
        }), "Element" in t) {
        var o = t.Element.prototype,
          a = Object,
          s = i.prototype = [];
        if (e.prototype = Error.prototype, s.item = function (t) {
            return this[t] || null
          }, s.contains = function (t) {
            return t += "", -1 !== n(this, t)
          }, s.add = function () {
            var t, e = arguments,
              i = !1,
              r = 0,
              o = e.length;
            do {
              -1 === n(this, t = e[r] + "") && (this.push(t), i = !0)
            } while (++r < o);
            i && this._updateClassName()
          }, s.remove = function () {
            var t, e, i = arguments,
              r = !1,
              o = 0,
              a = i.length;
            do {
              for (e = n(this, t = i[o] + ""); - 1 !== e;) this.splice(e, 1), r = !0, e = n(this, t)
            } while (++o < a);
            r && this._updateClassName()
          }, s.toggle = function (t, e) {
            t += "";
            var n, i = this.contains(t);
            return (n = "boolean" == typeof e ? e ? "add" : "remove" : i ? "remove" : "add") && this[n](t), !0 === e || !1 === e ? e : !i
          }, s.toString = function () {
            return this.join(" ")
          }, a.defineProperty) {
          var l = {
            get: r,
            enumerable: !0,
            configurable: !0
          };
          try {
            a.defineProperty(o, "classList", l)
          } catch (t) {
            -2146823252 === t.number && (l.enumerable = !1, a.defineProperty(o, "classList", l))
          }
        } else a.prototype.__defineGetter__ && o.__defineGetter__("classList", r)
      }
    }(self))
  }, {}],
  251: [function (t, e, n) {
    "use strict";
    t("./array-includes"), t("./object-assign"), t("./classlist"), t("./nodelist-foreach")
  }, {
    "./array-includes": 249,
    "./classlist": 250,
    "./nodelist-foreach": 252,
    "./object-assign": 253
  }],
  252: [function (t, e, n) {
    "use strict";
    NodeList.prototype.forEach = NodeList.prototype.forEach || Array.prototype.forEach
  }, {}],
  253: [function (t, e, n) {
    "use strict";
    "function" != typeof Object.assign && (dataLayer.push({
      event: "gaEvent",
      gaCategory: "site functions",
      gaAction: "polyfills",
      gaLabel: "Array.prototype.includes"
    }), Object.defineProperty(Object, "assign", {
      value: function (t, e) {
        if (null == t) throw new TypeError("Cannot convert undefined or null to object");
        for (var n = Object(t), i = 1; i < arguments.length; i++) {
          var r = arguments[i];
          if (null != r)
            for (var o in r) Object.prototype.hasOwnProperty.call(r, o) && (n[o] = r[o])
        }
        return n
      },
      writable: !0,
      configurable: !0
    }))
  }, {}],
  254: [function (t, e, n) {
    "use strict";
    var i = t("../core_modules").analytics;
    e.exports = {
      trigger: function (t, e) {
        void 0 !== t && void 0 !== e && i.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: t,
            gaLabel: e
          }
        })
      }
    }
  }, {
    "../core_modules": 194
  }],
  255: [function (t, e, n) {
    "use strict";
    var i, r, o, a, s, l = t("underscore"),
      c = t("./analytics"),
      u = t("../core_modules").geoip,
      d = $("body.preferences"),
      h = "",
      p = null,
      f = d.find("#change-country"),
      m = d.find("#change-language");
    e.exports = {
      init: function () {
        l.bindAll(this, "submitted", "submitSuccess", "submitError", "resetSubmitButton"), this.initEventListeners(), i = function () {
          var t, e, n, i = {};
          if (window.location.search)
            for (t = window.location.search.substring(1).split("&"), e = 0; e < t.length; e++)(n = t[e].split("="))[0] && (i[n[0]] = n[1] || !0);
          return i
        }(), r = i.sId, o = i.nId, a = !(!i.NestID || "true" !== i.NestID), (p = m.clone()).find("option[value=en]").attr("value", "en_US"), r || o || a ? this.initManageView(a) : this.initManualView(), $("input").keypress(function (t) {
          if (13 === t.which) return t.preventDefault(), $("#submit-button:not(.submitting)").click(), !1
        }), $("#email-preferences-form").on("submit", function (t) {
          return t.preventDefault(), $("#submit-button:not(.submitting)").click(), !1
        })
      },
      initEventListeners: function () {
        var t = this;
        f.change(function () {
          t.countryChanged()
        }), $("input[name=manage-email]").change(function () {
          t.preferencesRadioChanged($(this))
        }), $("#submit-button:not(.submitting)").click(function (t) {
          t.preventDefault();
          var e = d.find(".email_module").attr("id");
          this.submitted(e)
        }.bind(this))
      },
      getCurrentLocale: function () {
        var t;
        return window.location.pathname && (t = window.location.pathname.substring(1).split("/")), t
      },
      initManualView: function () {
        return h = this.getCurrentLocale(), this.setCountry(h[0]), d.find(".email_module").attr("id", "unsubscribe"), this.moduleReady("manual"), !1
      },
      initManageView: function (t) {
        var e, n, i = this,
          a = $("#email-preferences-form").attr("data-vw");
        return d.find(".email_module").attr("id", "unsubscribe"), $.ajax({
          url: a,
          type: "POST",
          dataType: "json",
          contentType: "application/json; charset=UTF-8",
          data: JSON.stringify({
            email: "",
            sfdc: r || "",
            nest: o || ""
          })
        }).done(function (a) {
          e = a.country_code || "", n = a.language || "", i.setCountry(e), i.setLanguage(n + "_" + e), d.find("#salesforce-id").attr("value", r), d.find("#nest-id").attr("value", o), t ? i.moduleReady("manage-with-account") : i.moduleReady("manage")
        }).fail(function () {
          i.moduleReady("manual")
        }), !1
      },
      moduleReady: function (t) {
        switch (d.find(".email_module").hasClass("is-shown") || d.find(".email_module").addClass("is-shown"), t) {
          case "manage":
            d.find(".email_module .preferences").addClass("state_manage-preferences is-shown"), d.find(".email_module").attr("id", "unsubscribe"), s = !0;
            break;
          case "manage-with-account":
            d.find(".email_module .preferences").addClass("state_manage-preferences-with-account is-shown"), d.find(".steps-change-lang").addClass("is-shown"), d.find(".email_module").attr("id", "unsubscribe"), s = !0;
            break;
          case "manual":
            d.find(".email_module .preferences").addClass("state_manual is-shown"), d.find(".email_module").attr("id", "unsubscribe");
            break;
          case "unsubscribe":
            d.find(".email_module .preferences").removeClass("is-shown"), d.find(".steps-change-lang").removeClass("is-shown"), d.find(".email_module .state_unsubscribed").addClass("is-shown")
        }
        return $("section.email").addClass("is-loaded"), !1
      },
      preferencesRadioChanged: function (t) {
        return d.find('input[type="radio"]').removeClass("is-checked"), t.closest('input[type="radio"]').prop("checked", !0).addClass("is-checked"), d.find("#unsubscribe_radio").hasClass("is-checked") ? d.find(".email_module").attr("id", "unsubscribe") : d.find("#change_email_radio").hasClass("is-checked") ? d.find(".email_module").attr("id", "manage") : d.find(".email_module").attr("id", "subscribe"), !1
      },
      setCountry: function (t) {
        return t && "preferences" !== t || (t = "us"), t && f.val(t.toLowerCase()), this.scopeLanguage(t), !1
      },
      setLanguage: function (t) {
        return m.val(t), !1
      },
      countryChanged: function () {
        this.setCountry(f.val());
        var t = f.val();
        this.scopeLanguage(t), $("#change_email_radio").is("checked") || $("#change_email_radio").click()
      },
      scopeLanguage: function (t) {
        var e, n;
        return (n = p.clone()).find("option").each(function () {
          (e = $(this).attr("value").split("_"))[1] !== t.toUpperCase() && $(this).remove()
        }), d.find("#change-language").replaceWith(n), !1
      },
      submitted: function (t) {
        var e, n, i, a = this,
          l = d.find("#enter-your-email").val();
        if (n = function (t) {
            return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(t)
          }(l), t || (t = d.find(".email_module").attr("id")), "sId" === r && (r = ""), !n && !s) return this.submitError("invalidEmail"), !1;
        switch (t) {
          case "unsubscribe":
            e = $("#email-preferences-form").attr("data-un"), $.ajax({
              url: e,
              type: "POST",
              dataType: "json",
              contentType: "application/json; charset=UTF-8",
              data: JSON.stringify({
                email: l || void 0,
                sfdc: r || void 0,
                nest: o || void 0
              }),
              complete: c.trigger.bind(null, "email signup", "unsubscribe")
            }).always(function (t) {
              a.afterSubmission(t, "unsubscribe")
            });
            break;
          case "subscribe":
            e = $("#email-preferences-form").attr("data-hr");
            var h = window.location.hostname + window.location.pathname;
            $.ajax({
              url: e,
              type: "POST",
              dataType: "json",
              contentType: "application/json; charset=UTF-8",
              data: JSON.stringify({
                email: l || void 0,
                emailOptIn: !0,
                type: "general",
                sub_type: "general",
                country_code: u.country_code || "",
                language: u.language || "",
                postal_code: u.postal_code || "",
                utility_postal_code: u.postal_code || "",
                referrer: h || "nest.com/preferences"
              }),
              complete: c.trigger.bind(null, "email signup", "success")
            }).always(function (t) {
              a.afterSubmission(t)
            });
            break;
          case "manage":
            e = $("#email-preferences-form").attr("data-md"), i = !d.find("#unsubscribe_radio").hasClass("is-checked"), $.ajax({
              url: e,
              type: "POST",
              dataType: "json",
              contentType: "application/json; charset=UTF-8",
              data: JSON.stringify({
                email: l || void 0,
                sfdc: r || void 0,
                nest: o || void 0,
                country_code: d.find("#change-country").val().toUpperCase(),
                language: d.find("#change-language").val(),
                emailOptIn: i
              })
            }).always(function (t) {
              a.afterSubmission(t)
            })
        }
      },
      afterSubmission: function (t, e) {
        200 === t.status ? "unsubscribe" === e ? this.submitSuccess("unsubscribe") : this.submitSuccess() : this.submitError(t.status), this.resetSubmitButton()
      },
      resetSubmitButton: function () {
        d.find(".submit").removeClass("submitting")
      },
      submitSuccess: function (t) {
        d.find(".submission-status-message").removeClass().addClass("submission-status-message"), d.find(".submit").addClass("submitting"), "unsubscribe" === t ? this.moduleReady("unsubscribe") : d.find(".submission-status-message").text(d.find(".submission-status-message").attr("data-success")).addClass("success is-shown")
      },
      submitError: function (t) {
        var e;
        e = "notFound" === t ? "data-not-found" : "invalidEmail" === t ? "data-invalid-email" : "data-error", d.find(".submission-status-message").text(d.find(".submission-status-message").attr(e)).addClass("error is-shown")
      }
    }
  }, {
    "../core_modules": 194,
    "./analytics": 254,
    underscore: 58
  }],
  256: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("nl-event-emitter");
    n.init = function () {
      for (var t = $(".select-section"), e = 0; e < t.length; e++) new function (t) {
        for (var e, n, r, o, a, s, l, c, u, d, h, p, f, m, g, v, y, b, w, _, k = t.querySelectorAll("select"), x = !1, E = function () {
            l = $(this), o = l.data("section"), c = $('section[data-section="' + o + '"]'), u = c.find(".product-dropdown"), d = c.find(".country-dropdown"), f = c.find(".primary-container"), m = c.find(".secondary-container"), b = c.find(".no-results"), w = c.find(".toggle-more"), b.hide(), x || (s = f.find("li").add(m.find("li")), p = document.createDocumentFragment(), v = s.appendTo($(p)), x = !0, i.each(v, function (t) {
              t.getAttribute("data-filter")
            })), y = function (t) {
              t.length > 9 ? w.css("display", "inline-block") : w.hide(), $.each(t, function (t, e) {
                g = t <= (_ = "documents" === o ? 2 : 8) ? f : m, $(e).appendTo(g)
              })
            }, h = function () {
              u.prop("selectedIndex", 0), d.prop("selectedIndex", 0), y(v), b.hide()
            }, f.empty(), m.empty(), e = u.find(":selected").data("filter") || "", n = d.find(":selected").data("filter") || "", (r = i.filter(v, function (t) {
              function i(t) {
                return a.indexOf(t) > -1
              }
              return a = $(t).data("filter") ? $(t).data("filter").replace(/\s/g, "").split(",") : [], e.length > 0 && n.length > 0 ? i(e) && (i("all-countries") || i(n)) : e.length > 0 ? i(e) : !(n.length > 0) || i("all-countries") || i(n)
            })).length ? y(r) : (b.show(), w.hide()), b.on("click", function (t) {
              t.preventDefault(), h()
            })
          }.bind(t), C = 0; C < k.length; C++) k[C].addEventListener("change", E);
        var S = $("html").attr("lang");
        "en-US" === S && (S = "en"), $(t).find("select.country-dropdown").find("option[data-filter=" + S + "]").prop("selected", !0).attr("selected", !0), E()
      }(t[e]);
      new function () {
        function t() {
          window.addEventListener("scroll", u), r.on("windowScrollEnd.subnav", u), r.on("windowResizeEnd.subnav", u)
        }

        function e() {
          return $(window).width() >= 768 && !Modernizr.touchevents
        }

        function n() {
          c = [];
          for (var t = 0; t < l.length; t++) c.push(l[t].offset().top)
        }
        var o, a, s, l, c;
        this.stick = function () {
          o.addClass("fixed").removeClass("static"), a = !0
        }, this.unstick = function () {
          o.addClass("static").removeClass("fixed"), a = !1
        }, this.getLowerLimit = function () {
          return o.offset().top
        }, this.isTriggered = function () {
          return a
        };
        var u = function () {
          s = this.getLowerLimit(), document.body.scrollTop >= s && !this.isTriggered() ? this.stick() : document.body.scrollTop < s && this.isTriggered() && this.unstick()
        }.bind(this);
        (function () {
          o = $("#subnav"), a = !1;
          var s = o.find("li a");
          e() && (u(), t()), matchMedia("(min-width:768px)").addListener(function () {
            e() ? (this.stick(), t()) : (this.unstick(), window.removeEventListener("scroll", u), r.off("windowResizeEnd.subnav"), r.off("windowScrollEnd.subnav"))
          }.bind(this)), s.on("click", function () {
            s.removeClass("active"), $(this).addClass("active")
          }), l = s.map(function () {
            var t = $($(this).attr("href"));
            if (t.length) return t
          }), n(), r.on("scrollStart", n);
          var d;
          window.addEventListener("scroll", i.debounce(function () {
            for (var t = c.length - 1; t--;) {
              if (document.body.scrollTop + window.innerHeight / 2 >= c[t]) {
                t !== d && (s.removeClass("active"), o.find('[href="#' + l[t][0].id + '"]').addClass("active"), d = t);
                break
              }
              0 === t && (s.removeClass("active"), o.find('[href="#' + l[0][0].id + '"]').addClass("active"))
            }
          }, 50))
        }).call(this)
      }, $("a.toggle-more").on("click", function (t) {
        t.preventDefault();
        var e = $(this).data("more-element"),
          n = $(this),
          i = $("ul#more-" + e),
          r = $(this).data("less-text"),
          o = $(this).data("more-text");
        $("ul#more-" + e).slideToggle(500, function () {
          i.is(":visible") ? (n.text(r), n.addClass("minus"), n.prop("title", r)) : (n.text(o), n.removeClass("minus"), n.prop("title", o))
        })
      })
    }
  }, {
    "nl-event-emitter": 47,
    underscore: 58
  }],
  257: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("./core_modules").validator,
      o = t("./_modules/query_utils"),
      a = t("nl-event-emitter");
    e.exports = {
      isInvalid: !1,
      requiredFields: function () {
        return document.querySelector("#rma-form").getElementsByClassName("required")
      },
      submitForm: function (t) {
        t.preventDefault(), t.stopPropagation();
        var e = document.querySelector("#rma-form");
        if (this.validate()) {
          var n = e.getElementsByClassName("error")[0];
          $("html,body").animate({
            scrollTop: n.offsetTop
          }, 500);
          var i = [];
          $(e).find(".error").each(function () {
            var t = $(this).find("[name]").attr("name"),
              e = $(this).find(".message").text();
            i.push(e ? t + " " + e : t)
          })
        } else a.trigger("submit"), e.querySelectorAll("input, button").forEach(function (t) {
          t.disabled = !0, t.readOnly = !0
        }), $.ajax({
          contentType: "text/plain;charset=UTF-8",
          url: $(e).attr("action"),
          type: "POST",
          data: JSON.stringify(this.data()),
          dataType: "json",
          success: function (t, e, n) {
            a.trigger("success")
          },
          error: function (t, e, n) {
            a.trigger("response-error")
          }
        })
      },
      data: function () {
        var t = document.querySelector("#rma-form");
        return Object.assign(this.serialNumbers.reduce(function (t, e) {
          return t.products.push({
            serialnumber: e,
            type: "T2"
          }) && t
        }, {
          products: []
        }), {
          lang: document.documentElement.lang.replace("-", "_"),
          name: t.name.value,
          phone: t.phone_number.value,
          address1: t.street_address.value,
          city: t.city.value,
          state: t.state.value,
          zip: t.zip.value,
          country: t.country.value,
          accountid: this.salesforceID,
          classification: "Request from 2nd Gen Protect Outreach Program"
        })
      },
      applyErrorMessage: function (t) {
        t.parentElement.className += " error"
      },
      resetErrorState: function (t) {
        var e = t.parentElement.className;
        t.parentElement.className = e.replace(/\s?error/, "")
      },
      validateInput: function (t) {
        var e = t.target;
        this.resetErrorState(e), (r.invalidEmail(e) || this.invalidInput(e)) && (this.isInvalid = !0, this.applyErrorMessage(e))
      },
      invalidInput: function (t) {
        return r.invalidInput(t) || $(t).attr("placeholder") === $(t).val()
      },
      validate: function () {
        return this.isInvalid = !1, i.each(this.requiredFields(), function (t) {
          $(t).trigger("focusout")
        }), this.isInvalid
      },
      setupAutocomplete: function () {
        var t = document.querySelector("#rma-form"),
          e = t.street_address,
          n = new google.maps.places.Autocomplete(e);
        n.addListener("place_changed", function () {
          var r = n.getPlace(),
            o = document.documentElement.lang,
            a = ~["en-US", "en-CA", "fr-CA"].indexOf(o),
            s = r.address_components.reduce(function (t, e) {
              return i.contains(e.types, "street_number") && Object.assign(t, {
                street_number: e.long_name
              }), i.contains(e.types, "route") && Object.assign(t, {
                street_name: e.long_name
              }), i.contains(e.types, "locality") && Object.assign(t, {
                city: e.long_name
              }), i.contains(e.types, "administrative_area_level_1") && Object.assign(t, {
                state: a ? e.short_name : e.long_name
              }), i.contains(e.types, "postal_code") && Object.assign(t, {
                postalCode: e.short_name
              }), i.contains(e.types, "country") && Object.assign(t, {
                country: e.long_name
              }), t
            }, {});
          e.value = $(r.adr_address).filter("span.street-address").text(), t.city.value = s.city || "", t.state.value = s.state || "", t.zip.value = s.postalCode || "", t.country.value = s.country || "", this.validate()
        }.bind(this))
      },
      getDeviceParams: function () {
        var t = window.location.search.substr(1),
          e = o.parseNestedQuery(t);
        e.sn && e.sid ? (this.serialNumbers = e.sn, this.salesforceID = e.sid) : a.trigger("server-down")
      },
      init: function () {
        for (var t in this.events) a.on(t, this.events[t].bind(this));
        this.setupAutocomplete(), this.getDeviceParams(), a.trigger("pre-check", function () {
          document.querySelector("#rma-form").addEventListener("submit", this.submitForm.bind(this)), i.each(this.requiredFields(), function (t) {
            $(t).on("focusout", this.validateInput.bind(this))
          }.bind(this))
        }.bind(this))
      },
      events: {
        "pre-check": function (t) {
          if (!this.serverDown) return "1" === $.cookie("rma") ? a.trigger("formerly-submit") : void $.get("/salesforce/api/sfdchealthcheck").error(function () {
            a.trigger("server-down")
          }).success(function () {
            document.querySelector("#rma-form").classList.add("clip-fadeInDown"), t()
          })
        },
        start: function () {
          document.querySelector("#rma-form").addEventListener("submit", this.submitForm.bind(this)), i.each(this.requiredFields(), function (t) {
            $(t).on("focusout", this.validateInput.bind(this))
          }.bind(this))
        },
        submit: function () {
          console.info("Event triggered: submit"), $(".submit").addClass("clip-fadeOutDown"), $(".submitting").addClass("clip-fadeInDown")
        },
        success: function () {
          console.log("Event triggered: success"), $("html,body").animate({
            scrollTop: document.querySelector("section#form").offsetTop
          }, 500);
          var t = document.querySelector(".thank-you-response");
          document.querySelector("#rma-form").classList.add("clip-fadeOutDown"), t.classList.add("clip-fadeInDown"), $.cookie("rma", 1)
        },
        "response-error": function () {
          console.log("Event triggered: error"), $(".clip-fadeOutDown").removeClass("clip-fadeOutDown"), $(".clip-fadeInDown").removeClass("clip-fadeInDown"), a.trigger("server-down", {
            hideForm: !0
          })
        },
        "formerly-submit": function () {
          console.log("Event triggered: thank-you"), $("html,body").animate({
            scrollTop: document.querySelector("section#form").offsetTop
          }, 500);
          document.querySelector(".formerly-submit-response").classList.add("clip-fadeInDown")
        },
        "server-down": function (t) {
          console.log("Event triggered: server-down"), this.serverDown = !0, $("html,body").animate({
            scrollTop: document.querySelector("section#form").offsetTop
          }, 500), t && t.hideForm && document.querySelector("#rma-form").classList.add("clip-fadeOutDown");
          document.querySelector(".server-down-response").classList.add("clip-fadeInDown")
        }
      }
    }
  }, {
    "./_modules/query_utils": 92,
    "./core_modules": 194,
    "nl-event-emitter": 47,
    underscore: 58
  }],
  258: [function (t, e, n) {
    "use strict";
    var i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (t) {
      return typeof t
    } : function (t) {
      return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
    };
    ! function (t, r) {
      "function" == typeof define && define.amd ? define([], r) : "object" === (void 0 === n ? "undefined" : i(n)) ? e.exports = r() : t.Handlebars = t.Handlebars || r()
    }(void 0, function () {
      var t = function () {
          function t(t) {
            this.string = t
          }
          return t.prototype.toString = function () {
            return "" + this.string
          }, t
        }(),
        e = function (e) {
          var n = {},
            r = t,
            o = {
              "&": "&amp;",
              "<": "&lt;",
              ">": "&gt;",
              '"': "&quot;",
              "'": "&#x27;",
              "`": "&#x60;"
            },
            a = /[&<>"'`]/g,
            s = /[&<>"'`]/;
          n.extend = function (t) {
            for (var e = 1; e < arguments.length; e++)
              for (var n in arguments[e]) Object.prototype.hasOwnProperty.call(arguments[e], n) && (t[n] = arguments[e][n]);
            return t
          };
          var l = Object.prototype.toString;
          n.toString = l;
          (c = function (t) {
            return "function" == typeof t
          })(/x/) && (c = function (t) {
            return "function" == typeof t && "[object Function]" === l.call(t)
          });
          var c;
          n.isFunction = c;
          var u = Array.isArray || function (t) {
            return !(!t || "object" !== (void 0 === t ? "undefined" : i(t))) && "[object Array]" === l.call(t)
          };
          return n.isArray = u, n.escapeExpression = function (t) {
            return t instanceof r ? t.toString() : null == t ? "" : t ? (t = "" + t, s.test(t) ? t.replace(a, function (t) {
              return o[t]
            }) : t) : t + ""
          }, n.isEmpty = function (t) {
            return !t && 0 !== t || !(!u(t) || 0 !== t.length)
          }, n.appendContextPath = function (t, e) {
            return (t ? t + "." : "") + e
          }, n
        }(),
        n = function () {
          function t(t, n) {
            var i;
            n && n.firstLine && (t += " - " + (i = n.firstLine) + ":" + n.firstColumn);
            for (var r = Error.prototype.constructor.call(this, t), o = 0; o < e.length; o++) this[e[o]] = r[e[o]];
            i && (this.lineNumber = i, this.column = n.firstColumn)
          }
          var e = ["description", "fileName", "lineNumber", "message", "name", "number", "stack"];
          return t.prototype = new Error, t
        }(),
        r = function (t, r) {
          function o(t, e) {
            this.helpers = t || {}, this.partials = e || {},
              function (t) {
                t.registerHelper("helperMissing", function () {
                  if (1 !== arguments.length) throw new l("Missing helper: '" + arguments[arguments.length - 1].name + "'")
                }), t.registerHelper("blockHelperMissing", function (e, n) {
                  var i = n.inverse,
                    r = n.fn;
                  if (!0 === e) return r(this);
                  if (!1 === e || null == e) return i(this);
                  if (c(e)) return e.length > 0 ? (n.ids && (n.ids = [n.name]), t.helpers.each(e, n)) : i(this);
                  if (n.data && n.ids) {
                    var o = f(n.data);
                    o.contextPath = s.appendContextPath(n.data.contextPath, n.name), n = {
                      data: o
                    }
                  }
                  return r(e, n)
                }), t.registerHelper("each", function (t, e) {
                  if (!e) throw new l("Must pass iterator to #each");
                  var n, r, o = e.fn,
                    a = e.inverse,
                    d = 0,
                    h = "";
                  if (e.data && e.ids && (r = s.appendContextPath(e.data.contextPath, e.ids[0]) + "."), u(t) && (t = t.call(this)), e.data && (n = f(e.data)), t && "object" === (void 0 === t ? "undefined" : i(t)))
                    if (c(t))
                      for (var p = t.length; d < p; d++) n && (n.index = d, n.first = 0 === d, n.last = d === t.length - 1, r && (n.contextPath = r + d)), h += o(t[d], {
                        data: n
                      });
                    else
                      for (var m in t) t.hasOwnProperty(m) && (n && (n.key = m, n.index = d, n.first = 0 === d, r && (n.contextPath = r + m)), h += o(t[m], {
                        data: n
                      }), d++);
                  return 0 === d && (h = a(this)), h
                }), t.registerHelper("if", function (t, e) {
                  return u(t) && (t = t.call(this)), !e.hash.includeZero && !t || s.isEmpty(t) ? e.inverse(this) : e.fn(this)
                }), t.registerHelper("unless", function (e, n) {
                  return t.helpers.if.call(this, e, {
                    fn: n.inverse,
                    inverse: n.fn,
                    hash: n.hash
                  })
                }), t.registerHelper("with", function (t, e) {
                  u(t) && (t = t.call(this));
                  var n = e.fn;
                  if (s.isEmpty(t)) return e.inverse(this);
                  if (e.data && e.ids) {
                    var i = f(e.data);
                    i.contextPath = s.appendContextPath(e.data.contextPath, e.ids[0]), e = {
                      data: i
                    }
                  }
                  return n(t, e)
                }), t.registerHelper("log", function (e, n) {
                  var i = n.data && null != n.data.level ? parseInt(n.data.level, 10) : 1;
                  t.log(i, e)
                }), t.registerHelper("lookup", function (t, e) {
                  return t && t[e]
                })
              }(this)
          }
          var a = {},
            s = e,
            l = n;
          a.VERSION = "2.0.0";
          a.COMPILER_REVISION = 6;
          a.REVISION_CHANGES = {
            1: "<= 1.0.rc.2",
            2: "== 1.0.0-rc.3",
            3: "== 1.0.0-rc.4",
            4: "== 1.x.x",
            5: "== 2.0.0-alpha.x",
            6: ">= 2.0.0-beta.1"
          };
          var c = s.isArray,
            u = s.isFunction,
            d = s.toString;
          a.HandlebarsEnvironment = o, o.prototype = {
            constructor: o,
            logger: h,
            log: p,
            registerHelper: function (t, e) {
              if ("[object Object]" === d.call(t)) {
                if (e) throw new l("Arg not supported with multiple helpers");
                s.extend(this.helpers, t)
              } else this.helpers[t] = e
            },
            unregisterHelper: function (t) {
              delete this.helpers[t]
            },
            registerPartial: function (t, e) {
              "[object Object]" === d.call(t) ? s.extend(this.partials, t) : this.partials[t] = e
            },
            unregisterPartial: function (t) {
              delete this.partials[t]
            }
          };
          var h = {
            methodMap: {
              0: "debug",
              1: "info",
              2: "warn",
              3: "error"
            },
            DEBUG: 0,
            INFO: 1,
            WARN: 2,
            ERROR: 3,
            level: 3,
            log: function (t, e) {
              if (h.level <= t) {
                var n = h.methodMap[t];
                "undefined" != typeof console && console[n] && console[n].call(console, e)
              }
            }
          };
          a.logger = h;
          var p = h.log;
          a.log = p;
          var f = function (t) {
            var e = s.extend({}, t);
            return e._parent = t, e
          };
          return a.createFrame = f, a
        }(),
        o = function (t, r, o) {
          function a(t, e, n, i, r) {
            var o = function (e, o) {
              return o = o || {}, n.call(t, e, t.helpers, t.partials, o.data || i, r && [e].concat(r))
            };
            return o.program = e, o.depth = r ? r.length : 0, o
          }
          var s = {},
            l = e,
            c = n,
            u = o.COMPILER_REVISION,
            d = o.REVISION_CHANGES,
            h = o.createFrame;
          return s.checkRevision = function (t) {
            var e = t && t[0] || 1,
              n = u;
            if (e !== n) {
              if (e < n) {
                var i = d[n],
                  r = d[e];
                throw new c("Template was precompiled with an older version of Handlebars than the current runtime. Please update your precompiler to a newer version (" + i + ") or downgrade your runtime to an older version (" + r + ").")
              }
              throw new c("Template was precompiled with a newer version of Handlebars than the current runtime. Please update your runtime to a newer version (" + t[1] + ").")
            }
          }, s.template = function (t, e) {
            if (!e) throw new c("No environment passed to template");
            if (!t || !t.main) throw new c("Unknown template object: " + (void 0 === t ? "undefined" : i(t)));
            e.VM.checkRevision(t.compiler);
            var n = {
                lookup: function (t, e) {
                  for (var n = t.length, i = 0; i < n; i++)
                    if (t[i] && null != t[i][e]) return t[i][e]
                },
                lambda: function (t, e) {
                  return "function" == typeof t ? t.call(e) : t
                },
                escapeExpression: l.escapeExpression,
                invokePartial: function (n, i, r, o, a, s, u, d, h) {
                  a && (o = l.extend({}, o, a));
                  var p = e.VM.invokePartial.call(this, n, r, o, s, u, d, h);
                  if (null == p && e.compile) {
                    var f = {
                      helpers: s,
                      partials: u,
                      data: d,
                      depths: h
                    };
                    u[r] = e.compile(n, {
                      data: void 0 !== d,
                      compat: t.compat
                    }, e), p = u[r](o, f)
                  }
                  if (null != p) {
                    if (i) {
                      for (var m = p.split("\n"), g = 0, v = m.length; g < v && (m[g] || g + 1 !== v); g++) m[g] = i + m[g];
                      p = m.join("\n")
                    }
                    return p
                  }
                  throw new c("The partial " + r + " could not be compiled when running in runtime-only mode")
                },
                fn: function (e) {
                  return t[e]
                },
                programs: [],
                program: function (t, e, n) {
                  var i = this.programs[t],
                    r = this.fn(t);
                  return e || n ? i = a(this, t, r, e, n) : i || (i = this.programs[t] = a(this, t, r)), i
                },
                data: function (t, e) {
                  for (; t && e--;) t = t._parent;
                  return t
                },
                merge: function (t, e) {
                  var n = t || e;
                  return t && e && t !== e && (n = l.extend({}, e, t)), n
                },
                noop: e.VM.noop,
                compilerInfo: t.compiler
              },
              r = function e(i, r) {
                var o = (r = r || {}).data;
                e._setup(r), !r.partial && t.useData && (o = function (t, e) {
                  return e && "root" in e || ((e = e ? h(e) : {}).root = t), e
                }(i, o));
                var a;
                return t.useDepths && (a = r.depths ? [i].concat(r.depths) : [i]), t.main.call(n, i, n.helpers, n.partials, o, a)
              };
            return r.isTop = !0, r._setup = function (i) {
              i.partial ? (n.helpers = i.helpers, n.partials = i.partials) : (n.helpers = n.merge(i.helpers, e.helpers), t.usePartial && (n.partials = n.merge(i.partials, e.partials)))
            }, r._child = function (e, i, r) {
              if (t.useDepths && !r) throw new c("must pass parent depths");
              return a(n, e, t[e], i, r)
            }, r
          }, s.program = a, s.invokePartial = function (t, e, n, i, r, o, a) {
            var s = {
              partial: !0,
              helpers: i,
              partials: r,
              data: o,
              depths: a
            };
            if (void 0 === t) throw new c("The partial " + e + " could not be found");
            if (t instanceof Function) return t(n, s)
          }, s.noop = function () {
            return ""
          }, s
        }(0, 0, r),
        a = function (i, a, s, l, c) {
          var u = r,
            d = t,
            h = n,
            p = e,
            f = o,
            m = function () {
              var t = new u.HandlebarsEnvironment;
              return p.extend(t, u), t.SafeString = d, t.Exception = h, t.Utils = p, t.escapeExpression = p.escapeExpression, t.VM = f, t.template = function (e) {
                return f.template(e, t)
              }, t
            },
            g = m();
          return g.create = m, g.default = g, g
        }(),
        s = function (t) {
          function e(t) {
            t = t || {}, this.firstLine = t.first_line, this.firstColumn = t.first_column, this.lastColumn = t.last_column, this.lastLine = t.last_line
          }
          var i = n,
            r = {
              ProgramNode: function (t, n, i) {
                e.call(this, i), this.type = "program", this.statements = t, this.strip = n
              },
              MustacheNode: function (t, n, i, o, a) {
                if (e.call(this, a), this.type = "mustache", this.strip = o, null != i && i.charAt) {
                  var s = i.charAt(3) || i.charAt(2);
                  this.escaped = "{" !== s && "&" !== s
                } else this.escaped = !!i;
                t instanceof r.SexprNode ? this.sexpr = t : this.sexpr = new r.SexprNode(t, n), this.id = this.sexpr.id, this.params = this.sexpr.params, this.hash = this.sexpr.hash, this.eligibleHelper = this.sexpr.eligibleHelper, this.isHelper = this.sexpr.isHelper
              },
              SexprNode: function (t, n, i) {
                e.call(this, i), this.type = "sexpr", this.hash = n;
                var r = this.id = t[0],
                  o = this.params = t.slice(1);
                this.isHelper = !(!o.length && !n), this.eligibleHelper = this.isHelper || r.isSimple
              },
              PartialNode: function (t, n, i, r, o) {
                e.call(this, o), this.type = "partial", this.partialName = t, this.context = n, this.hash = i, this.strip = r, this.strip.inlineStandalone = !0
              },
              BlockNode: function (t, n, i, r, o) {
                e.call(this, o), this.type = "block", this.mustache = t, this.program = n, this.inverse = i, this.strip = r, i && !n && (this.isInverse = !0)
              },
              RawBlockNode: function (t, n, o, a) {
                if (e.call(this, a), t.sexpr.id.original !== o) throw new i(t.sexpr.id.original + " doesn't match " + o, this);
                n = new r.ContentNode(n, a), this.type = "block", this.mustache = t, this.program = new r.ProgramNode([n], {}, a)
              },
              ContentNode: function (t, n) {
                e.call(this, n), this.type = "content", this.original = this.string = t
              },
              HashNode: function (t, n) {
                e.call(this, n), this.type = "hash", this.pairs = t
              },
              IdNode: function (t, n) {
                e.call(this, n), this.type = "ID";
                for (var r = "", o = [], a = 0, s = "", l = 0, c = t.length; l < c; l++) {
                  var u = t[l].part;
                  if (r += (t[l].separator || "") + u, ".." === u || "." === u || "this" === u) {
                    if (o.length > 0) throw new i("Invalid path: " + r, this);
                    ".." === u ? (a++, s += "../") : this.isScoped = !0
                  } else o.push(u)
                }
                this.original = r, this.parts = o, this.string = o.join("."), this.depth = a, this.idName = s + this.string, this.isSimple = 1 === t.length && !this.isScoped && 0 === a, this.stringModeValue = this.string
              },
              PartialNameNode: function (t, n) {
                e.call(this, n), this.type = "PARTIAL_NAME", this.name = t.original
              },
              DataNode: function (t, n) {
                e.call(this, n), this.type = "DATA", this.id = t, this.stringModeValue = t.stringModeValue, this.idName = "@" + t.stringModeValue
              },
              StringNode: function (t, n) {
                e.call(this, n), this.type = "STRING", this.original = this.string = this.stringModeValue = t
              },
              NumberNode: function (t, n) {
                e.call(this, n), this.type = "NUMBER", this.original = this.number = t, this.stringModeValue = Number(t)
              },
              BooleanNode: function (t, n) {
                e.call(this, n), this.type = "BOOLEAN", this.bool = t, this.stringModeValue = "true" === t
              },
              CommentNode: function (t, n) {
                e.call(this, n), this.type = "comment", this.comment = t, this.strip = {
                  inlineStandalone: !0
                }
              }
            };
          return r
        }(),
        l = function () {
          function t() {
            this.yy = {}
          }
          var e = {
              trace: function () {},
              yy: {},
              symbols_: {
                error: 2,
                root: 3,
                program: 4,
                EOF: 5,
                program_repetition0: 6,
                statement: 7,
                mustache: 8,
                block: 9,
                rawBlock: 10,
                partial: 11,
                CONTENT: 12,
                COMMENT: 13,
                openRawBlock: 14,
                END_RAW_BLOCK: 15,
                OPEN_RAW_BLOCK: 16,
                sexpr: 17,
                CLOSE_RAW_BLOCK: 18,
                openBlock: 19,
                block_option0: 20,
                closeBlock: 21,
                openInverse: 22,
                block_option1: 23,
                OPEN_BLOCK: 24,
                CLOSE: 25,
                OPEN_INVERSE: 26,
                inverseAndProgram: 27,
                INVERSE: 28,
                OPEN_ENDBLOCK: 29,
                path: 30,
                OPEN: 31,
                OPEN_UNESCAPED: 32,
                CLOSE_UNESCAPED: 33,
                OPEN_PARTIAL: 34,
                partialName: 35,
                param: 36,
                partial_option0: 37,
                partial_option1: 38,
                sexpr_repetition0: 39,
                sexpr_option0: 40,
                dataName: 41,
                STRING: 42,
                NUMBER: 43,
                BOOLEAN: 44,
                OPEN_SEXPR: 45,
                CLOSE_SEXPR: 46,
                hash: 47,
                hash_repetition_plus0: 48,
                hashSegment: 49,
                ID: 50,
                EQUALS: 51,
                DATA: 52,
                pathSegments: 53,
                SEP: 54,
                $accept: 0,
                $end: 1
              },
              terminals_: {
                2: "error",
                5: "EOF",
                12: "CONTENT",
                13: "COMMENT",
                15: "END_RAW_BLOCK",
                16: "OPEN_RAW_BLOCK",
                18: "CLOSE_RAW_BLOCK",
                24: "OPEN_BLOCK",
                25: "CLOSE",
                26: "OPEN_INVERSE",
                28: "INVERSE",
                29: "OPEN_ENDBLOCK",
                31: "OPEN",
                32: "OPEN_UNESCAPED",
                33: "CLOSE_UNESCAPED",
                34: "OPEN_PARTIAL",
                42: "STRING",
                43: "NUMBER",
                44: "BOOLEAN",
                45: "OPEN_SEXPR",
                46: "CLOSE_SEXPR",
                50: "ID",
                51: "EQUALS",
                52: "DATA",
                54: "SEP"
              },
              productions_: [0, [3, 2], [4, 1], [7, 1], [7, 1], [7, 1], [7, 1], [7, 1], [7, 1], [10, 3], [14, 3], [9, 4], [9, 4], [19, 3], [22, 3], [27, 2], [21, 3], [8, 3], [8, 3], [11, 5], [11, 4], [17, 3], [17, 1], [36, 1], [36, 1], [36, 1], [36, 1], [36, 1], [36, 3], [47, 1], [49, 3], [35, 1], [35, 1], [35, 1], [41, 2], [30, 1], [53, 3], [53, 1], [6, 0], [6, 2], [20, 0], [20, 1], [23, 0], [23, 1], [37, 0], [37, 1], [38, 0], [38, 1], [39, 0], [39, 2], [40, 0], [40, 1], [48, 1], [48, 2]],
              performAction: function (t, e, n, i, r, o, a) {
                var s = o.length - 1;
                switch (r) {
                  case 1:
                    return i.prepareProgram(o[s - 1].statements, !0), o[s - 1];
                  case 2:
                    this.$ = new i.ProgramNode(i.prepareProgram(o[s]), {}, this._$);
                    break;
                  case 3:
                  case 4:
                  case 5:
                  case 6:
                    this.$ = o[s];
                    break;
                  case 7:
                    this.$ = new i.ContentNode(o[s], this._$);
                    break;
                  case 8:
                    this.$ = new i.CommentNode(o[s], this._$);
                    break;
                  case 9:
                    this.$ = new i.RawBlockNode(o[s - 2], o[s - 1], o[s], this._$);
                    break;
                  case 10:
                    this.$ = new i.MustacheNode(o[s - 1], null, "", "", this._$);
                    break;
                  case 11:
                    this.$ = i.prepareBlock(o[s - 3], o[s - 2], o[s - 1], o[s], !1, this._$);
                    break;
                  case 12:
                    this.$ = i.prepareBlock(o[s - 3], o[s - 2], o[s - 1], o[s], !0, this._$);
                    break;
                  case 13:
                  case 14:
                    this.$ = new i.MustacheNode(o[s - 1], null, o[s - 2], i.stripFlags(o[s - 2], o[s]), this._$);
                    break;
                  case 15:
                    this.$ = {
                      strip: i.stripFlags(o[s - 1], o[s - 1]),
                      program: o[s]
                    };
                    break;
                  case 16:
                    this.$ = {
                      path: o[s - 1],
                      strip: i.stripFlags(o[s - 2], o[s])
                    };
                    break;
                  case 17:
                  case 18:
                    this.$ = new i.MustacheNode(o[s - 1], null, o[s - 2], i.stripFlags(o[s - 2], o[s]), this._$);
                    break;
                  case 19:
                    this.$ = new i.PartialNode(o[s - 3], o[s - 2], o[s - 1], i.stripFlags(o[s - 4], o[s]), this._$);
                    break;
                  case 20:
                    this.$ = new i.PartialNode(o[s - 2], void 0, o[s - 1], i.stripFlags(o[s - 3], o[s]), this._$);
                    break;
                  case 21:
                    this.$ = new i.SexprNode([o[s - 2]].concat(o[s - 1]), o[s], this._$);
                    break;
                  case 22:
                    this.$ = new i.SexprNode([o[s]], null, this._$);
                    break;
                  case 23:
                    this.$ = o[s];
                    break;
                  case 24:
                    this.$ = new i.StringNode(o[s], this._$);
                    break;
                  case 25:
                    this.$ = new i.NumberNode(o[s], this._$);
                    break;
                  case 26:
                    this.$ = new i.BooleanNode(o[s], this._$);
                    break;
                  case 27:
                    this.$ = o[s];
                    break;
                  case 28:
                    o[s - 1].isHelper = !0, this.$ = o[s - 1];
                    break;
                  case 29:
                    this.$ = new i.HashNode(o[s], this._$);
                    break;
                  case 30:
                    this.$ = [o[s - 2], o[s]];
                    break;
                  case 31:
                    this.$ = new i.PartialNameNode(o[s], this._$);
                    break;
                  case 32:
                    this.$ = new i.PartialNameNode(new i.StringNode(o[s], this._$), this._$);
                    break;
                  case 33:
                    this.$ = new i.PartialNameNode(new i.NumberNode(o[s], this._$));
                    break;
                  case 34:
                    this.$ = new i.DataNode(o[s], this._$);
                    break;
                  case 35:
                    this.$ = new i.IdNode(o[s], this._$);
                    break;
                  case 36:
                    o[s - 2].push({
                      part: o[s],
                      separator: o[s - 1]
                    }), this.$ = o[s - 2];
                    break;
                  case 37:
                    this.$ = [{
                      part: o[s]
                    }];
                    break;
                  case 38:
                    this.$ = [];
                    break;
                  case 39:
                    o[s - 1].push(o[s]);
                    break;
                  case 48:
                    this.$ = [];
                    break;
                  case 49:
                    o[s - 1].push(o[s]);
                    break;
                  case 52:
                    this.$ = [o[s]];
                    break;
                  case 53:
                    o[s - 1].push(o[s])
                }
              },
              table: [{
                3: 1,
                4: 2,
                5: [2, 38],
                6: 3,
                12: [2, 38],
                13: [2, 38],
                16: [2, 38],
                24: [2, 38],
                26: [2, 38],
                31: [2, 38],
                32: [2, 38],
                34: [2, 38]
              }, {
                1: [3]
              }, {
                5: [1, 4]
              }, {
                5: [2, 2],
                7: 5,
                8: 6,
                9: 7,
                10: 8,
                11: 9,
                12: [1, 10],
                13: [1, 11],
                14: 16,
                16: [1, 20],
                19: 14,
                22: 15,
                24: [1, 18],
                26: [1, 19],
                28: [2, 2],
                29: [2, 2],
                31: [1, 12],
                32: [1, 13],
                34: [1, 17]
              }, {
                1: [2, 1]
              }, {
                5: [2, 39],
                12: [2, 39],
                13: [2, 39],
                16: [2, 39],
                24: [2, 39],
                26: [2, 39],
                28: [2, 39],
                29: [2, 39],
                31: [2, 39],
                32: [2, 39],
                34: [2, 39]
              }, {
                5: [2, 3],
                12: [2, 3],
                13: [2, 3],
                16: [2, 3],
                24: [2, 3],
                26: [2, 3],
                28: [2, 3],
                29: [2, 3],
                31: [2, 3],
                32: [2, 3],
                34: [2, 3]
              }, {
                5: [2, 4],
                12: [2, 4],
                13: [2, 4],
                16: [2, 4],
                24: [2, 4],
                26: [2, 4],
                28: [2, 4],
                29: [2, 4],
                31: [2, 4],
                32: [2, 4],
                34: [2, 4]
              }, {
                5: [2, 5],
                12: [2, 5],
                13: [2, 5],
                16: [2, 5],
                24: [2, 5],
                26: [2, 5],
                28: [2, 5],
                29: [2, 5],
                31: [2, 5],
                32: [2, 5],
                34: [2, 5]
              }, {
                5: [2, 6],
                12: [2, 6],
                13: [2, 6],
                16: [2, 6],
                24: [2, 6],
                26: [2, 6],
                28: [2, 6],
                29: [2, 6],
                31: [2, 6],
                32: [2, 6],
                34: [2, 6]
              }, {
                5: [2, 7],
                12: [2, 7],
                13: [2, 7],
                16: [2, 7],
                24: [2, 7],
                26: [2, 7],
                28: [2, 7],
                29: [2, 7],
                31: [2, 7],
                32: [2, 7],
                34: [2, 7]
              }, {
                5: [2, 8],
                12: [2, 8],
                13: [2, 8],
                16: [2, 8],
                24: [2, 8],
                26: [2, 8],
                28: [2, 8],
                29: [2, 8],
                31: [2, 8],
                32: [2, 8],
                34: [2, 8]
              }, {
                17: 21,
                30: 22,
                41: 23,
                50: [1, 26],
                52: [1, 25],
                53: 24
              }, {
                17: 27,
                30: 22,
                41: 23,
                50: [1, 26],
                52: [1, 25],
                53: 24
              }, {
                4: 28,
                6: 3,
                12: [2, 38],
                13: [2, 38],
                16: [2, 38],
                24: [2, 38],
                26: [2, 38],
                28: [2, 38],
                29: [2, 38],
                31: [2, 38],
                32: [2, 38],
                34: [2, 38]
              }, {
                4: 29,
                6: 3,
                12: [2, 38],
                13: [2, 38],
                16: [2, 38],
                24: [2, 38],
                26: [2, 38],
                28: [2, 38],
                29: [2, 38],
                31: [2, 38],
                32: [2, 38],
                34: [2, 38]
              }, {
                12: [1, 30]
              }, {
                30: 32,
                35: 31,
                42: [1, 33],
                43: [1, 34],
                50: [1, 26],
                53: 24
              }, {
                17: 35,
                30: 22,
                41: 23,
                50: [1, 26],
                52: [1, 25],
                53: 24
              }, {
                17: 36,
                30: 22,
                41: 23,
                50: [1, 26],
                52: [1, 25],
                53: 24
              }, {
                17: 37,
                30: 22,
                41: 23,
                50: [1, 26],
                52: [1, 25],
                53: 24
              }, {
                25: [1, 38]
              }, {
                18: [2, 48],
                25: [2, 48],
                33: [2, 48],
                39: 39,
                42: [2, 48],
                43: [2, 48],
                44: [2, 48],
                45: [2, 48],
                46: [2, 48],
                50: [2, 48],
                52: [2, 48]
              }, {
                18: [2, 22],
                25: [2, 22],
                33: [2, 22],
                46: [2, 22]
              }, {
                18: [2, 35],
                25: [2, 35],
                33: [2, 35],
                42: [2, 35],
                43: [2, 35],
                44: [2, 35],
                45: [2, 35],
                46: [2, 35],
                50: [2, 35],
                52: [2, 35],
                54: [1, 40]
              }, {
                30: 41,
                50: [1, 26],
                53: 24
              }, {
                18: [2, 37],
                25: [2, 37],
                33: [2, 37],
                42: [2, 37],
                43: [2, 37],
                44: [2, 37],
                45: [2, 37],
                46: [2, 37],
                50: [2, 37],
                52: [2, 37],
                54: [2, 37]
              }, {
                33: [1, 42]
              }, {
                20: 43,
                27: 44,
                28: [1, 45],
                29: [2, 40]
              }, {
                23: 46,
                27: 47,
                28: [1, 45],
                29: [2, 42]
              }, {
                15: [1, 48]
              }, {
                25: [2, 46],
                30: 51,
                36: 49,
                38: 50,
                41: 55,
                42: [1, 52],
                43: [1, 53],
                44: [1, 54],
                45: [1, 56],
                47: 57,
                48: 58,
                49: 60,
                50: [1, 59],
                52: [1, 25],
                53: 24
              }, {
                25: [2, 31],
                42: [2, 31],
                43: [2, 31],
                44: [2, 31],
                45: [2, 31],
                50: [2, 31],
                52: [2, 31]
              }, {
                25: [2, 32],
                42: [2, 32],
                43: [2, 32],
                44: [2, 32],
                45: [2, 32],
                50: [2, 32],
                52: [2, 32]
              }, {
                25: [2, 33],
                42: [2, 33],
                43: [2, 33],
                44: [2, 33],
                45: [2, 33],
                50: [2, 33],
                52: [2, 33]
              }, {
                25: [1, 61]
              }, {
                25: [1, 62]
              }, {
                18: [1, 63]
              }, {
                5: [2, 17],
                12: [2, 17],
                13: [2, 17],
                16: [2, 17],
                24: [2, 17],
                26: [2, 17],
                28: [2, 17],
                29: [2, 17],
                31: [2, 17],
                32: [2, 17],
                34: [2, 17]
              }, {
                18: [2, 50],
                25: [2, 50],
                30: 51,
                33: [2, 50],
                36: 65,
                40: 64,
                41: 55,
                42: [1, 52],
                43: [1, 53],
                44: [1, 54],
                45: [1, 56],
                46: [2, 50],
                47: 66,
                48: 58,
                49: 60,
                50: [1, 59],
                52: [1, 25],
                53: 24
              }, {
                50: [1, 67]
              }, {
                18: [2, 34],
                25: [2, 34],
                33: [2, 34],
                42: [2, 34],
                43: [2, 34],
                44: [2, 34],
                45: [2, 34],
                46: [2, 34],
                50: [2, 34],
                52: [2, 34]
              }, {
                5: [2, 18],
                12: [2, 18],
                13: [2, 18],
                16: [2, 18],
                24: [2, 18],
                26: [2, 18],
                28: [2, 18],
                29: [2, 18],
                31: [2, 18],
                32: [2, 18],
                34: [2, 18]
              }, {
                21: 68,
                29: [1, 69]
              }, {
                29: [2, 41]
              }, {
                4: 70,
                6: 3,
                12: [2, 38],
                13: [2, 38],
                16: [2, 38],
                24: [2, 38],
                26: [2, 38],
                29: [2, 38],
                31: [2, 38],
                32: [2, 38],
                34: [2, 38]
              }, {
                21: 71,
                29: [1, 69]
              }, {
                29: [2, 43]
              }, {
                5: [2, 9],
                12: [2, 9],
                13: [2, 9],
                16: [2, 9],
                24: [2, 9],
                26: [2, 9],
                28: [2, 9],
                29: [2, 9],
                31: [2, 9],
                32: [2, 9],
                34: [2, 9]
              }, {
                25: [2, 44],
                37: 72,
                47: 73,
                48: 58,
                49: 60,
                50: [1, 74]
              }, {
                25: [1, 75]
              }, {
                18: [2, 23],
                25: [2, 23],
                33: [2, 23],
                42: [2, 23],
                43: [2, 23],
                44: [2, 23],
                45: [2, 23],
                46: [2, 23],
                50: [2, 23],
                52: [2, 23]
              }, {
                18: [2, 24],
                25: [2, 24],
                33: [2, 24],
                42: [2, 24],
                43: [2, 24],
                44: [2, 24],
                45: [2, 24],
                46: [2, 24],
                50: [2, 24],
                52: [2, 24]
              }, {
                18: [2, 25],
                25: [2, 25],
                33: [2, 25],
                42: [2, 25],
                43: [2, 25],
                44: [2, 25],
                45: [2, 25],
                46: [2, 25],
                50: [2, 25],
                52: [2, 25]
              }, {
                18: [2, 26],
                25: [2, 26],
                33: [2, 26],
                42: [2, 26],
                43: [2, 26],
                44: [2, 26],
                45: [2, 26],
                46: [2, 26],
                50: [2, 26],
                52: [2, 26]
              }, {
                18: [2, 27],
                25: [2, 27],
                33: [2, 27],
                42: [2, 27],
                43: [2, 27],
                44: [2, 27],
                45: [2, 27],
                46: [2, 27],
                50: [2, 27],
                52: [2, 27]
              }, {
                17: 76,
                30: 22,
                41: 23,
                50: [1, 26],
                52: [1, 25],
                53: 24
              }, {
                25: [2, 47]
              }, {
                18: [2, 29],
                25: [2, 29],
                33: [2, 29],
                46: [2, 29],
                49: 77,
                50: [1, 74]
              }, {
                18: [2, 37],
                25: [2, 37],
                33: [2, 37],
                42: [2, 37],
                43: [2, 37],
                44: [2, 37],
                45: [2, 37],
                46: [2, 37],
                50: [2, 37],
                51: [1, 78],
                52: [2, 37],
                54: [2, 37]
              }, {
                18: [2, 52],
                25: [2, 52],
                33: [2, 52],
                46: [2, 52],
                50: [2, 52]
              }, {
                12: [2, 13],
                13: [2, 13],
                16: [2, 13],
                24: [2, 13],
                26: [2, 13],
                28: [2, 13],
                29: [2, 13],
                31: [2, 13],
                32: [2, 13],
                34: [2, 13]
              }, {
                12: [2, 14],
                13: [2, 14],
                16: [2, 14],
                24: [2, 14],
                26: [2, 14],
                28: [2, 14],
                29: [2, 14],
                31: [2, 14],
                32: [2, 14],
                34: [2, 14]
              }, {
                12: [2, 10]
              }, {
                18: [2, 21],
                25: [2, 21],
                33: [2, 21],
                46: [2, 21]
              }, {
                18: [2, 49],
                25: [2, 49],
                33: [2, 49],
                42: [2, 49],
                43: [2, 49],
                44: [2, 49],
                45: [2, 49],
                46: [2, 49],
                50: [2, 49],
                52: [2, 49]
              }, {
                18: [2, 51],
                25: [2, 51],
                33: [2, 51],
                46: [2, 51]
              }, {
                18: [2, 36],
                25: [2, 36],
                33: [2, 36],
                42: [2, 36],
                43: [2, 36],
                44: [2, 36],
                45: [2, 36],
                46: [2, 36],
                50: [2, 36],
                52: [2, 36],
                54: [2, 36]
              }, {
                5: [2, 11],
                12: [2, 11],
                13: [2, 11],
                16: [2, 11],
                24: [2, 11],
                26: [2, 11],
                28: [2, 11],
                29: [2, 11],
                31: [2, 11],
                32: [2, 11],
                34: [2, 11]
              }, {
                30: 79,
                50: [1, 26],
                53: 24
              }, {
                29: [2, 15]
              }, {
                5: [2, 12],
                12: [2, 12],
                13: [2, 12],
                16: [2, 12],
                24: [2, 12],
                26: [2, 12],
                28: [2, 12],
                29: [2, 12],
                31: [2, 12],
                32: [2, 12],
                34: [2, 12]
              }, {
                25: [1, 80]
              }, {
                25: [2, 45]
              }, {
                51: [1, 78]
              }, {
                5: [2, 20],
                12: [2, 20],
                13: [2, 20],
                16: [2, 20],
                24: [2, 20],
                26: [2, 20],
                28: [2, 20],
                29: [2, 20],
                31: [2, 20],
                32: [2, 20],
                34: [2, 20]
              }, {
                46: [1, 81]
              }, {
                18: [2, 53],
                25: [2, 53],
                33: [2, 53],
                46: [2, 53],
                50: [2, 53]
              }, {
                30: 51,
                36: 82,
                41: 55,
                42: [1, 52],
                43: [1, 53],
                44: [1, 54],
                45: [1, 56],
                50: [1, 26],
                52: [1, 25],
                53: 24
              }, {
                25: [1, 83]
              }, {
                5: [2, 19],
                12: [2, 19],
                13: [2, 19],
                16: [2, 19],
                24: [2, 19],
                26: [2, 19],
                28: [2, 19],
                29: [2, 19],
                31: [2, 19],
                32: [2, 19],
                34: [2, 19]
              }, {
                18: [2, 28],
                25: [2, 28],
                33: [2, 28],
                42: [2, 28],
                43: [2, 28],
                44: [2, 28],
                45: [2, 28],
                46: [2, 28],
                50: [2, 28],
                52: [2, 28]
              }, {
                18: [2, 30],
                25: [2, 30],
                33: [2, 30],
                46: [2, 30],
                50: [2, 30]
              }, {
                5: [2, 16],
                12: [2, 16],
                13: [2, 16],
                16: [2, 16],
                24: [2, 16],
                26: [2, 16],
                28: [2, 16],
                29: [2, 16],
                31: [2, 16],
                32: [2, 16],
                34: [2, 16]
              }],
              defaultActions: {
                4: [2, 1],
                44: [2, 41],
                47: [2, 43],
                57: [2, 47],
                63: [2, 10],
                70: [2, 15],
                73: [2, 45]
              },
              parseError: function (t, e) {
                throw new Error(t)
              },
              parse: function (t) {
                var e = this,
                  n = [0],
                  i = [null],
                  r = [],
                  o = this.table,
                  a = "",
                  s = 0,
                  l = 0,
                  c = 0;
                this.lexer.setInput(t), this.lexer.yy = this.yy, this.yy.lexer = this.lexer, this.yy.parser = this, void 0 === this.lexer.yylloc && (this.lexer.yylloc = {});
                var u = this.lexer.yylloc;
                r.push(u);
                var d = this.lexer.options && this.lexer.options.ranges;
                "function" == typeof this.yy.parseError && (this.parseError = this.yy.parseError);
                for (var h, p, f, m, g, v, y, b, w, _ = {};;) {
                  if (f = n[n.length - 1], this.defaultActions[f] ? m = this.defaultActions[f] : (null !== h && void 0 !== h || (h = function () {
                      var t;
                      return "number" != typeof (t = e.lexer.lex() || 1) && (t = e.symbols_[t] || t), t
                    }()), m = o[f] && o[f][h]), void 0 === m || !m.length || !m[0]) {
                    var k = "";
                    if (!c) {
                      w = [];
                      for (v in o[f]) this.terminals_[v] && v > 2 && w.push("'" + this.terminals_[v] + "'");
                      k = this.lexer.showPosition ? "Parse error on line " + (s + 1) + ":\n" + this.lexer.showPosition() + "\nExpecting " + w.join(", ") + ", got '" + (this.terminals_[h] || h) + "'" : "Parse error on line " + (s + 1) + ": Unexpected " + (1 == h ? "end of input" : "'" + (this.terminals_[h] || h) + "'"), this.parseError(k, {
                        text: this.lexer.match,
                        token: this.terminals_[h] || h,
                        line: this.lexer.yylineno,
                        loc: u,
                        expected: w
                      })
                    }
                  }
                  if (m[0] instanceof Array && m.length > 1) throw new Error("Parse Error: multiple actions possible at state: " + f + ", token: " + h);
                  switch (m[0]) {
                    case 1:
                      n.push(h), i.push(this.lexer.yytext), r.push(this.lexer.yylloc), n.push(m[1]), h = null, p ? (h = p, p = null) : (l = this.lexer.yyleng, a = this.lexer.yytext, s = this.lexer.yylineno, u = this.lexer.yylloc, c > 0 && c--);
                      break;
                    case 2:
                      if (y = this.productions_[m[1]][1], _.$ = i[i.length - y], _._$ = {
                          first_line: r[r.length - (y || 1)].first_line,
                          last_line: r[r.length - 1].last_line,
                          first_column: r[r.length - (y || 1)].first_column,
                          last_column: r[r.length - 1].last_column
                        }, d && (_._$.range = [r[r.length - (y || 1)].range[0], r[r.length - 1].range[1]]), void 0 !== (g = this.performAction.call(_, a, l, s, this.yy, m[1], i, r))) return g;
                      y && (n = n.slice(0, -1 * y * 2), i = i.slice(0, -1 * y), r = r.slice(0, -1 * y)), n.push(this.productions_[m[1]][0]), i.push(_.$), r.push(_._$), b = o[n[n.length - 2]][n[n.length - 1]], n.push(b);
                      break;
                    case 3:
                      return !0
                  }
                }
                return !0
              }
            },
            n = function () {
              var t = {
                EOF: 1,
                parseError: function (t, e) {
                  if (!this.yy.parser) throw new Error(t);
                  this.yy.parser.parseError(t, e)
                },
                setInput: function (t) {
                  return this._input = t, this._more = this._less = this.done = !1, this.yylineno = this.yyleng = 0, this.yytext = this.matched = this.match = "", this.conditionStack = ["INITIAL"], this.yylloc = {
                    first_line: 1,
                    first_column: 0,
                    last_line: 1,
                    last_column: 0
                  }, this.options.ranges && (this.yylloc.range = [0, 0]), this.offset = 0, this
                },
                input: function () {
                  var t = this._input[0];
                  this.yytext += t, this.yyleng++, this.offset++, this.match += t, this.matched += t;
                  return t.match(/(?:\r\n?|\n).*/g) ? (this.yylineno++, this.yylloc.last_line++) : this.yylloc.last_column++, this.options.ranges && this.yylloc.range[1]++, this._input = this._input.slice(1), t
                },
                unput: function (t) {
                  var e = t.length,
                    n = t.split(/(?:\r\n?|\n)/g);
                  this._input = t + this._input, this.yytext = this.yytext.substr(0, this.yytext.length - e - 1), this.offset -= e;
                  var i = this.match.split(/(?:\r\n?|\n)/g);
                  this.match = this.match.substr(0, this.match.length - 1), this.matched = this.matched.substr(0, this.matched.length - 1), n.length - 1 && (this.yylineno -= n.length - 1);
                  var r = this.yylloc.range;
                  return this.yylloc = {
                    first_line: this.yylloc.first_line,
                    last_line: this.yylineno + 1,
                    first_column: this.yylloc.first_column,
                    last_column: n ? (n.length === i.length ? this.yylloc.first_column : 0) + i[i.length - n.length].length - n[0].length : this.yylloc.first_column - e
                  }, this.options.ranges && (this.yylloc.range = [r[0], r[0] + this.yyleng - e]), this
                },
                more: function () {
                  return this._more = !0, this
                },
                less: function (t) {
                  this.unput(this.match.slice(t))
                },
                pastInput: function () {
                  var t = this.matched.substr(0, this.matched.length - this.match.length);
                  return (t.length > 20 ? "..." : "") + t.substr(-20).replace(/\n/g, "")
                },
                upcomingInput: function () {
                  var t = this.match;
                  return t.length < 20 && (t += this._input.substr(0, 20 - t.length)), (t.substr(0, 20) + (t.length > 20 ? "..." : "")).replace(/\n/g, "")
                },
                showPosition: function () {
                  var t = this.pastInput(),
                    e = new Array(t.length + 1).join("-");
                  return t + this.upcomingInput() + "\n" + e + "^"
                },
                next: function () {
                  if (this.done) return this.EOF;
                  this._input || (this.done = !0);
                  var t, e, n, i, r;
                  this._more || (this.yytext = "", this.match = "");
                  for (var o = this._currentRules(), a = 0; a < o.length && (!(n = this._input.match(this.rules[o[a]])) || e && !(n[0].length > e[0].length) || (e = n, i = a, this.options.flex)); a++);
                  return e ? ((r = e[0].match(/(?:\r\n?|\n).*/g)) && (this.yylineno += r.length), this.yylloc = {
                    first_line: this.yylloc.last_line,
                    last_line: this.yylineno + 1,
                    first_column: this.yylloc.last_column,
                    last_column: r ? r[r.length - 1].length - r[r.length - 1].match(/\r?\n?/)[0].length : this.yylloc.last_column + e[0].length
                  }, this.yytext += e[0], this.match += e[0], this.matches = e, this.yyleng = this.yytext.length, this.options.ranges && (this.yylloc.range = [this.offset, this.offset += this.yyleng]), this._more = !1, this._input = this._input.slice(e[0].length), this.matched += e[0], t = this.performAction.call(this, this.yy, this, o[i], this.conditionStack[this.conditionStack.length - 1]), this.done && this._input && (this.done = !1), t || void 0) : "" === this._input ? this.EOF : this.parseError("Lexical error on line " + (this.yylineno + 1) + ". Unrecognized text.\n" + this.showPosition(), {
                    text: "",
                    token: null,
                    line: this.yylineno
                  })
                },
                lex: function () {
                  var t = this.next();
                  return void 0 !== t ? t : this.lex()
                },
                begin: function (t) {
                  this.conditionStack.push(t)
                },
                popState: function () {
                  return this.conditionStack.pop()
                },
                _currentRules: function () {
                  return this.conditions[this.conditionStack[this.conditionStack.length - 1]].rules
                },
                topState: function () {
                  return this.conditionStack[this.conditionStack.length - 2]
                },
                pushState: function (t) {
                  this.begin(t)
                }
              };
              return t.options = {}, t.performAction = function (t, e, n, i) {
                function r(t, n) {
                  return e.yytext = e.yytext.substr(t, e.yyleng - n)
                }
                switch (n) {
                  case 0:
                    if ("\\\\" === e.yytext.slice(-2) ? (r(0, 1), this.begin("mu")) : "\\" === e.yytext.slice(-1) ? (r(0, 1), this.begin("emu")) : this.begin("mu"), e.yytext) return 12;
                    break;
                  case 1:
                    return 12;
                  case 2:
                    return this.popState(), 12;
                  case 3:
                    return e.yytext = e.yytext.substr(5, e.yyleng - 9), this.popState(), 15;
                  case 4:
                    return 12;
                  case 5:
                    return r(0, 4), this.popState(), 13;
                  case 6:
                    return 45;
                  case 7:
                    return 46;
                  case 8:
                    return 16;
                  case 9:
                    return this.popState(), this.begin("raw"), 18;
                  case 10:
                    return 34;
                  case 11:
                    return 24;
                  case 12:
                    return 29;
                  case 13:
                  case 14:
                    return this.popState(), 28;
                  case 15:
                  case 16:
                    return 26;
                  case 17:
                    return 32;
                  case 18:
                    return 31;
                  case 19:
                    this.popState(), this.begin("com");
                    break;
                  case 20:
                    return r(3, 5), this.popState(), 13;
                  case 21:
                    return 31;
                  case 22:
                    return 51;
                  case 23:
                  case 24:
                    return 50;
                  case 25:
                    return 54;
                  case 26:
                    break;
                  case 27:
                    return this.popState(), 33;
                  case 28:
                    return this.popState(), 25;
                  case 29:
                    return e.yytext = r(1, 2).replace(/\\"/g, '"'), 42;
                  case 30:
                    return e.yytext = r(1, 2).replace(/\\'/g, "'"), 42;
                  case 31:
                    return 52;
                  case 32:
                  case 33:
                    return 44;
                  case 34:
                    return 43;
                  case 35:
                    return 50;
                  case 36:
                    return e.yytext = r(1, 2), 50;
                  case 37:
                    return "INVALID";
                  case 38:
                    return 5
                }
              }, t.rules = [/^(?:[^\x00]*?(?=(\{\{)))/, /^(?:[^\x00]+)/, /^(?:[^\x00]{2,}?(?=(\{\{|\\\{\{|\\\\\{\{|$)))/, /^(?:\{\{\{\{\/[^\s!"#%-,\.\/;->@\[-\^`\{-~]+(?=[=}\s\/.])\}\}\}\})/, /^(?:[^\x00]*?(?=(\{\{\{\{\/)))/, /^(?:[\s\S]*?--\}\})/, /^(?:\()/, /^(?:\))/, /^(?:\{\{\{\{)/, /^(?:\}\}\}\})/, /^(?:\{\{(~)?>)/, /^(?:\{\{(~)?#)/, /^(?:\{\{(~)?\/)/, /^(?:\{\{(~)?\^\s*(~)?\}\})/, /^(?:\{\{(~)?\s*else\s*(~)?\}\})/, /^(?:\{\{(~)?\^)/, /^(?:\{\{(~)?\s*else\b)/, /^(?:\{\{(~)?\{)/, /^(?:\{\{(~)?&)/, /^(?:\{\{!--)/, /^(?:\{\{![\s\S]*?\}\})/, /^(?:\{\{(~)?)/, /^(?:=)/, /^(?:\.\.)/, /^(?:\.(?=([=~}\s\/.)])))/, /^(?:[\/.])/, /^(?:\s+)/, /^(?:\}(~)?\}\})/, /^(?:(~)?\}\})/, /^(?:"(\\["]|[^"])*")/, /^(?:'(\\[']|[^'])*')/, /^(?:@)/, /^(?:true(?=([~}\s)])))/, /^(?:false(?=([~}\s)])))/, /^(?:-?[0-9]+(?:\.[0-9]+)?(?=([~}\s)])))/, /^(?:([^\s!"#%-,\.\/;->@\[-\^`\{-~]+(?=([=~}\s\/.)]))))/, /^(?:\[[^\]]*\])/, /^(?:.)/, /^(?:$)/], t.conditions = {
                mu: {
                  rules: [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38],
                  inclusive: !1
                },
                emu: {
                  rules: [2],
                  inclusive: !1
                },
                com: {
                  rules: [5],
                  inclusive: !1
                },
                raw: {
                  rules: [3, 4],
                  inclusive: !1
                },
                INITIAL: {
                  rules: [0, 1, 38],
                  inclusive: !0
                }
              }, t
            }();
          return e.lexer = n, t.prototype = e, e.Parser = t, new t
        }(),
        c = function (t) {
          function e(t, e, n) {
            void 0 === e && (e = t.length);
            var i = t[e - 1],
              r = t[e - 2];
            return i ? "content" === i.type ? (r || !n ? /\r?\n\s*?$/ : /(^|\r?\n)\s*?$/).test(i.original) : void 0 : n
          }

          function i(t, e, n) {
            void 0 === e && (e = -1);
            var i = t[e + 1],
              r = t[e + 2];
            return i ? "content" === i.type ? (r || !n ? /^\s*?\r?\n/ : /^\s*?(\r?\n|$)/).test(i.original) : void 0 : n
          }

          function r(t, e, n) {
            var i = t[null == e ? 0 : e + 1];
            if (i && "content" === i.type && (n || !i.rightStripped)) {
              var r = i.string;
              i.string = i.string.replace(n ? /^\s+/ : /^[ \t]*\r?\n?/, ""), i.rightStripped = i.string !== r
            }
          }

          function o(t, e, n) {
            var i = t[null == e ? t.length - 1 : e - 1];
            if (i && "content" === i.type && (n || !i.leftStripped)) {
              var r = i.string;
              return i.string = i.string.replace(n ? /\s+$/ : /[ \t]+$/, ""), i.leftStripped = i.string !== r, i.leftStripped
            }
          }
          var a = {},
            s = n;
          return a.stripFlags = function (t, e) {
            return {
              left: "~" === t.charAt(2),
              right: "~" === e.charAt(e.length - 3)
            }
          }, a.prepareBlock = function (t, n, a, l, c, u) {
            if (t.sexpr.id.original !== l.path.original) throw new s(t.sexpr.id.original + " doesn't match " + l.path.original, t);
            var d = a && a.program,
              h = {
                left: t.strip.left,
                right: l.strip.right,
                openStandalone: i(n.statements),
                closeStandalone: e((d || n).statements)
              };
            if (t.strip.right && r(n.statements, null, !0), d) {
              var p = a.strip;
              p.left && o(n.statements, null, !0), p.right && r(d.statements, null, !0), l.strip.left && o(d.statements, null, !0), e(n.statements) && i(d.statements) && (o(n.statements), r(d.statements))
            } else l.strip.left && o(n.statements, null, !0);
            return c ? new this.BlockNode(t, d, n, h, u) : new this.BlockNode(t, n, d, h, u)
          }, a.prepareProgram = function (t, n) {
            for (var a = 0, s = t.length; a < s; a++) {
              var l = t[a],
                c = l.strip;
              if (c) {
                var u = e(t, a, n, l.type),
                  d = i(t, a, n),
                  h = c.openStandalone && u,
                  p = c.closeStandalone && d,
                  f = c.inlineStandalone && u && d;
                c.right && r(t, a, !0), c.left && o(t, a, !0), f && (r(t, a), o(t, a) && "partial" === l.type && (l.indent = /([ \t]+$)/.exec(t[a - 1].original) ? RegExp.$1 : "")), h && (r((l.program || l.inverse).statements), o(t, a)), p && (r(t, a), o((l.inverse || l.program).statements))
              }
            }
            return t
          }, a
        }();
      return function (t, e, n, i, r) {
        var o = a,
          l = s,
          c = n.parser,
          u = n.parse,
          d = i.Compiler,
          h = i.compile,
          p = i.precompile,
          f = r,
          m = o.create,
          g = function () {
            var t = m();
            return t.compile = function (e, n) {
              return h(e, n, t)
            }, t.precompile = function (e, n) {
              return p(e, n, t)
            }, t.AST = l, t.Compiler = d, t.JavaScriptCompiler = f, t.Parser = c, t.parse = u, t
          };
        return o = g(), o.create = g, o.default = o, o
      }(0, 0, function (t, n, i, r) {
        var o = {},
          a = l,
          u = s,
          d = c,
          h = e.extend;
        o.parser = a;
        var p = {};
        return h(p, d, u), o.parse = function (t) {
          return t.constructor === u.ProgramNode ? t : (a.yy = p, a.parse(t))
        }, o
      }(), function (t, i) {
        function r() {}

        function o(t, e) {
          if (t === e) return !0;
          if (l(t) && l(e) && t.length === e.length) {
            for (var n = 0; n < t.length; n++)
              if (!o(t[n], e[n])) return !1;
            return !0
          }
        }
        var a = {},
          s = n,
          l = e.isArray,
          c = [].slice;
        return a.Compiler = r, r.prototype = {
          compiler: r,
          equals: function (t) {
            var e = this.opcodes.length;
            if (t.opcodes.length !== e) return !1;
            for (var n = 0; n < e; n++) {
              var i = this.opcodes[n],
                r = t.opcodes[n];
              if (i.opcode !== r.opcode || !o(i.args, r.args)) return !1
            }
            for (e = this.children.length, n = 0; n < e; n++)
              if (!this.children[n].equals(t.children[n])) return !1;
            return !0
          },
          guid: 0,
          compile: function (t, e) {
            this.opcodes = [], this.children = [], this.depths = {
              list: []
            }, this.options = e, this.stringParams = e.stringParams, this.trackIds = e.trackIds;
            var n = this.options.knownHelpers;
            if (this.options.knownHelpers = {
                helperMissing: !0,
                blockHelperMissing: !0,
                each: !0,
                if: !0,
                unless: !0,
                with: !0,
                log: !0,
                lookup: !0
              }, n)
              for (var i in n) this.options.knownHelpers[i] = n[i];
            return this.accept(t)
          },
          accept: function (t) {
            return this[t.type](t)
          },
          program: function (t) {
            for (var e = t.statements, n = 0, i = e.length; n < i; n++) this.accept(e[n]);
            return this.isSimple = 1 === i, this.depths.list = this.depths.list.sort(function (t, e) {
              return t - e
            }), this
          },
          compileProgram: function (t) {
            var e, n = (new this.compiler).compile(t, this.options),
              i = this.guid++;
            this.usePartial = this.usePartial || n.usePartial, this.children[i] = n;
            for (var r = 0, o = n.depths.list.length; r < o; r++)(e = n.depths.list[r]) < 2 || this.addDepth(e - 1);
            return i
          },
          block: function (t) {
            var e = t.mustache,
              n = t.program,
              i = t.inverse;
            n && (n = this.compileProgram(n)), i && (i = this.compileProgram(i));
            var r = e.sexpr,
              o = this.classifySexpr(r);
            "helper" === o ? this.helperSexpr(r, n, i) : "simple" === o ? (this.simpleSexpr(r), this.opcode("pushProgram", n), this.opcode("pushProgram", i), this.opcode("emptyHash"), this.opcode("blockValue", r.id.original)) : (this.ambiguousSexpr(r, n, i), this.opcode("pushProgram", n), this.opcode("pushProgram", i), this.opcode("emptyHash"), this.opcode("ambiguousBlockValue")), this.opcode("append")
          },
          hash: function (t) {
            var e, n, i = t.pairs;
            for (this.opcode("pushHash"), e = 0, n = i.length; e < n; e++) this.pushParam(i[e][1]);
            for (; e--;) this.opcode("assignToHash", i[e][0]);
            this.opcode("popHash")
          },
          partial: function (t) {
            var e = t.partialName;
            this.usePartial = !0, t.hash ? this.accept(t.hash) : this.opcode("push", "undefined"), t.context ? this.accept(t.context) : (this.opcode("getContext", 0), this.opcode("pushContext")), this.opcode("invokePartial", e.name, t.indent || ""), this.opcode("append")
          },
          content: function (t) {
            t.string && this.opcode("appendContent", t.string)
          },
          mustache: function (t) {
            this.sexpr(t.sexpr), t.escaped && !this.options.noEscape ? this.opcode("appendEscaped") : this.opcode("append")
          },
          ambiguousSexpr: function (t, e, n) {
            var i = t.id,
              r = i.parts[0],
              o = null != e || null != n;
            this.opcode("getContext", i.depth), this.opcode("pushProgram", e), this.opcode("pushProgram", n), this.ID(i), this.opcode("invokeAmbiguous", r, o)
          },
          simpleSexpr: function (t) {
            var e = t.id;
            "DATA" === e.type ? this.DATA(e) : e.parts.length ? this.ID(e) : (this.addDepth(e.depth), this.opcode("getContext", e.depth), this.opcode("pushContext")), this.opcode("resolvePossibleLambda")
          },
          helperSexpr: function (t, e, n) {
            var i = this.setupFullMustacheParams(t, e, n),
              r = t.id,
              o = r.parts[0];
            if (this.options.knownHelpers[o]) this.opcode("invokeKnownHelper", i.length, o);
            else {
              if (this.options.knownHelpersOnly) throw new s("You specified knownHelpersOnly, but used the unknown helper " + o, t);
              r.falsy = !0, this.ID(r), this.opcode("invokeHelper", i.length, r.original, r.isSimple)
            }
          },
          sexpr: function (t) {
            var e = this.classifySexpr(t);
            "simple" === e ? this.simpleSexpr(t) : "helper" === e ? this.helperSexpr(t) : this.ambiguousSexpr(t)
          },
          ID: function (t) {
            this.addDepth(t.depth), this.opcode("getContext", t.depth);
            t.parts[0] ? this.opcode("lookupOnContext", t.parts, t.falsy, t.isScoped) : this.opcode("pushContext")
          },
          DATA: function (t) {
            this.options.data = !0, this.opcode("lookupData", t.id.depth, t.id.parts)
          },
          STRING: function (t) {
            this.opcode("pushString", t.string)
          },
          NUMBER: function (t) {
            this.opcode("pushLiteral", t.number)
          },
          BOOLEAN: function (t) {
            this.opcode("pushLiteral", t.bool)
          },
          comment: function () {},
          opcode: function (t) {
            this.opcodes.push({
              opcode: t,
              args: c.call(arguments, 1)
            })
          },
          addDepth: function (t) {
            0 !== t && (this.depths[t] || (this.depths[t] = !0, this.depths.list.push(t)))
          },
          classifySexpr: function (t) {
            var e = t.isHelper,
              n = t.eligibleHelper,
              i = this.options;
            if (n && !e) {
              var r = t.id.parts[0];
              i.knownHelpers[r] ? e = !0 : i.knownHelpersOnly && (n = !1)
            }
            return e ? "helper" : n ? "ambiguous" : "simple"
          },
          pushParams: function (t) {
            for (var e = 0, n = t.length; e < n; e++) this.pushParam(t[e])
          },
          pushParam: function (t) {
            this.stringParams ? (t.depth && this.addDepth(t.depth), this.opcode("getContext", t.depth || 0), this.opcode("pushStringParam", t.stringModeValue, t.type), "sexpr" === t.type && this.sexpr(t)) : (this.trackIds && this.opcode("pushId", t.type, t.idName || t.stringModeValue), this.accept(t))
          },
          setupFullMustacheParams: function (t, e, n) {
            var i = t.params;
            return this.pushParams(i), this.opcode("pushProgram", e), this.opcode("pushProgram", n), t.hash ? this.hash(t.hash) : this.opcode("emptyHash"), i
          }
        }, a.precompile = function (t, e, n) {
          if (null == t || "string" != typeof t && t.constructor !== n.AST.ProgramNode) throw new s("You must pass a string or Handlebars AST to Handlebars.precompile. You passed " + t);
          "data" in (e = e || {}) || (e.data = !0), e.compat && (e.useDepths = !0);
          var i = n.parse(t),
            r = (new n.Compiler).compile(i, e);
          return (new n.JavaScriptCompiler).compile(r, e)
        }, a.compile = function (t, e, n) {
          function i() {
            var i = n.parse(t),
              r = (new n.Compiler).compile(i, e),
              o = (new n.JavaScriptCompiler).compile(r, e, void 0, !0);
            return n.template(o)
          }
          if (null == t || "string" != typeof t && t.constructor !== n.AST.ProgramNode) throw new s("You must pass a string or Handlebars AST to Handlebars.compile. You passed " + t);
          "data" in (e = e || {}) || (e.data = !0), e.compat && (e.useDepths = !0);
          var r, o = function (t, e) {
            return r || (r = i()), r.call(this, t, e)
          };
          return o._setup = function (t) {
            return r || (r = i()), r._setup(t)
          }, o._child = function (t, e, n) {
            return r || (r = i()), r._child(t, e, n)
          }, o
        }, a
      }(), function (t, e) {
        function n(t) {
          this.value = t
        }

        function i() {}
        var r = t.COMPILER_REVISION,
          o = t.REVISION_CHANGES,
          a = e;
        i.prototype = {
          nameLookup: function (t, e) {
            return i.isValidJavaScriptVariableName(e) ? t + "." + e : t + "['" + e + "']"
          },
          depthedLookup: function (t) {
            return this.aliases.lookup = "this.lookup", 'lookup(depths, "' + t + '")'
          },
          compilerInfo: function () {
            var t = r;
            return [t, o[t]]
          },
          appendToBuffer: function (t) {
            return this.environment.isSimple ? "return " + t + ";" : {
              appendToBuffer: !0,
              content: t,
              toString: function () {
                return "buffer += " + t + ";"
              }
            }
          },
          initializeBuffer: function () {
            return this.quotedString("")
          },
          namespace: "Handlebars",
          compile: function (t, e, n, i) {
            this.environment = t, this.options = e, this.stringParams = this.options.stringParams, this.trackIds = this.options.trackIds, this.precompile = !i, this.name = this.environment.name, this.isChild = !!n, this.context = n || {
              programs: [],
              environments: []
            }, this.preamble(), this.stackSlot = 0, this.stackVars = [], this.aliases = {}, this.registers = {
              list: []
            }, this.hashes = [], this.compileStack = [], this.inlineStack = [], this.compileChildren(t, e), this.useDepths = this.useDepths || t.depths.list.length || this.options.compat;
            var r, o, s, l = t.opcodes;
            for (o = 0, s = l.length; o < s; o++) this[(r = l[o]).opcode].apply(this, r.args);
            if (this.pushSource(""), this.stackSlot || this.inlineStack.length || this.compileStack.length) throw new a("Compile completed with content left on stack");
            var c = this.createFunctionContext(i);
            if (this.isChild) return c;
            var u = {
                compiler: this.compilerInfo(),
                main: c
              },
              d = this.context.programs;
            for (o = 0, s = d.length; o < s; o++) d[o] && (u[o] = d[o]);
            return this.environment.usePartial && (u.usePartial = !0), this.options.data && (u.useData = !0), this.useDepths && (u.useDepths = !0), this.options.compat && (u.compat = !0), i || (u.compiler = JSON.stringify(u.compiler), u = this.objectLiteral(u)), u
          },
          preamble: function () {
            this.lastContext = 0, this.source = []
          },
          createFunctionContext: function (t) {
            var e = "",
              n = this.stackVars.concat(this.registers.list);
            n.length > 0 && (e += ", " + n.join(", "));
            for (var i in this.aliases) this.aliases.hasOwnProperty(i) && (e += ", " + i + "=" + this.aliases[i]);
            var r = ["depth0", "helpers", "partials", "data"];
            this.useDepths && r.push("depths");
            var o = this.mergeSource(e);
            return t ? (r.push(o), Function.apply(this, r)) : "function(" + r.join(",") + ") {\n  " + o + "}"
          },
          mergeSource: function (t) {
            for (var e, n, i = "", r = !this.forceBuffer, o = 0, a = this.source.length; o < a; o++) {
              var s = this.source[o];
              s.appendToBuffer ? e = e ? e + "\n    + " + s.content : s.content : (e && (i ? i += "buffer += " + e + ";\n  " : (n = !0, i = e + ";\n  "), e = void 0), i += s + "\n  ", this.environment.isSimple || (r = !1))
            }
            return r ? !e && i || (i += "return " + (e || '""') + ";\n") : (t += ", buffer = " + (n ? "" : this.initializeBuffer()), i += e ? "return buffer + " + e + ";\n" : "return buffer;\n"), t && (i = "var " + t.substring(2) + (n ? "" : ";\n  ") + i), i
          },
          blockValue: function (t) {
            this.aliases.blockHelperMissing = "helpers.blockHelperMissing";
            var e = [this.contextName(0)];
            this.setupParams(t, 0, e);
            var n = this.popStack();
            e.splice(1, 0, n), this.push("blockHelperMissing.call(" + e.join(", ") + ")")
          },
          ambiguousBlockValue: function () {
            this.aliases.blockHelperMissing = "helpers.blockHelperMissing";
            var t = [this.contextName(0)];
            this.setupParams("", 0, t, !0), this.flushInline();
            var e = this.topStack();
            t.splice(1, 0, e), this.pushSource("if (!" + this.lastHelper + ") { " + e + " = blockHelperMissing.call(" + t.join(", ") + "); }")
          },
          appendContent: function (t) {
            this.pendingContent && (t = this.pendingContent + t), this.pendingContent = t
          },
          append: function () {
            this.flushInline();
            var t = this.popStack();
            this.pushSource("if (" + t + " != null) { " + this.appendToBuffer(t) + " }"), this.environment.isSimple && this.pushSource("else { " + this.appendToBuffer("''") + " }")
          },
          appendEscaped: function () {
            this.aliases.escapeExpression = "this.escapeExpression", this.pushSource(this.appendToBuffer("escapeExpression(" + this.popStack() + ")"))
          },
          getContext: function (t) {
            this.lastContext = t
          },
          pushContext: function () {
            this.pushStackLiteral(this.contextName(this.lastContext))
          },
          lookupOnContext: function (t, e, n) {
            var i = 0,
              r = t.length;
            for (n || !this.options.compat || this.lastContext ? this.pushContext() : this.push(this.depthedLookup(t[i++])); i < r; i++) this.replaceStack(function (n) {
              var r = this.nameLookup(n, t[i], "context");
              return e ? " && " + r : " != null ? " + r + " : " + n
            })
          },
          lookupData: function (t, e) {
            t ? this.pushStackLiteral("this.data(data, " + t + ")") : this.pushStackLiteral("data");
            for (var n = e.length, i = 0; i < n; i++) this.replaceStack(function (t) {
              return " && " + this.nameLookup(t, e[i], "data")
            })
          },
          resolvePossibleLambda: function () {
            this.aliases.lambda = "this.lambda", this.push("lambda(" + this.popStack() + ", " + this.contextName(0) + ")")
          },
          pushStringParam: function (t, e) {
            this.pushContext(), this.pushString(e), "sexpr" !== e && ("string" == typeof t ? this.pushString(t) : this.pushStackLiteral(t))
          },
          emptyHash: function () {
            this.pushStackLiteral("{}"), this.trackIds && this.push("{}"), this.stringParams && (this.push("{}"), this.push("{}"))
          },
          pushHash: function () {
            this.hash && this.hashes.push(this.hash), this.hash = {
              values: [],
              types: [],
              contexts: [],
              ids: []
            }
          },
          popHash: function () {
            var t = this.hash;
            this.hash = this.hashes.pop(), this.trackIds && this.push("{" + t.ids.join(",") + "}"), this.stringParams && (this.push("{" + t.contexts.join(",") + "}"), this.push("{" + t.types.join(",") + "}")), this.push("{\n    " + t.values.join(",\n    ") + "\n  }")
          },
          pushString: function (t) {
            this.pushStackLiteral(this.quotedString(t))
          },
          push: function (t) {
            return this.inlineStack.push(t), t
          },
          pushLiteral: function (t) {
            this.pushStackLiteral(t)
          },
          pushProgram: function (t) {
            null != t ? this.pushStackLiteral(this.programExpression(t)) : this.pushStackLiteral(null)
          },
          invokeHelper: function (t, e, n) {
            this.aliases.helperMissing = "helpers.helperMissing";
            var i = this.popStack(),
              r = this.setupHelper(t, e),
              o = (n ? r.name + " || " : "") + i + " || helperMissing";
            this.push("((" + o + ").call(" + r.callParams + "))")
          },
          invokeKnownHelper: function (t, e) {
            var n = this.setupHelper(t, e);
            this.push(n.name + ".call(" + n.callParams + ")")
          },
          invokeAmbiguous: function (t, e) {
            this.aliases.functionType = '"function"', this.aliases.helperMissing = "helpers.helperMissing", this.useRegister("helper");
            var n = this.popStack();
            this.emptyHash();
            var i = this.setupHelper(0, t, e),
              r = this.lastHelper = this.nameLookup("helpers", t, "helper");
            this.push("((helper = (helper = " + r + " || " + n + ") != null ? helper : helperMissing" + (i.paramsInit ? "),(" + i.paramsInit : "") + "),(typeof helper === functionType ? helper.call(" + i.callParams + ") : helper))")
          },
          invokePartial: function (t, e) {
            var n = [this.nameLookup("partials", t, "partial"), "'" + e + "'", "'" + t + "'", this.popStack(), this.popStack(), "helpers", "partials"];
            this.options.data ? n.push("data") : this.options.compat && n.push("undefined"), this.options.compat && n.push("depths"), this.push("this.invokePartial(" + n.join(", ") + ")")
          },
          assignToHash: function (t) {
            var e, n, i, r = this.popStack();
            this.trackIds && (i = this.popStack()), this.stringParams && (n = this.popStack(), e = this.popStack());
            var o = this.hash;
            e && o.contexts.push("'" + t + "': " + e), n && o.types.push("'" + t + "': " + n), i && o.ids.push("'" + t + "': " + i), o.values.push("'" + t + "': (" + r + ")")
          },
          pushId: function (t, e) {
            "ID" === t || "DATA" === t ? this.pushString(e) : "sexpr" === t ? this.pushStackLiteral("true") : this.pushStackLiteral("null")
          },
          compiler: i,
          compileChildren: function (t, e) {
            for (var n, i, r = t.children, o = 0, a = r.length; o < a; o++) {
              n = r[o], i = new this.compiler;
              var s = this.matchExistingProgram(n);
              null == s ? (this.context.programs.push(""), s = this.context.programs.length, n.index = s, n.name = "program" + s, this.context.programs[s] = i.compile(n, e, this.context, !this.precompile), this.context.environments[s] = n, this.useDepths = this.useDepths || i.useDepths) : (n.index = s, n.name = "program" + s)
            }
          },
          matchExistingProgram: function (t) {
            for (var e = 0, n = this.context.environments.length; e < n; e++) {
              var i = this.context.environments[e];
              if (i && i.equals(t)) return e
            }
          },
          programExpression: function (t) {
            var e = this.environment.children[t],
              n = (e.depths.list, this.useDepths),
              i = [e.index, "data"];
            return n && i.push("depths"), "this.program(" + i.join(", ") + ")"
          },
          useRegister: function (t) {
            this.registers[t] || (this.registers[t] = !0, this.registers.list.push(t))
          },
          pushStackLiteral: function (t) {
            return this.push(new n(t))
          },
          pushSource: function (t) {
            this.pendingContent && (this.source.push(this.appendToBuffer(this.quotedString(this.pendingContent))), this.pendingContent = void 0), t && this.source.push(t)
          },
          pushStack: function (t) {
            this.flushInline();
            var e = this.incrStack();
            return this.pushSource(e + " = " + t + ";"), this.compileStack.push(e), e
          },
          replaceStack: function (t) {
            var e, i, r, o = "";
            this.isInline();
            if (!this.isInline()) throw new a("replaceStack on non-inline");
            var s = this.popStack(!0);
            if (s instanceof n) o = e = s.value, r = !0;
            else {
              var l = (i = !this.stackSlot) ? this.incrStack() : this.topStackName();
              o = "(" + this.push(l) + " = " + s + ")", e = this.topStack()
            }
            var c = t.call(this, e);
            r || this.popStack(), i && this.stackSlot--, this.push("(" + o + c + ")")
          },
          incrStack: function () {
            return this.stackSlot++, this.stackSlot > this.stackVars.length && this.stackVars.push("stack" + this.stackSlot), this.topStackName()
          },
          topStackName: function () {
            return "stack" + this.stackSlot
          },
          flushInline: function () {
            var t = this.inlineStack;
            if (t.length) {
              this.inlineStack = [];
              for (var e = 0, i = t.length; e < i; e++) {
                var r = t[e];
                r instanceof n ? this.compileStack.push(r) : this.pushStack(r)
              }
            }
          },
          isInline: function () {
            return this.inlineStack.length
          },
          popStack: function (t) {
            var e = this.isInline(),
              i = (e ? this.inlineStack : this.compileStack).pop();
            if (!t && i instanceof n) return i.value;
            if (!e) {
              if (!this.stackSlot) throw new a("Invalid stack pop");
              this.stackSlot--
            }
            return i
          },
          topStack: function () {
            var t = this.isInline() ? this.inlineStack : this.compileStack,
              e = t[t.length - 1];
            return e instanceof n ? e.value : e
          },
          contextName: function (t) {
            return this.useDepths && t ? "depths[" + t + "]" : "depth" + t
          },
          quotedString: function (t) {
            return '"' + t.replace(/\\/g, "\\\\").replace(/"/g, '\\"').replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\u2028/g, "\\u2028").replace(/\u2029/g, "\\u2029") + '"'
          },
          objectLiteral: function (t) {
            var e = [];
            for (var n in t) t.hasOwnProperty(n) && e.push(this.quotedString(n) + ":" + t[n]);
            return "{" + e.join(",") + "}"
          },
          setupHelper: function (t, e, n) {
            var i = [];
            return {
              params: i,
              paramsInit: this.setupParams(e, t, i, n),
              name: this.nameLookup("helpers", e, "helper"),
              callParams: [this.contextName(0)].concat(i).join(", ")
            }
          },
          setupOptions: function (t, e, n) {
            var i, r, o, a = {},
              s = [],
              l = [],
              c = [];
            a.name = this.quotedString(t), a.hash = this.popStack(), this.trackIds && (a.hashIds = this.popStack()), this.stringParams && (a.hashTypes = this.popStack(), a.hashContexts = this.popStack()), r = this.popStack(), ((o = this.popStack()) || r) && (o || (o = "this.noop"), r || (r = "this.noop"), a.fn = o, a.inverse = r);
            for (var u = e; u--;) i = this.popStack(), n[u] = i, this.trackIds && (c[u] = this.popStack()), this.stringParams && (l[u] = this.popStack(), s[u] = this.popStack());
            return this.trackIds && (a.ids = "[" + c.join(",") + "]"), this.stringParams && (a.types = "[" + l.join(",") + "]", a.contexts = "[" + s.join(",") + "]"), this.options.data && (a.data = "data"), a
          },
          setupParams: function (t, e, n, i) {
            var r = this.objectLiteral(this.setupOptions(t, e, n));
            return i ? (this.useRegister("options"), n.push("options"), "options=" + r) : (n.push(r), "")
          }
        };
        for (var s = "break else new var case finally return void catch for switch while continue function this with default if throw delete in try do instanceof typeof abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws const goto private transient debugger implements protected volatile double import public let yield".split(" "), l = i.RESERVED_WORDS = {}, c = 0, u = s.length; c < u; c++) l[s[c]] = !0;
        return i.isValidJavaScriptVariableName = function (t) {
          return !i.RESERVED_WORDS[t] && /^[a-zA-Z_$][0-9a-zA-Z_$]*$/.test(t)
        }, i
      }(r, n))
    })
  }, {}],
  259: [function (t, e, n) {
    "use strict";
    var i = t("./handlebars"),
      r = t("underscore"),
      o = t("../core_modules"),
      a = t("../_modules/incentives").trackIncentiveData,
      s = o.mailingList,
      l = o.analytics,
      c = o.geoip;
    n.init = function () {
      function t(t) {
        s.didPressSubmit({
          form: t,
          data: {
            type: "general",
            sub_type: "incentives",
            postal_code: d
          }
        })
      }

      function e(e, i, s, c) {
        var h;
        if (v.removeClass("no-offers no-location is-filtered" + u), $(".filter-options-checkbox").prop("disabled", !1), $("#filter-partner-type-all, #filter-device-all").prop("checked", !0), e && !i ? (h = "?country=" + (i = $("html").attr("lang").split("-")[1]) + "&postal_code=" + e, l.trackEvent({
            gtm: {
              event: "gaEvent",
              gaCategory: "Partners",
              gaAction: "Incentive Zip Active",
              gaLabel: e
            }
          })) : e && i ? (h = "?country=" + i + "&postal_code=" + e, l.trackEvent({
            gtm: {
              event: "gaEvent",
              gaCategory: "Partners",
              gaAction: "Incentive Zip Passive",
              gaLabel: e
            }
          })) : s && c ? (h = "?lat=" + s + "&lng=" + c, d && l.trackEvent({
            gtm: {
              event: "gaEvent",
              gaCategory: "Partners",
              gaAction: "Incentive Zip Passive",
              gaLabel: d
            }
          })) : (v.addClass("no-location"), $(".incentives-inner-container").removeClass("is-loading"), $(".zip-form-input").addClass("needs-attention")), h) {
          var p = "rebates" === o.utilities.getQueryValue("referrer") ? "&post_purchase=true" : "";
          $.ajax({
            url: y + h + p,
            type: "GET",
            timeout: "5000",
            dataType: "json"
          }).done(function (e) {
            if (m = e, a(e), m.incentives && m.incentives[0]) {
              for (var n, i, o = m.incentives, s = o.length; s--;)(function (t) {
                var e = t.devices.indexOf("thermostat-e");
                ~e && (t.devices[e] = "thermostat", t.devices = r.uniq(t.devices))
              })(n = o[s]), (i = n.devices.slice(0)).push(n.provides.toLowerCase()), o[s].filter = i.join("|");
              var c = w(m);
              $(".incentives-list").html(c), $(".incentives-inner-container").removeClass("is-loading"), $("#incentives_with_partners-email-signup").on("submit", function (e) {
                e.preventDefault(), t($(this))
              }), $(".incentives-list .learn-more-link").each(function (t, e) {
                var n = $(e).attr("data-partner-name"),
                  i = $(e).attr("data-partner-id");
                l.trackEvent(e, "click", {
                  gtm: {
                    event: "gaEvent",
                    gaCategory: "Partners",
                    gaAction: "Incentive Search Result",
                    gaLabel: n + " - " + i
                  }
                })
              })
            } else v.addClass("no-offers"), $(".filter-options-checkbox").prop("disabled", !0), $(".incentives-inner-container").removeClass("is-loading")
          }).fail(function () {
            n("failedAPI")
          })
        }
      }

      function n(t) {
        var e;
        switch ($(".incentives-inner-container").removeClass("is-loading"), t) {
          case "failedAPI":
            v.addClass("no-location");
            break;
          case "zipError":
            $("#zip-form").addClass("has-zip-error"), e = $("#zip-form .error").data("zip-error"), $("#zip-form .error").text(e);
            break;
          case "noZip":
            $("#zip-form").addClass("has-zip-error"), e = $("#zip-form .error").data("no-zip-error"), $("#zip-form .error").text(e)
        }
      }
      var u, d, h, p, f, m, g, v = $("body"),
        y = $("#zip-form").attr("action"),
        b = $("#incentives-list-container").html(),
        w = i.compile(b),
        _ = $("html").attr("lang"),
        k = ("en" === _ ? "en-US" : _).match(/[A-Z]+$/).toString(),
        x = Number($("#incentives-container").attr("data-country-wide")) ? {
          country_code: k,
          postal_code: "00000"
        } : {};
      d = x.postal_code || c.postal_code, h = x.country_code || c.country_code, p = x.latitude || c.latitude, f = x.longitude || c.longitude, i.registerHelper("toLowerCase", function (t) {
        return t.toLowerCase()
      }), i.registerHelper("incentiveCountHelper", function (t) {
        var e = !t || t > 1 ? $("#incentives-container").attr("data-other") : $("#incentives-container").attr("data-one");
        return new i.SafeString(e.replace("{number}", t))
      }), $("#incentives-dynamic").length && ($(".filter-module header").click(function (t) {
        matchMedia("(min-width:768px)").matches && !Modernizr.touchevents || ($(".filter-module").hasClass("is-closed") ? $(".filter-module").removeClass("is-closed") : $(".filter-module").addClass("is-closed"))
      }), $(".nl-checkbox").change(function (t) {
        ! function () {
          var t = document.querySelectorAll(".incentives-list li:not(.incentives-list--permanent)"),
            e = document.querySelectorAll(".filter-options--list .nl-checkbox:checked"),
            n = r.pluck(e, "value");
          $(".incentives-inner-container").addClass("is-loading"), e.length > 0 ? r.each(t, function (t) {
            var e = t.getAttribute("data-filter").split("|"),
              i = r.map(n, function (t) {
                return r.contains(e, t)
              });
            r.every(i) ? $(t).removeClass("hide") : $(t).addClass("hide")
          }) : $(t).removeClass("hide");
          var i = $(".incentives-list li:not(.incentives-list--permanent):visible").length,
            o = !i || i > 1 ? $("#incentives-container").attr("data-other") : $("#incentives-container").attr("data-one");
          $(".incentive-count").text(o.replace("{number}", i)), $(".incentives-inner-container").removeClass("is-loading")
        }();
        var e = $(t.target).val();
        l.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "Partners",
            gaAction: "Incentive Search Narrow",
            gaLabel: e
          }
        })
      }), $("#zip-form").submit(function (t) {
        t.preventDefault(), $(".zip-form-input").blur(),
          function () {
            var t = $(".zip-form-input").val().toUpperCase();
            $("#zip-form").removeClass("has-zip-error"), $(".incentives-inner-container").addClass("is-loading"), g.test(t) ? e(t) : n("zipError")
          }()
      }), $(".zip-form-input").keydown(function (t) {
        $("#zip-form").removeClass("has-zip-error"), 13 === t.which && $("#zip-form").submit()
      }), $("#zip-form .zip-form-input").val(""), g = "en-CA" === _ || "fr-CA" === _ ? /(([A-Za-z]\d[A-Za-z])([\-\s])?(\d[A-Za-z]\d)?)$/ : /(^\d{5}$)|(^\d{5}-\d{4}$)/, e(d, h, p, f)), $(".zip-form-input").on("input", function () {
        $(".zip-form-input").val($(this).val().replace(/\s/g, "").toUpperCase())
      }), $("#incentives_without_partners-email-signup").on("submit", function (e) {
        e.preventDefault(), t($(this))
      }), $("#incentives_with_partners_alt-email-signup").on("submit", function (e) {
        e.preventDefault(), t($(this))
      })
    }
  }, {
    "../_modules/incentives": 78,
    "../core_modules": 194,
    "./handlebars": 258,
    underscore: 58
  }],
  260: [function (t, e, n) {
    "use strict";
    t("moment");
    var i = $(".country_item a"),
      r = $(".country-module"),
      o = ($("#country-selector-container"), {
        "alarm-system": window.AVAILABILITY.alarmsystem,
        cameras: window.AVAILABILITY.cameras,
        thermostats: window.AVAILABILITY.thermostats,
        protect: window.AVAILABILITY.protect
      });
    i.on("click", function (t) {
      $(this).find(".country").hasClass("not-selectable") && (t.preventDefault(), $(this).find(".tooltip").hasClass("is-shown") ? $(this).find(".tooltip").toggleClass("is-shown") : (i.find(".tooltip").removeClass("is-shown"), $(this).find(".tooltip").addClass("is-shown")))
    }), e.exports = {
      init: function () {
        this.initProductChooser()
      },
      initProductChooser: function () {
        var t, e, n = $(".product-chooser-option");
        i.each(function () {
          $(this).wrapInner("<div class='country' />"), $(this).prepend('<span class="tooltip">This product is currently not available in your country.</span>'), $(this).attr("onclick", "return false")
        }), n.on("click", function (a) {
          a.preventDefault(), t = $(this).attr("data-device-url"), e = $(this).attr("id").substr(17), n.removeClass("is-active"), $(this).addClass("is-active"),
            function (t, e) {
              var n = $("html, body"),
                a = $("#scroll-marker").offset().top,
                s = function (t) {
                  for (var e = [], n = 0; n < t.length; n++) t[n] && !t[n].match(/\./) && e.push(t[n]);
                  return e.join("/")
                }(t.split("/"));
              $(".country").removeClass("not-selectable"), $(".tooltip").removeClass("is-shown"), i.each(function () {
                var t = $(this).attr("data-locale"),
                  n = $(this).attr("data-locale-path");
                o[e].indexOf(t) < 0 ? ($(this).addClass("not-active"), $(this).find(".country").addClass("not-selectable")) : ($(this).removeClass("not-active"), $(this).find(".country").removeClass("not-selectable")), $(this).attr("href", n + s)
              }), r.addClass("is-active"), i.removeAttr("onclick"), n.animate({
                scrollTop: a
              }, 450)
            }(t, e)
        })
      }
    }
  }, {
    moment: 41
  }],
  261: [function (t, e, n) {
    "use strict";
    var i = t("../core_modules").geoip;
    n.init = function () {
      var t = $("#leading-social-responsibility-efforts"),
        e = t.find("select");
      e.length > 0 && e.on("change", function () {
        $("ul.selected").removeClass("selected"), $("#" + this.value).addClass("selected")
      }), "en-US" === $("html").attr("lang") && t.find(".geo").click(function () {
        var t = $(this),
          e = t.attr("href") + "&latitude=" + i.latitude + "&longitude=" + i.longitude;
        t.attr("href", e)
      })
    }
  }, {
    "../core_modules": 194
  }],
  262: [function (t, e, n) {
    "use strict";
    e.exports = function () {
      function t() {
        return window.devicePixelRatio >= 1.5
      }

      function e() {
        var e = t() ? "src-2x" : "src";
        $("img.nl-responsive-img").each(function (t, n) {
          ! function (t, e) {
            var n = t.attr(["data", e].join("-"));
            t.attr("src", n).data("loaded", !0)
          }($(n), e)
        })
      }
      window.matchMedia && window.matchMedia("(-webkit-min-device-pixel-ratio:1.5),(min-device-pixel-ratio:1.5)").addListener(function () {
        t() && e()
      }), e()
    }
  }, {}],
  263: [function (t, e, n) {
    "use strict";

    function i(t) {
      if (Array.isArray(t)) {
        for (var e = 0, n = Array(t.length); e < t.length; e++) n[e] = t[e];
        return n
      }
      return Array.from(t)
    }
    var r = t("./_modules/query_utils"),
      o = t("nl-client"),
      a = function () {
        if (this.value.length ? this.classList.remove("invalid") : this.classList.add("invalid"), this.style.height = "auto", this.style.height = this.scrollHeight + "px", this.value.trim().length >= 50 && this.parentElement.dataset.message) {
          document.getElementById("review-form").classList.remove("error-reviewtext"), delete this.parentElement.dataset.message
        }
      };
    e.exports = {
      form: document.getElementById("product-review-form"),
      productKey: document.getElementById("product-hero").className,
      getProductUrl: function () {
        return document.querySelector(".heading-" + this.productKey).dataset.url
      },
      delayUpdateTextarea: function () {
        setTimeout(a.bind(this), 0)
      },
      setTextareaListeners: function () {
        var t = this.form.reviewtext;
        t.addEventListener("change", a), t.addEventListener("cut", this.delayUpdateTextarea), t.addEventListener("paste", this.delayUpdateTextarea), t.addEventListener("drop", this.delayUpdateTextarea), t.addEventListener("keydown", this.delayUpdateTextarea)
      },
      showValidationErrors: function (t) {
        var e = this,
          n = t.FormErrors.FieldErrors,
          i = t.FormErrors.FieldErrorsOrder;
        document.getElementById("review-form").className = i.map(function (t) {
          return "error-" + t
        }).join(" "), i.forEach(function (t) {
          var i = e.form[t],
            r = i.dataset.inputWrap,
            o = i.dataset.showMessage,
            a = r ? document.querySelector(r) : i,
            s = n[t].Message;
          o && e.setErrorMessage(a, s), dataLayer.push({
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "product review",
            gaLabel: "submit error: " + i.name + " - " + s
          })
        })
      },
      showSubmissionErrors: function (t) {
        var e = t.Errors,
          n = this.form.querySelector(".submission-error"),
          i = e.map(function (t) {
            return t.Message
          });
        this.setErrorMessage(n, i), dataLayer.push({
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "product review",
          gaLabel: "submit error: " + i.join(".")
        })
      },
      resetValidationErrors: function () {
        document.getElementById("review-form").className = ""
      },
      setErrorMessage: function (t, e) {
        var n = this,
          i = [];
        ("string" == typeof e ? [e] : e).forEach(function (t) {
          return t.match("must enter review text") ? null : i.push(n.findLocalizedMessage(t) || t)
        }), Object.assign(t.dataset, {
          message: i.join(".").trim()
        })
      },
      findLocalizedMessage: function (t) {
        var e = window.REVIEW_ERROR_MESSAGE,
          n = void 0;
        return Object.keys(e).forEach(function (i) {
          n = n || (t.match(i) ? e[i] : null)
        }), n
      },
      resetErrorMessage: function (t) {
        return Object.assign(t.dataset, {
          message: ""
        })
      },
      validate: function (t) {
        var e = this;
        t.preventDefault();
        var n = this.formData(!0),
          i = r.buildNestedQuery(n),
          o = "https://" + this.form.dataset.bazaarvoiceHost + "/data/submitreview.json?" + i;
        this.resetValidationErrors(), $.ajax({
          contentType: "application/x-www-form-urlencoded",
          url: o,
          type: "POST",
          success: function (t) {
            if (t.HasErrors) return t.Errors.length ? e.showSubmissionErrors(t) : e.showValidationErrors(t);
            e.submit()
          }
        })
      },
      submit: function () {
        var t = this.formData(),
          e = r.buildNestedQuery(t),
          n = "https://" + this.form.dataset.bazaarvoiceHost + "/data/submitreview.json?" + e;
        $.ajax({
          contentType: "application/x-www-form-urlencoded",
          url: n,
          type: "POST",
          success: this.showThankYou.bind(this)
        })
      },
      showThankYou: function () {
        this.form.querySelectorAll("input, textarea").forEach(function (t) {
          return t.disabled = !0
        }), this.form.classList.add("success"), localStorage.getItem(this.productKey) || localStorage.setItem(this.productKey, this.form.rating.value), dataLayer.push({
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "product review",
          gaLabel: "submit review"
        }), $("html, body").animate({
          scrollTop: $("#product-review-form").offset().top - 10
        }, 1e3)
      },
      formData: function () {
        var t = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return {
          ApiVersion: "5.4",
          ProductId: this.form.ProductId.value,
          Action: t ? "preview" : "submit",
          Rating: document.querySelector("input[name=rating]:checked").value,
          ReviewText: this.form.reviewtext.value,
          Title: this.form.title.value,
          UserNickname: this.form.usernickname.value,
          PassKey: this.form.PassKey.value,
          Locale: o.locale.replace("-", "_"),
          fp: this.form.fp.value,
          IsRecommended: document.querySelector("input[name=recommend]:checked").value,
          contextdatavalue_IncentivizedReview: this.form.contextdatavalue_IncentivizedReview.value,
          AgreedToTermsAndConditions: !0,
          User: this.form.User.value,
          AdditionalField_CTY: this.form.CTY.value,
          AdditionalField_Q_Language: this.form.Q_Language.value,
          AdditionalField_stage: this.form.stage.value
        }
      },
      setupAutoScrollResponse: function () {
        if (o.isMobile) {
          var t = {
            "[name=rating]": ".would-you-recommend",
            "[name=recommend]": "#review-form"
          };
          Object.keys(t).forEach(function (e) {
            var n = document.querySelectorAll(e),
              i = $(t[e]);
            n.forEach(function (t) {
              return t.addEventListener("change", function () {
                $("html, body").animate({
                  scrollTop: i.offset().top - 10
                }, 1e3)
              })
            })
          })
        }
      },
      setupSocial: function () {
        var t = this.form.querySelector(".tweet"),
          e = this.form.querySelector(".facebook-share"),
          n = document.getElementById("product-hero").className,
          i = window.encodeURI("https:" + this.getProductUrl());
        e.addEventListener("click", function () {
          dataLayer.push({
            productReviewed: n,
            sharedOn: "facebook"
          }), window.open("https://www.facebook.com/sharer/sharer.php?u=" + i, void 0, "top=0,left=0,scrollbars,width=652,height=452")
        }), t.addEventListener("click", function () {
          dataLayer.push({
            productReviewed: n,
            sharedOn: "twitter"
          }), window.open("https://twitter.com/intent/tweet?text=" + i, void 0, "top=0,left=0,scrollbars,width=652,height=452")
        })
      },
      persistReview: function () {
        var t = localStorage.getItem(this.productKey);
        t && (this.form.rating.value = t, this.showThankYou()), this.form.classList.add("visible")
      },
      handleToggleVisibilityElements: function () {
        var t = document.querySelectorAll("[data-toggle-visibility-selector]"),
          e = document.createElement("div");
        e.id = "guidelines-modal-wrap", document.body.appendChild(e), t.forEach(function (t) {
          var n = t.dataset.toggleVisibilitySelector,
            i = document.querySelector(n);
          e.addEventListener("click", function () {
            return [i, e].forEach(function (t) {
              return t.classList.remove("visible")
            })
          }), t.addEventListener("click", function () {
            return [i, e].forEach(function (t) {
              return function (t, e) {
                return t.classList.contains(e) ? t.classList.remove(e) : t.classList.add(e)
              }(t, "visible")
            })
          })
        })
      },
      handleRatingSelection: function () {
        var t = this,
          e = Array.apply(void 0, i(document.querySelectorAll("#stars .star")));
        e.forEach(function (n) {
          n.addEventListener("click", function (n) {
            var i = e.indexOf(n.target);
            t.form.rating[i].checked = !0, dataLayer.push({
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "product review",
              gaLabel: "click rating: " + (i + 1)
            })
          })
        });
        var n = Array.apply(void 0, i(document.querySelectorAll("button.recommend")));
        n.forEach(function (e, i) {
          e.addEventListener("click", function (e) {
            var i = n.indexOf(e.target);
            t.form.recommend[i].checked = !0, dataLayer.push({
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "product review",
              gaLabel: "recommend: " + t.form.recommend[i].value
            })
          })
        })
      },
      init: function () {
        this.handleRatingSelection(), this.persistReview(), this.setTextareaListeners(), this.handleToggleVisibilityElements(), this.setupSocial(), this.setupAutoScrollResponse(), this.form.addEventListener("submit", this.validate.bind(this))
      }
    }
  }, {
    "./_modules/query_utils": 92,
    "nl-client": 42
  }],
  264: [function (t, e, n) {
    "use strict";

    function i(t) {
      t && t["*"] && (r(t = t["*"]) && (t = t()), r(t.init) && t.init())
    }

    function r(t) {
      return !!(t && t.constructor && t.apply && t.call)
    }
    var o = t("nl-client");
    n.init = function (t) {
      var e = t;
      if (i(e), !document.querySelector("body#page-not-found")) {
        for (var n = window.location.pathname.replace(o.localeRoot, "").replace(/^\/|\/$/g, "").split("/").filter(function (t) {
            return !!t
          }), a = 0; a < n.length && (e = e[n[a]]); a++) i(e);
        e && function (t) {
          r(t) && (t = t()), r(t.init) ? t.init() : t["/"] && (r(t = t["/"]) && (t = t()), t.init())
        }(e)
      }
    }
  }, {
    "nl-client": 42
  }],
  265: [function (t, e, n) {
    "use strict";
    var i = function (t) {
      function e(t) {
        return t = t.replace(/<b>|<\/b>|<br>/g, ""), t = t.replace(/"/g, "&quot;"), t = t.replace(/'/g, "&apos;")
      }
      var n = this,
        i = t;
      n.pageMap = t.pagemap || {};
      var r = [],
        o = [];
      for (var a in n.pageMap) "sws_metadata" === a ? r = n.pageMap[a][0] : "metatags" === a && (o = n.pageMap[a][0]);
      n.url = i.link, n.description = function () {
        var t = "";
        t = e(i.snippet ? i.snippet : "");
        for (var n in o) "nlsws-description" === n && (t = o[n]);
        for (n in r) "nl-sws-description" === n && (t = r[n]);
        return t
      }(), n.domain = function () {
        var t = "main";
        for (var e in o) "nlsws-domain" === e && (t = o[e]);
        for (e in r) "nl-sws-domain" === e && (t = r[e]);
        return t
      }(), n.title = function () {
        var t = "";
        t = e(i.title);
        for (var o in r) "nl-sws-title" === o && (t = r[o]);
        return t || (t = n.url), "developer" === n.domain && (t = t.split(" | ")[0]), t
      }()
    };
    i.prototype.template = '<li class="search-result{class}">{section}<h2><a href="{href}">{title}</a></h2><h4><a href="{href}">{formattedhref}</a></h4><p>{description}</p></li>', i.prototype.render = function (t) {
      var e = "",
        n = "";
      return this.domain && t[this.domain] && (e = "<h3>" + t[this.domain] + "</h3>", n = " " + this.domain), this.url.indexOf(".pdf") > 0 && (e = "<h3>pdf</h3>", n = " pdf"), this.template.replace(/\{class}/g, n).replace(/\{section}/g, e).replace(/\{href}/g, this.url).replace(/\{formattedhref}/g, this.url).replace(/\{title}/g, this.title).replace(/\{description}/g, this.description)
    }, e.exports = i
  }, {}],
  266: [function (t, e, n) {
    "use strict";
    var i = t("nl-utilities");
    e.exports = function (t) {
      this.href = t.href || "", this.title = t.title || "", this.description = t.description || "", this.img = "", t.image && (this.img = i.getQueryValue("url", t.image));
      this.render = function () {
        return '<div class="tout"><a href="{href}" title="{title}">{img}<h2>{title}</h2></a><p>{description}</p></div>'.replace(/\{img}/g, this.img ? '<img src="' + this.img + '">' : "").replace(/\{href}/g, this.href).replace(/\{title}/g, this.title).replace(/\{subhead}/g, this.subhead ? "<h3>" + this.subhead + "</h3>" : "").replace(/\{description}/g, this.description)
      }.bind(this)
    }
  }, {
    "nl-utilities": 53
  }],
  267: [function (t, e, n) {
    "use strict";
    var i = t("../core_modules").utilities;
    e.exports = new function (t) {
      var e = this;
      window.Nest = window.Nest || {}, e.config = t || {}, e.resultsURL = window.Nest.SEARCH_RESULTS_URL ? window.Nest.SEARCH_RESULTS_URL : window.SITE_URLS ? window.SITE_URLS["js.search_url"] : "", e.proxy = window.SITE_URLS["js.search_proxy_url"] || "/api/search", e.parseJSONResponse = function (t) {
        var e = [],
          n = [];
        return t.promotions && t.promotions.forEach(function (t) {
          e.push(t)
        }), t.items && t.items.forEach(function (t) {
          n.push(t)
        }), [e, n]
      }, e.get = function (t) {
        return new function (t) {
          var n = this;
          this.config = t, this.config.filters = this.config.filters || "";
          var r = 0,
            o = t.searchTerm,
            a = i.getURLSafeString(o);
          this.pages = [], this.nextPage = function (t) {
            t = t || {},
              function (t) {
                $.ajax({
                  dataType: "json",
                  url: function (t) {
                    var i = e.proxy + "/?num=10&q={query}&start={start}";
                    i = i.replace(/\{query}/g, a + n.config.filters);
                    var r = t.page || 1;
                    return r = 10 * r - 9, i = i.replace(/\{start}/g, r)
                  }(t),
                  success: function (e) {
                    n.response = e, n.totalResults = e.searchInformation ? parseInt(e.searchInformation.totalResults, 10) : 0, t.success && t.success(e)
                  },
                  error: function (e) {
                    t.error && t.error(e)
                  }
                })
              }({
                page: r + 1,
                success: function (e) {
                  t.success && t.success(e), r++, n.pages.push(e)
                },
                error: function () {}
              })
          }, this.previousPage = function () {}, n.nextPage(this.config)
        }(t)
      }, e.init = function (t) {
        e.config = t
      }
    }
  }, {
    "../core_modules": 194
  }],
  268: [function (t, e, n) {
    "use strict";
    var i = t("./search-controller");
    e.exports = {
      init: function () {
        var t = document.querySelector(".search-results").getAttribute("data-localized-strings");
        return t = JSON.parse(t), new i({
          localizedStrings: t
        })
      }
    }
  }, {
    "./search-controller": 269
  }],
  269: [function (t, e, n) {
    "use strict";
    var i = t("./api"),
      r = t("./Tout"),
      o = t("./SearchResult"),
      a = t("nl-client"),
      s = t("nl-utilities"),
      l = t("../_modules/query_utils"),
      c = t("nl-element-watcher"),
      u = t("spin.js"),
      d = t("./spinnerOptions"),
      h = t("underscore");
    e.exports = function (t) {
      function e() {
        var t = $("#nl-sws-form").find('input[type="text"]'),
          e = decodeURIComponent(s.getQueryValue("q") || "").replace(/\+/g, " ");
        return t.val().length ? t.val() : e || ""
      }

      function n() {
        var t = $("#nl-sws-form"),
          e = t.find(".sws-icon-big");
        s.getURLSafeString(g.val()) ? v() : a.supports.animation ? (e.on("animationend msAnimationEnd webkitAnimationEnd", function () {
          e.off("animationend msAnimationEnd webkitAnimationEnd"), t.removeClass("submit-denied")
        }), t.addClass("submit-denied")) : e.animate({
          "margin-left": "-2px"
        }, 70).animate({
          "margin-left": "0"
        }, 70).animate({
          "margin-left": "2px"
        }, 70).animate({
          "margin-left": "0"
        }, 70).animate({
          "margin-left": "-1px"
        }, 70).animate({
          "margin-left": "0"
        }, 70)
      }

      function p(t) {
        var n = b.api.parseJSONResponse(t),
          i = n[0],
          a = n[1],
          s = null,
          l = "";
        if (b.api.touts = function (t) {
            var e = [];
            if (t.length)
              for (var n = 0; n < t.length; n++) e.push(new r(t[n]));
            return e
          }(i), function (t) {
            var e = "";
            t.forEach(function (t) {
              e += t.render()
            }), 0 !== t.length && $(".promotions").append(e).addClass("visible")
          }(b.api.touts), m(), a.length) {
          for (var u = 0, d = a.length; u < d; u++) s = new o(a[u]), b.list.push(s), l += s.render(k);
          $(".search-results-list").append(l)
        } else m(), $(".no-results").addClass("visible"), $(".loading-results").addClass("hidden"), C({
          action: "no results",
          q: e()
        });
        b.list.length >= b.query.totalResults || b.query.totalResults < 10 ? f() : c.add({
          element: $(".loading-results"),
          enter: function () {
            b.query.nextPage({
              success: function (t) {
                t.items && t.items.length ? p(t) : b.list.length && f()
              },
              error: function () {}
            })
          },
          persist: !1
        }).then(function (t) {
          y = t
        })
      }

      function f() {
        $(".results-loaded").addClass("visible"), $(".loading-results").addClass("hidden"), m(b.list.length)
      }

      function m(t) {
        var e = t || b.query.totalResults;
        e ? $(".search-results-count").html(e + " " + (e > 1 ? k.results_plural : k.results_singular)) : $(".search-results-count").html(k.no_results)
      }
      this.api = i;
      var g, v, y, b = this,
        w = !0,
        _ = !0,
        k = t.localizedStrings || {},
        x = "+more:pagemap:sws_metadata-nl-sws-locale:" + a.locale,
        E = function () {
          y && (y[0].disposalHandler(), y = null), b.list = [], $(".search-results-count").html(""), $(".search-results-list").empty(), $(".search-house-icon").removeClass("visible"), $(".no-results").removeClass("visible"), $(".loading-results").removeClass("hidden"), $(".results-loaded").removeClass("visible");
          var t = e();
          if (t.length > 0) {
            g.val(t), g.attr("placeholder", g.attr("data-placeholder"));
            var n = {
                q: t
              },
              i = b.filterModule.getActiveFilters();
            i.length && (n.filters = i);
            var r = l.buildNestedQuery(n);
            window.history.replaceState && window.history.replaceState({
              origin: "sws",
              query: t
            }, null, window.location.href.split("?")[0] + "?" + r), (!b.query || b.query && b.query.config && b.query.config.searchTerm !== t) && b.filterModule && b.filterModule.updateCounts(), C({
              q: t
            }), b.query = b.api.get({
              searchTerm: t,
              filters: b.filterModule ? b.filterModule.getFilterString() : "",
              success: function (t) {
                w = !0, p(t)
              },
              error: function () {
                w = !0
              }
            })
          } else ! function () {
            var t = $("#nl-sws-form").find('input[type="text"]');
            t.attr("placeholder", t.attr("data-placeholder")), $(".search-house-icon").addClass("visible"), $(".loading-results").addClass("hidden")
          }()
        },
        C = function (t) {
          if (w) {
            var e = $.cookie("saved-sws-ga-action") ? $.cookie("saved-sws-ga-action") : "search, page";
            $.cookie("saved-sws-ga-action", ""), e = t.action || e, window.dataLayer.push({
              event: "gaEvent",
              gaCategory: "sitewide search",
              gaAction: e,
              gaLabel: t.q
            })
          }
        },
        S = function () {
          var t = this;
          this.getActiveFilters = function () {
            for (var t = document.querySelectorAll(".sws-domains")[0].querySelectorAll(".domain.checked"), e = [], n = 0; n < t.length; n++) e.push(t[n].getAttribute("data-filter"));
            return e
          };
          var n = function () {
            var t = this.getActiveFilters();
            return t.push("null"), "+more:pagemap:sws_metadata-nl-sws-domain:" + t.join(",") + x
          }.bind(this);
          this.filters = {};
          var i = function (t) {
            var n = this,
              i = !1,
              r = 0;
            this.el = t.el, this.string = $(this.el).attr("data-filter"), this.updateCount = function () {
              b.api.get({
                searchTerm: e(),
                filters: "+more:pagemap:sws_metadata-nl-sws-domain:" + this.string + x,
                success: function (t) {
                  0 === (r = t.items ? t.items.length : 0) ? $(n.el).addClass("empty").find(".count").html(k.no_results_filter) : $(n.el).removeClass("empty").find(".count").html("")
                }
              })
            }, this.toggle = function () {
              i ? this.uncheck() : this.check()
            }, this.check = function () {
              i = !0, $(this.el).addClass("checked")
            }, this.uncheck = function () {
              i = !1, $(this.el).removeClass("checked")
            }, this.isChecked = function () {
              return i
            }
          };
          this.getFilterString = function () {
              return n()
            }, this.updateCounts = function () {
              for (var e in t.filters) t.filters[e].updateCount()
            },
            function () {
              var e = window.location.search.replace("?", ""),
                n = l.parseNestedQuery(e);
              if ($(".sws-filters").find(".sws-domains").find(".filter").each(function () {
                  t.filters[$(this).attr("data-filter")] = new i({
                    el: $(this).get(0)
                  })
                }), n && n.filters && n.filters.length) n.filters.filter(function (e) {
                return !!t.filters[e]
              }).forEach(function (e) {
                t.filters[e].check()
              });
              else
                for (var r in t.filters) t.filters[r].check();
              $(".sws-filters").find(".filter").on("click", function (e) {
                e.preventDefault();
                var n = t.filters[$(this).attr("data-filter")];
                n.toggle(), w = !1, window.dataLayer.push({
                  event: "gaEvent",
                  gaCategory: "sitewide search",
                  gaAction: (n.isChecked() ? "checked" : "unchecked") + " filter",
                  gaLabel: n.string
                }), v()
              })
            }()
        };
      (function () {
        v = h.debounce(E, 1200), g = $('#nl-sws-form input[name="q"]'), this.list = [];
        var t = new u(d);
        document.querySelector(".loading-results").appendChild(t.spin().el), $("#nl-sws-form-wrapper").on("click", ".sws-icon-big", function () {
          n()
        }), $(".results-loaded").on("click", function () {
          $("html, body").animate({
            scrollTop: 0
          }), g.focus()
        }), g.on("keydown keypress", function (t) {
          if (13 === t.keyCode) return t.preventDefault(), !1
        }), g.on("keyup", function (t) {
          13 === t.keyCode && n()
        }), _ && (this.filterModule = new S), v()
      }).call(this)
    }
  }, {
    "../_modules/query_utils": 92,
    "./SearchResult": 265,
    "./Tout": 266,
    "./api": 267,
    "./spinnerOptions": 270,
    "nl-client": 42,
    "nl-element-watcher": 45,
    "nl-utilities": 53,
    "spin.js": 57,
    underscore: 58
  }],
  270: [function (t, e, n) {
    "use strict";
    e.exports = {
      lines: 11,
      length: 0,
      width: 2,
      radius: 8,
      corners: 1,
      rotate: 0,
      direction: 1,
      color: "#4e555b",
      speed: 1.5,
      trail: 80,
      shadow: !1,
      hwaccel: !0,
      className: "spinner-element",
      zIndex: 2e9,
      top: "auto",
      left: "50%"
    }
  }, {}],
  271: [function (t, e, n) {
    "use strict";
    var i = t("hammerjs"),
      r = t("nl-client"),
      o = t("nl-event-emitter"),
      a = t("nl-element-watcher"),
      s = t("../../_modules/binary-init-switch");
    e.exports = {
      init: function () {
        var t, e = new s("(min-width:768px)");
        e.makeDesktop = function () {
          var t = $(".sensors-gallery-desktop");
          a.add({
            element: t,
            callback: function () {
              t.addClass("is-visible"), t.attr("data-auto", "true")
            },
            exit: function () {
              t.removeClass("is-visible"), t.attr("data-auto", "false")
            },
            offset: t.outerHeight() / 2,
            persist: !0
          })
        }, e.makeMobile = function () {
          t = new function (t) {
            this.el = t, this.currentIndex = null;
            var e, n = new function (t) {
              this.dots = [], this.arrows = [], o.createEmitter(this);
              var n = null,
                i = function (t) {
                  return !n || t !== n.index
                }.bind(this);
              this.selectDot = function (t) {
                return !!i(t) && !!this.dots[t] && (n && n.deactivate(), n = this.dots[t].activate(), this.trigger("chapter-selected", t), n)
              }, this.next = function () {
                return this.selectDot((n.index + 1) % this.dots.length)
              }, this.previous = function () {
                return 0 === n.index ? this.selectDot(this.dots.length - 1) : this.selectDot((n.index - 1) % this.dots.length)
              }, this.render = function () {
                return e
              };
              var r = function (t) {
                this.selectDot(t.index)
              }.bind(this);
              (function (t) {
                (e = document.createElement("div")).className = "paged-list-controls";
                var n = document.createElement("a");
                n.className = "arrow-control icon", n.href = "#";
                var i = n.cloneNode();
                i.className += " icon-arrow-gallery-previous-small previous", n.className += " icon-arrow-gallery-next-small next", e.appendChild(i);
                var a = document.createElement("div");
                a.className = "dots", e.appendChild(a);
                for (var s, l = 0; l < t.length; l++)(s = new function (t) {
                  var e = !1;
                  o.createEmitter(this), this.activate = function () {
                    return e = !0, this.el.setAttribute("data-state", "on"), this
                  }, this.deactivate = function () {
                    return e = !1, this.el.setAttribute("data-state", "off"), this
                  }, this.el = document.createElement("a"), this.el.className = "dot", this.el.href = "#", this.index = t, $(this.el).on("click", function (t) {
                    t.preventDefault(), this.trigger("dot-clicked", this)
                  }.bind(this))
                }(l)).on("dot-clicked", r), this.dots.push(s), a.appendChild(s.el);
                e.appendChild(n), $(n).on("click", function (t) {
                  t.preventDefault(), this.next()
                }.bind(this)), $(i).on("click", function (t) {
                  t.preventDefault(), this.previous()
                }.bind(this))
              }).bind(this)(t)
            }(this.el.querySelectorAll("ol.text .slide"));
            this.el.appendChild(n.render());
            var a = function (t) {
                this.el.setAttribute("data-scene", this.pages[t].el.getAttribute("data-scene")), this.el.setAttribute("data-index", t), this.currentIndex = t
              }.bind(this),
              s = function () {
                var t = 0;
                this.pages.forEach(function (e) {
                  e.el.clientHeight > t && (t = e.el.clientHeight)
                }), this.el.querySelector("ol.text").style.height = t + "px"
              }.bind(this);
            o.on("windowResizeEnd.RenderLayerController", s), n.on("chapter-selected.pagedListController", function (t) {
              a(t)
            });
            this.pages = function (t) {
              var e = [];
              ! function (t) {
                for (var e = 0; e < t.length; e++) t[e].setAttribute("data-index", e)
              }(t);
              for (var n = 0; n < t.length; n++) e.push(new function (t) {
                this.el = t
              }(t[n]));
              return e
            }(this.el.querySelectorAll(".text li")), (r.isAndroid() || r.isIOS()) && i(this.el).on("swipe", function (t) {
              2 === t.direction && n.next(), 4 === t.direction && n.previous()
            }), s(), n.selectDot(0)
          }(document.querySelector("#sensors-gallery-mobile"))
        }, e.init()
      }
    }
  }, {
    "../../_modules/binary-init-switch": 67,
    hammerjs: 24,
    "nl-client": 42,
    "nl-element-watcher": 45,
    "nl-event-emitter": 47
  }],
  272: [function (t, e, n) {
    "use strict";
    t("underscore");
    var i = t("../core_modules"),
      r = i.elementWatcher,
      o = i.geoip,
      a = i.analytics,
      s = i.nlEvents,
      l = t("../_modules/ui-controller"),
      c = t("../_modules/tabs"),
      u = t("../_modules/element-state-machine"),
      d = t("../_modules/audio-controller"),
      h = t("./includes/sensors"),
      p = t("../_modules/canvas-steam"),
      f = $("body"),
      m = "is-visible",
      g = new Date,
      v = function (t) {
        var e = t,
          n = e.find(".callout-disclaimer-popup"),
          i = !1;
        e.on("click", function (t) {
          t.stopPropagation(), this.toggle()
        }.bind(this)), this.toggle = function () {
          i ? this.close() : this.open()
        }, this.open = function () {
          i = !0;
          var t = $("#mobile-app-tab-controls").data("model");
          t.onViewInput("index", t.getIndex()), n.attr("data-phase", "positioning");
          var e = n.offset(),
            r = n.outerWidth(!0);
          e.left + r > $(window).width() ? n.attr("data-nudge-direction", "left") : e.left < 0 && n.attr("data-nudge-direction", "right"), n.attr("data-phase", "active"), n.on("click.popup", function (t) {
            t.stopPropagation()
          }), s.on("windowResizeStart.disclaimer", function () {
            this.close()
          }.bind(this)), $("#main").on("click.disclaimer", function () {
            this.close()
          }.bind(this))
        }, this.close = function () {
          n.attr("data-nudge-direction", ""), s.off("windowResizeStart.disclaimer"), i = !1, $("#main").off("click.disclaimer"), n.off("click.popup"), n.attr("data-phase", "")
        }
      };
    e.exports = {
      init: function () {
        l.init(), c.init(),
          function () {
            function t() {
              n[0].removeEventListener("canplaythrough", t), a.trackEvent(a.gaEventObj({
                gaCategory: "site functions",
                gaAction: "protect header video",
                gaLabel: "finished loading",
                gaValue: new Date - g
              }))
            }
            var e = $("#hero"),
              n = $("#hero-video");
            "MN" === o.region && f.addClass("location-has-incentive"), n.on("ended", function () {
              e.addClass("hero-ready"), window.setTimeout(function () {
                e.addClass("ended")
              }, 1e3)
            }), n[0].addEventListener("canplaythrough", t)
          }(),
          function () {
            var t = $("#introduction");
            r.add({
              element: t,
              callback: function () {
                t.addClass(m)
              },
              exit: function () {
                t.removeClass(m)
              },
              offset: 1.25 * t.outerHeight()
            })
          }(),
          function () {
            var t = $("section.mobile-app"),
              e = $("#mobile-app-tab-controls").data("model");
            u.create(t, e), $(".callout-disclaimer-toggle").each(function () {
              new v($(this))
            })
          }(),
          function () {
            var t, e = $("section.thoughtful-smoke-alarm"),
              n = $("#thoughtful-tab-controls").data("model"),
              i = document.getElementById("canvas-steam-not-smoke"),
              o = i.parentElement;
            u.create(e, n), t = p.init(i, o), r.add({
              element: e,
              callback: t.start.bind(t),
              exit: t.stop.bind(t),
              persist: !0
            })
          }(),
          function () {
            var t = $("#alarm-features");
            r.add({
              element: t,
              callback: function () {
                t.addClass(m), t.attr("data-auto", "true")
              },
              exit: function () {
                t.removeClass(m), t.attr("data-auto", "false")
              },
              offset: t.outerHeight() / 2,
              persist: !0
            })
          }(),
          function () {
            var t = $("#nightly-promise");
            r.add({
              element: t,
              callback: function () {
                t.addClass(m)
              },
              exit: function () {
                t.removeClass(m)
              },
              offset: t.outerHeight() / 1.5,
              persist: !0
            })
          }(),
          function () {
            var e = t("../_modules/footnote-tooltip"),
              n = document.querySelector(".mini-promotion-2017");
            n && new e(n.querySelector(".nl-footnote-tooltip-root"))
          }(), h.init(), d.init(), a.trackEvent("#meet-protect-hero-buy-now", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "navigation",
              gaAction: "go to store",
              gaLabel: "buy now tout protect"
            }
          }), a.trackEvent(".bring-home a.buy-now", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "navigation",
              gaAction: "go to store",
              gaLabel: "buy now bottom protect"
            }
          }), $("#mobile-app-tab-controls li").each(function (t, e) {
            var n = $(e).text().trim();
            a.trackEvent(e, "click", {
              gtm: {
                event: "gaEvent",
                gaCategory: "site functions",
                gaAction: "Protect Hand Module",
                gaLabel: n
              }
            })
          }), $("#thoughtful-tab-controls li").each(function (t, e) {
            var n = $(e).text().trim();
            a.trackEvent(e, "click", {
              gtm: {
                event: "gaEvent",
                gaCategory: "site functions",
                gaAction: "Protect Thoughtful Module",
                gaLabel: n
              }
            })
          }), a.trackEvent("#nest-home-tab-controls .thermostat", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "a nest home module",
              gaLabel: "thermostat"
            }
          }), a.trackEvent("#nest-home-tab-controls .nestcam", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "a nest home module",
              gaLabel: "camera"
            }
          }), a.trackEvent("#nest-home-tab-controls .hue", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "a nest home module",
              gaLabel: "hue"
            }
          }), $("#mobile-app .previous, #mobile-app .next").click(function () {
            var t = $(this).attr("href").replace("#", "");
            a.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "site functions",
                gaAction: "protect hand module",
                gaLabel: t
              }
            })
          }), $("#sensors-gallery-mobile .previous, #sensors-gallery-mobile .next").click(function () {
            var t = $(this).hasClass("previous") ? "previous" : "next";
            a.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "site functions",
                gaAction: "protect sensors module",
                gaLabel: t
              }
            })
          }), $("#protect-is-thoughtful .previous, #protect-is-thoughtful .next").click(function () {
            var t = $(this).attr("href").replace("#", "");
            a.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "site functions",
                gaAction: "protect thoughtful module",
                gaLabel: t
              }
            })
          }), $("#alarm-features .left, #alarm-features .right").click(function () {
            var t = $(this).hasClass("right") ? "next" : "previous";
            a.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "site functions",
                gaAction: "protect alarm feature module",
                gaLabel: t
              }
            })
          })
      }
    }
  }, {
    "../_modules/audio-controller": 66,
    "../_modules/canvas-steam": 68,
    "../_modules/element-state-machine": 73,
    "../_modules/footnote-tooltip": 75,
    "../_modules/tabs": 95,
    "../_modules/ui-controller": 100,
    "../core_modules": 194,
    "./includes/sensors": 271,
    underscore: 58
  }],
  273: [function (t, e, n) {
    "use strict";
    var i = t("../../core_modules"),
      r = i.elementWatcher,
      o = i.analytics,
      a = t("./protect_teardown_slideshow_module");
    e.exports = {
      init: function () {
        var t, e, n = $("#its-just-as-beautiful-on-the-inside"),
          i = new a,
          s = matchMedia("(min-width:960px) and (min-height:694px)"),
          l = function t() {
            i.jumpTo(1), 1 !== e && setTimeout(t, 250)
          };
        i.setup({
          scopeID: "its-just-as-beautiful-on-the-inside",
          slideIDs: ["beautiful-slide-0", "beautiful-slide-1", "beautiful-slide-2", "beautiful-slide-3", "beautiful-slide-4", "beautiful-slide-5", "beautiful-slide-6", "beautiful-slide-7"],
          slideFrames: [{
            out: [0, 39]
          }, { in: [415, 459],
            out: [38, 80]
          }, { in: [80, 109],
            "other-out": [109, 160]
          }, { in: [109, 130],
            out: [130, 160],
            "other-in": [80, 130]
          }, { in: [160, 197],
            out: [197, 234]
          }, { in: [234, 264],
            out: [264, 296]
          }, { in: [297, 326],
            out: [326, 354]
          }, { in: [366, 388],
            out: [388, 415]
          }],
          arrows: !0
        }), i.beforeTransitionOutCallback = function (t) {
          0 === t ? setTimeout(function () {
            n.removeClass("show-still")
          }, 250) : n.removeClass("show-still"), 1 === t && n.addClass("right"), e = t
        }, i.beforeTransitionInCallback = function (t) {
          1 === t && n.removeClass("right")
        }, i.afterTransitionInCallback = function (t) {
          if (n.addClass("show-still"), 1 === t) {
            var i = this.getHistory();
            7 === i[0] && 1 === i[1] && l()
          }
          e = t
        };
        r.add({
          element: n,
          callback: function () {
            void 0 === t && (t = (new Date).getTime()), s.matches ? setTimeout(function () {
              i.start()
            }, 1e3) : i.start()
          },
          persist: !1
        }), $("body").on("click", "#beautiful-slide-1 a", function (t) {
          t.preventDefault(), this.blur(), i.next(), o.trackEvent({
            gtm: {
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "protect beautiful module",
              gaLabel: "dive in"
            }
          })
        }), $("body").on("click", "#beautiful-slide-5 a.sound-check", function (t) {
          t.preventDefault(), $(this).children("audio")[0].play()
        })
      }
    }
  }, {
    "../../core_modules": 194,
    "./protect_teardown_slideshow_module": 274
  }],
  274: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("../../core_modules").analytics,
      o = t("./teardown_video_controller"),
      a = t("hammerjs"),
      s = t("nl-client"),
      l = t("../../_modules/query_utils"),
      c = function (t) {
        r.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "protect beautiful module",
            gaLabel: "Section " + t
          }
        })
      };
    e.exports = function () {
      function t(t) {
        "true" === W.debug && console.debug(t)
      }

      function e() {
        t("hideSpinner"), R.classList.remove("is-visible"), R.classList.remove("is-spinning")
      }

      function n() {
        t("calculateMobileSlideHeights");
        var e;
        P.find("slide").each(function (t, e) {
          $(this).attr("data-height", $(this).height())
        }), V.matches ? ((e = P.find("slide.active").height()) < 100 && (e = 350), t(e), B.matches ? P.height(e + 200) : P.height(e)) : P.height("")
      }

      function r(e) {
        t("makeVisible"), n(), $(e).removeClass("hidden")
      }

      function u(e) {
        t("makeInvisible"), $(e).addClass("hidden")
      }

      function d(e) {
        t("moveToFront"), $(e).addClass("active"), $(e).removeClass("on-deck")
      }

      function h() {
        t("updatePagination");
        for (var e = P.attr("class").split(" "), n = 0, i = e.length; n < i; n++)
          if (0 === e[n].indexOf("on-page-")) {
            P.removeClass(e[n]);
            break
          }
        P.addClass("on-page-" + E), $(L.children).removeClass("active"), $(L.children).filter("[data-index=" + E + "]").addClass("active")
      }

      function p(e) {
        t("hideForTransition");
        var n = I[E],
          i = I[e];
        u(L),
          function (e) {
            t("moveToBack"), u(e), window.setTimeout(function () {
              $(e).removeClass("active"), r(e)
            }, k)
          }(n),
          function (e) {
            t("moveToOnDeck"), $(e).addClass("on-deck")
          }(i), E = e
      }

      function f() {
        if (t("setupTransitionOut"), void 0 !== S[E].out) {
          var e = S[E].out[0] / H,
            n = S[E].out[1] / H;
          z = !M.setStartTime(e), M.setStopTime(n)
        }
        M.setOnStop(g)
      }

      function m() {
        t("afterTransitionIn"), _.afterTransitionInCallback(E), C = !1,
          function (e) {
            t("showAfterTransition");
            var n = I[e];
            h(), d(n), r(L)
          }(E), f()
      }

      function g() {
        t("afterTransitionOut"), _.afterTransitionOutCallback(F[0]), _.beforeTransitionInCallback(E), h(),
          function (e) {
            if (t("setupTransitionIn"), void 0 === e && (e = E + 1), 2 !== F[0] && 3 === F[1]) z = !M.setStartTime(S[E]["other-in"][0] / H), M.setStopTime(S[E]["other-in"][1] / H);
            else if (void 0 !== S[E].in) {
              var n = S[E].in[0] / H,
                i = S[E].in[1] / H;
              z = !M.setStartTime(n), M.setStopTime(i)
            }
            M.setOnStop(m)
          }(), t("transitionIn"), void 0 === S[E].in || 0 === F[0] ? m() : (C = !0, M.play())
      }

      function v(n) {
        t("fallBack"), P.addClass("fallback"), e(), _.beforeTransitionOutCallback(E), F = [E, n], p(n), setTimeout(function () {
          _.afterTransitionOutCallback(F[0]), _.beforeTransitionInCallback(E), m()
        }, k)
      }

      function y(e) {
        if (t("jumpTo"), C) return !1;
        e >= I.length || e < 0 || e === E ? e >= I.length ? y(1) : e < 0 && y((I.length + e) % I.length) : (t("shouldFallBack"), q.matches && !s.isIE.any && !s.isEdge || (P.addClass("fallback"), 0) ? w(e) : v(e))
      }

      function b(e) {
        return t("readyOrEmpty"), e.isVideoReady()
      }

      function w(n) {
        return t("dontFallBack"), b(M) ? (P.removeClass("fallback"), 2 === E && 3 !== n && (z = !M.setStartTime(S[E]["other-out"][0] / H), M.setStopTime(S[E]["other-out"][1] / H)), _.beforeTransitionOutCallback(E), F = [E, n], e(), p(n), void(z ? v(n) : (t("transitionOut"), 2 === F[0] && 3 !== F[1] || void 0 !== S[F[0]].out ? (C = !0, M.play()) : g()))) : (t("showSpinner"), R.classList.add("is-visible"), R.classList.add("is-spinning"), D < 40 ? (D++, void setTimeout(function () {
          w(n)
        }, 100)) : (e(), void v(n)))
      }
      var _ = this,
        k = 500,
        x = !0,
        E = 0,
        C = !1,
        S = null,
        T = {},
        j = null,
        L = null,
        A = null,
        O = null,
        P = null,
        N = null,
        I = null,
        M = new o,
        D = 0,
        R = null,
        H = 29.97,
        F = [0, 0],
        q = matchMedia("(min-width:960px) and (min-height:694px)"),
        B = matchMedia("(max-width:767px)"),
        V = matchMedia("(max-width:959px)"),
        z = !1,
        W = l.parseQuery(window.location.search.substr(1));
      this.setup = function (e) {
        ! function (e) {
          t("setup"), N = e.scopeID, O = document.getElementById(N), P = $(O), S = e.slideFrames, M.setup({
              scopeID: N,
              canvasClasses: "transition-in-canvas"
            }), q.addListener(function () {
              v(1)
            }), $(window).on("resize", i.debounce(function () {
              n()
            }, 300)), n(), (R = document.createElement("spinner")).classList.add("nl-spinner"), R.classList.add("is-visible"), R.classList.add("is-spinning"), O.appendChild(R), I = e.slideIDs.map(function (t) {
              return document.getElementById(t)
            }),
            function () {
              t("getLocStrings");
              for (var e, n, i, r, o = document.getElementsByClassName("loc-strings"), a = 0, s = o.length; a < s; a++) {
                e = o[a], n = JSON.parse(e.innerHTML);
                for (var l = 0, c = (i = Object.keys(n)).length; l < c; l++) r = i[l], T[r] = n[r]
              }
            }(),
            function () {
              t("buildControls");
              var e = I.length;
              L = document.createElement("pagination"), x && (A = document.createElement("a"), $(A).addClass("previous-arrow").addClass("chevron"), A.innerHTML = "<b>&lt;</b>", A.title = T.previous || "Previous", A.addEventListener("click", function (t) {
                t.preventDefault(), _.previous()
              }), L.appendChild(A));
              for (var n = 0; n < e; n++) {
                var i = document.createElement("a");
                $(i).addClass(N + "-page-" + n).addClass("page").addClass("icon").addClass("nest-protect-teardown-outline-white-" + n).attr("data-index", n), L.appendChild(i)
              }
              x && (j = document.createElement("a"), $(j).addClass("next-arrow").addClass("chevron"), j.innerHTML = "<b>&gt;</b>", j.title = T.next || "Next", L.appendChild(j), j.addEventListener("click", function (t) {
                  t.preventDefault(), c(E + 1), y(E + 1)
                })), $(L.children).on("click", function (t) {
                  if (t.preventDefault(), this !== j && this !== A) {
                    var e = Number($(this).attr("data-index"));
                    c(e), y(e)
                  }
                }), O.appendChild(L), h(),
                function () {
                  t("setupTouchEvents"), (s.isAndroid() || s.isIOS()) && a(O).on("swipe", function (t) {
                    2 === t.direction && _.next(), 4 === t.direction && _.previous()
                  }.bind(this))
                }()
            }(), r(I[E]), d(I[E]), f()
        }(e)
      }, this.start = function () {
        y(1)
      }, this.next = function () {
        y(E + 1)
      }, this.previous = function () {
        E - 1 == 0 ? (c(E - 2), y(E - 2)) : (c(E - 1), y(E - 1))
      }, this.jumpTo = function (t) {
        y(t)
      }, this.getHistory = function () {
        return F
      }, this.canStart = function () {
        return b(M)
      }, this.beforeTransitionOutCallback = function () {}, this.afterTransitionOutCallback = function () {}, this.beforeTransitionInCallback = function () {}, this.afterTransitionInCallback = function () {}
    }
  }, {
    "../../_modules/query_utils": 92,
    "../../core_modules": 194,
    "./teardown_video_controller": 275,
    hammerjs: 24,
    "nl-client": 42,
    underscore: 58
  }],
  275: [function (t, e, n) {
    "use strict";
    e.exports = function () {
      var t, e = null,
        n = null,
        i = null,
        r = !1,
        o = !1,
        a = (new Date).getTime(),
        s = (new Date).getTime(),
        l = 0,
        c = 0,
        u = null,
        d = function () {
          r = !1, t = i.addEventListener("canplaythrough", h, !1)
        },
        h = function t() {
          r = !0, i.removeEventListener("canplaythrough", t, !1)
        },
        p = function () {
          (i = document.getElementById("beautiful-video")).load(), i.addEventListener("ended", function () {
            o && v()
          }), i.addEventListener("pause", function () {
            o && v()
          })
        },
        f = function () {
          o = !0, m(), i.play()
        },
        m = function t() {
          if (u && u < i.currentTime) return i.pause(), !1;
          window.requestAnimationFrame(t)
        },
        g = function () {},
        v = function () {
          o = !1, y(), g()
        },
        y = function () {
          a = (new Date).getTime(), s = (new Date).getTime(), l = 0
        };
      this.setup = function (t) {
        ! function (t) {
          n = t.scopeID, e = document.getElementById(n), p(), d()
        }(t)
      }, this.setStartTime = function (t) {
        if (c = t, void 0 !== i && t) try {
          i.currentTime = t
        } catch (t) {
          return !1
        }
        return !0
      }, this.setStopTime = function (t) {
        u = t
      }, this.play = function () {
        ! function () {
          if (!r) return !1;
          setTimeout(f, 200)
        }()
      }, this.setOnStop = function (t) {
        g = t
      }, this.isVideoReady = function () {
        return r
      }, this.getSource = function () {
        return i.getAttribute("src")
      }
    }
  }, {}],
  276: [function (t, e, n) {
    "use strict";
    var i = t("../_modules/ui-controller"),
      r = t("../_modules/tabs"),
      o = t("../_modules/tech-specs"),
      a = t("../core_modules").analytics,
      s = t("./teardown/main").init,
      l = t("../_modules/audio-controller");
    e.exports = {
      init: function () {
        i.init(), r.init(), l.init(), s(), this.installAndExploreAnalytics(), o.init({
          toggleButton: $(".tech-specs").find(".nl-button"),
          table: $(".tech-specs-table-wrapper")
        })
      },
      installAndExploreAnalytics: function () {
        a.trackEvent("#protect-tech .nl-button", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "tech specs",
            gaLabel: "Protect"
          }
        }), a.trackEvent(".product-footer a.nl-button", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "navigation",
            gaAction: "go to store",
            gaLabel: "buy now bottom protect"
          }
        })
      }
    }
  }, {
    "../_modules/audio-controller": 66,
    "../_modules/tabs": 95,
    "../_modules/tech-specs": 99,
    "../_modules/ui-controller": 100,
    "../core_modules": 194,
    "./teardown/main": 273
  }],
  277: [function (t, e, n) {
    "use strict";
    var i = t("nl-client"),
      r = {};
    r.initFacebook = function () {
      var t, e = {
        en: "en_US",
        "en-CA": "en_US",
        "fr-CH": "fr_FR",
        "de-CH": "de_DE"
      };
      t = e[i.locale] ? e[i.locale] : i.locale.replace(/\-/g, "_"),
        function (e, n, i) {
          var r, o = e.getElementsByTagName(n)[0];
          e.getElementById(i) || ((r = e.createElement(n)).id = i, r.src = "//connect.facebook.net/" + t + "/all.js#xfbml=1", r.async = !0, o.parentNode.insertBefore(r, o))
        }(document, "script", "facebook-jssdk")
    }, r.initGPlus = function () {
      window.___gcfg = {
          lang: i.locale
        },
        function () {
          var t = document.createElement("script");
          t.async = !0, t.src = "https://apis.google.com/js/plusone.js";
          var e = document.getElementsByTagName("script")[0];
          e.parentNode.insertBefore(t, e)
        }()
    }, r.initTwitter = function () {
      ! function (t, e, n) {
        var i, r = t.getElementsByTagName(e)[0];
        t.getElementById(n) || ((i = t.createElement(e)).id = n, i.src = "https://platform.twitter.com/widgets.js", i.async = !0, r.parentNode.insertBefore(i, r))
      }(document, "script", "twitter-wjs")
    }, r.initPinterest = function () {
      var t = document.createElement("script");
      t.type = "text/javascript", t.src = "https://assets.pinterest.com/js/pinit.js", $("body").append(t)
    }, e.exports = r
  }, {
    "nl-client": 42
  }],
  278: [function (t, e, n) {
    "use strict";

    function i(t, e, n, i) {
      var r = 0,
        o = setInterval(function () {
          if (r > n) return clearInterval(o), void i();
          document.getElementById(t).innerHTML = r + "%", r += 1
        }, e / n)
    }

    function r(t) {
      var e = t.width || 260,
        n = t.stroke || 6,
        i = e / 2 - n,
        r = t.gap || 6,
        o = "clockwise" === (t.direction || "clockwise"),
        a = o ? " 0 1,1 " : " 0 0,0 ",
        s = o ? -r / 2 : r / 2;
      return "m " + (o ? e + r : e - r) / 2 + "," + n + " a " + i + "," + i + a + s + "," + 2 * i + " a " + i + "," + i + a + s + "," + -2 * i
    }

    function o(t) {
      t.addClass("hidden"), c.supports.animation ? t.on("Animationend msAnimationEnd webkitAnimationEnd", function (e) {
        "shrink" === e.originalEvent.animationName && t.removeClass("visible")
      }) : t.removeClass("visible")
    }

    function a(t, e) {
      analytics.trackEvent({
        gtm: {
          event: "gaEvent",
          gaCategory: "stories",
          gaAction: t,
          gaLabel: e
        }
      })
    }
    var s = t("../core_modules"),
      l = s.elementWatcher,
      c = s.client;
    e.exports = {
      scope: !!$("#a-co-emergency"),
      init: function () {
        var t = $(window).outerHeight(),
          e = $("#co-percent"),
          n = $("#map");
        ! function (t) {
          var e = document.createElement("script");
          e.src = t;
          var n = document.getElementsByTagName("script")[0];
          n.parentNode.insertBefore(e, n)
        }("//www.youtube.com/iframe_api"), window.onYouTubeIframeAPIReady = function () {
          var t, e, n, i, r, o = $("#molica-video"),
            s = !1,
            l = $("html.lt-ie10").length,
            c = new YT.Player("fs-video", {
              height: "100%",
              width: "100%",
              videoId: "JcodecOOttA",
              playerVars: {
                rel: 0,
                autoplay: 0,
                theme: "dark",
                fs: 1,
                modestbranding: 1,
                controls: 1,
                vq: "hd1080",
                showinfo: 0
              },
              events: {
                onReady: function () {
                  $("#molica-video").addClass("ready"), r = function () {
                    s = !1, clearInterval(n)
                  }, t = function (t) {
                    n = window.setInterval(function () {
                      s = !0, i = c.getCurrentTime(), t - i < 2 && !l && (o.addClass("finished"), r())
                    }, 1e3)
                  }, o.find(".play").off("click.poster"), o.find(".play").on("click", function (t) {
                    t.preventDefault(), c.playVideo(), window.setTimeout(function () {
                      o.addClass("active")
                    }, 1e3), a("clicked", "play video")
                  }), o.find(".replay").on("click", function (t) {
                    t.preventDefault(), c.playVideo(), window.setTimeout(function () {
                      o.removeClass("finished")
                    }, 1e3)
                  })
                },
                onStateChange: function (n) {
                  1 !== n.data || s || (e = c.getDuration(), t(e), c.getVideoBytesTotal && 1 === c.getVideoBytesTotal() && ($(".poster-image").css("height", "1px"), window.setTimeout(function () {
                    $(".poster-image").height("0px")
                  }, 0))), 2 !== n.data && 3 !== n.data || r(), 0 === n.data && (r(), o.addClass("finished"))
                }
              }
            });
          o.find(".play").on("click.poster", function (t) {
            t.preventDefault()
          })
        }, l.add({
          element: $("#percent"),
          callback: function () {
            $(".fill").addClass("active"), e.find(".text-block").addClass("active"), i("percent", 1e3, 58, function () {
              $(".supporting-copy").addClass("visible"), a("scrolled", "2 - percent")
            })
          }
        }), l.add({
          element: $("#seven-minutes"),
          offset: .55 * t,
          callback: function () {
            ! function () {
              function t(t, e) {
                return new Date(t.getTime() + 6e4 * e)
              }

              function e() {
                o = new Date, a = p - o, s = g > 1 ? g + " " + v.data("calls") : g + " " + v.data("call"), a < 1e3 && (clearInterval(n), y.text(s), v.addClass("active"), g++, h = new Date, p = t(h, d), n = setInterval(e, 100)), i = Math.floor(a % u / c), r = Math.floor(a % c / l), r = r < 10 ? "0" + r : r, f.text(i), m.text(r)
              }
              var n, i, r, o, a, s, l = 1e3,
                c = 60 * l,
                u = 60 * c,
                d = 7,
                h = new Date,
                p = t(h, d),
                f = $(".minutes"),
                m = $(".seconds"),
                g = 1,
                v = $("#tally"),
                y = $("#tally-number");
              n = setInterval(e, 1e3)
            }(), a("scrolled", "3 - seven minutes")
          }
        }), l.add({
          element: $("#invisible"),
          callback: function () {
            a("scrolled", "4 - invisible")
          }
        }), l.add({
          element: $("#symptoms").find(".subhead"),
          offset: .75 * t,
          callback: function () {
            $("#symptoms").find(".text-block").addClass("visible"), a("scrolled", "5 - symptoms")
          }
        }), l.add({
          element: $("#story-footer"),
          callback: function () {
            a("scrolled", "footer")
          }
        }), $("#story-footer").find(".facebook").on("click", function () {
          a("clicked", "facebook share")
        }), $("#story-footer").find(".twitter").on("click", function () {
          a("clicked", "twitter share")
        }), $("#story-footer").find(".google-plus").on("click", function () {
          a("clicked", "google-plus share")
        }), e.find(".map-activator").on("click keyup", function (t) {
          t.preventDefault(), n.addClass("visible").removeClass("hidden")
        }), e.find("#widget-close-button").on("click", function (t) {
          t.preventDefault(), o(n)
        }), $(document).keyup(function (t) {
          27 === t.keyCode && o(n)
        }), $("#invisible").find("span").each(function (t, e) {
          t = 500 * (t + 1), window.setTimeout(function () {
            $(e).addClass("active")
          }, t)
        });
        var s = function () {
          i("heat-percent", 1400, 76, function () {
            $("#waves").addClass("active"), $("#heating-systems").find(".fade-in").add(".fade-in-last").addClass("visible"), a("scrolled", "6 - heating systems")
          })
        };
        if ($(".ie8").length) l.add({
          element: $("#svg-block"),
          offset: .45 * t,
          callback: function () {
            s()
          }
        });
        else {
          var c, u, d, h = document.querySelector("#fade path"),
            p = document.querySelector("#fill path"),
            f = function () {
              d = $("#svg-block").width(), $(h).attr("d", r({
                width: d,
                direction: "counterClockwise"
              })), u = h.getTotalLength(), h.style.strokeDasharray = u + " " + u, h.style.strokeDashoffset = 0, h.getBoundingClientRect()
            },
            m = function () {
              d = $("#svg-block").width(), $(p).attr("d", r({
                width: d
              })), c = p.getTotalLength(), p.style.strokeDasharray = c + " " + c, p.style.strokeDashoffset = c, p.getBoundingClientRect()
            },
            g = function () {
              h.style.strokeDashoffset = .76 * u, p.style.strokeDashoffset = .24 * c + 6
            };
          window.matchMedia("(min-width:768px)").addListener(function () {
            f(), m(), g()
          }), l.add({
            element: $("#svg-block"),
            offset: .45 * t,
            callback: function () {
              g(), s()
            }
          }), f(), m()
        }
      }
    }
  }, {
    "../core_modules": 194
  }],
  279: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  280: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  281: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  282: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  283: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  284: [function (t, e, n) {
    "use strict";

    function i(t, e) {
      0 === e ? ($("#number-bubble").addClass("is-rotated"), e = $("#number-bubble").attr("data-number-zero")) : $("#number-bubble").hasClass("is-rotated") && $("#number-bubble").removeClass("is-rotated"), t.addClass("is-visible"), $("#number-bubble").delay(1e3).css("top", t.find("h3").offset().top).text(e)
    }

    function r() {
      var t = [];
      return $(".has-an-impact").each(function () {
        var e = {};
        e.min = $(this).offset().top, e.max = e.min + $(this).outerHeight(), e.element = $(this), t.push(e)
      }), t
    }
    var o = t("underscore"),
      a = t("../../core_modules").elementWatcher;
    e.exports = function () {
      i($("#has-an-impact"), $("#number-bubble").attr("data-number-zero")), $("#number-bubble").addClass("is-rotated");
      var t = r();
      $(window).resize(function () {
        t = r()
      }), a.add({
        element: $(".has-an-impact-global-container"),
        enter: function () {
          $(window).scroll(o.throttle(function () {
            for (var e = $(window).scrollTop() + parseInt(.5 * $(window).height(), 10), n = 0, r = t.length; n < r; n++) e >= t[n].min && e < t[n].max && i(t[n].element, n)
          }, 300))
        },
        persist: !0
      })
    }
  }, {
    "../../core_modules": 194,
    underscore: 58
  }],
  285: [function (t, e, n) {
    "use strict";
    var i = t("../../core_modules").elementWatcher,
      r = t("./a-green-future"),
      o = t("./video"),
      a = t("./the-high-bar"),
      s = t("./power-in-numbers"),
      l = t("./leed-difference"),
      c = t("./just-energy"),
      u = t("./has-an-impact"),
      d = t("./has-an-impact-one"),
      h = t("./has-an-impact-two"),
      p = t("./has-an-impact-three"),
      f = t("./go-for-gold"),
      m = t("./story-footer");
    e.exports = {
      init: function () {
        r(), o(), a(), s(), l(), c(), u(), d(), h(), p(), f(), m(), i.add({
          element: $("#has-an-impact"),
          offset: $("#has-an-impact").outerHeight(),
          enter: function () {
            analytics.track("send", "event", "stories", "viewed-section", "has-an-impact: intro")
          },
          persist: !0
        }), i.add({
          element: $("#has-an-impact-one"),
          offset: $("#has-an-impact-one").outerHeight(),
          enter: function () {
            analytics.track("send", "event", "stories", "viewed-section", "has-an-impact: airtight")
          },
          persist: !0
        }), i.add({
          element: $("#has-an-impact-two"),
          offset: $("#has-an-impact-two").outerHeight(),
          enter: function () {
            analytics.track("send", "event", "stories", "viewed-section", "has-an-impact: thermostat")
          },
          persist: !0
        }), i.add({
          element: $("#has-an-impact-three"),
          offset: $("#has-an-impact-three").outerHeight(),
          enter: function () {
            analytics.track("send", "event", "stories", "viewed-section", "has-an-impact: savings")
          },
          persist: !0
        }), i.add({
          element: $("#go-for-gold"),
          enter: function () {
            analytics.track("send", "event", "stories", "viewed-section", "go-for-gold")
          }
        }), i.add({
          element: $("#story-footer"),
          enter: function () {
            analytics.track("send", "event", "stories", "viewed-section", "story-footer")
          }
        })
      }
    }
  }, {
    "../../core_modules": 194,
    "./a-green-future": 279,
    "./go-for-gold": 280,
    "./has-an-impact": 284,
    "./has-an-impact-one": 281,
    "./has-an-impact-three": 282,
    "./has-an-impact-two": 283,
    "./just-energy": 286,
    "./leed-difference": 287,
    "./power-in-numbers": 288,
    "./story-footer": 289,
    "./the-high-bar": 290,
    "./video": 291
  }],
  286: [function (t, e, n) {
    "use strict";

    function i(t) {
      return t < .5 ? 8 * t * t * t * t : 1 - 8 * --t * t * t * t
    }

    function r(t) {
      return t.toLowerCase().split(" ").join("-")
    }

    function o(t, e) {
      if (!k[e]) {
        var n = t * C,
          i = _[e].getBBox().width + 10,
          r = k[e + 1];
        k[e] = r && n < r + i ? r + i : n
      }
      return k[e]
    }

    function a(t) {
      return t / E * .9 + .1
    }

    function s(t) {
      return Math.sin(t / E * Math.PI) / 3 + .5
    }

    function l(t, e, n) {
      var i = 1 - s(t);
      return 0 === e || e === n ? 0 : e % 2 == 0 ? 0 : i * Math.sin(t / E * Math.PI) * (Math.PI / 2)
    }

    function c(t, e) {
      if (y[e]) {
        var n = y.length - 1,
          i = l(y[e][1], e, n),
          r = t;
        v[0].setAttribute("opacity", 1);
        var c = o(a(y[e][1]), e),
          u = i + r * s(y[e][1]) * (Math.PI / 2),
          d = Math.cos(i) * c,
          h = S - Math.sin(i) * c,
          p = Math.cos(u) * c,
          f = S - Math.sin(u) * c,
          m = ["M", d, h, "A", c, c, 0, 0, 0, p, f, "L", 0, S, "Z"];
        w[e][0].setAttribute("d", m.join(" ")), _[e].setAttribute("x", p - _[e].getBBox().width - 4), _[e].setAttribute("y", f + _[e].getBBox().height - 2), _[e].setAttribute("transform", "rotate(" + 180 * (2 * Math.PI - u) / Math.PI + " " + p + "," + f + ")")
      }
    }

    function u() {
      for (var t = $("#pieChart"), e = $("#pieKey"), n = y.length - 1; n >= 0; n--) {
        var o = y[n][0],
          a = document.createElement("li"),
          s = document.createElement("span"),
          l = document.createElement("span"),
          u = document.createElement("span");
        x[n] = a, l.setAttribute("class", r(o)), s.innerHTML = o, u.innerHTML = "(" + y[n][1] + "%)", $(l).appendTo(a).addClass("circle"), $(s).appendTo(a), $(u).appendTo(a).addClass("mobile-only"), $(a).appendTo(e)
      }
      g = $('<svg viewBox="0 0 ' + C + " " + S + '" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"></svg>').appendTo(t), b = [], w = [], _ = [];
      ! function (t) {
        Math.min.apply(null, t)
      }([S / 2, C / 2]);
      var d = document.createElementNS("http://www.w3.org/2000/svg", "g");
      (v = $(d).appendTo(g))[0].setAttribute("opacity", 0);
      for (var h = 0, p = y.length; h < p; h++) {
        var f = document.createElementNS("http://www.w3.org/2000/svg", "g");
        f.setAttribute("data-order", h), b[h] = $(f).appendTo(v);
        var m = document.createElementNS("http://www.w3.org/2000/svg", "path");
        m.setAttribute("class", r(y[h][0])), w[h] = $(m).appendTo(b[h]);
        var k = document.createElementNS("http://www.w3.org/2000/svg", "text");
        k.setAttribute("data-order", h), k.setAttribute("class", r(y[h][0])), _[h] = k, $(k).appendTo(b[h]), k.textContent = y[h][1] + "%",
          function (t) {
            E < t && (E = t)
          }(y[h][1])
      }
      return function (t) {
        for (var e = y.length - 1, n = 0; n < y.length; n++) j[n] = 0;
        window.requestAnimationFrame(function n() {
          j[e] += T, c(i(j[e]), e), j[e] > 1 / 3 && j[e - 1] && (j[e - 1] += T, c(i(j[e - 1]), e - 1)), j[e] > 2 / 3 && j[e - 2] && (j[e - 2] += T, c(i(j[e - 2]), e - 2)), j[e] < 1 ? window.requestAnimationFrame(n) : e > 0 ? (e--, window.requestAnimationFrame(n)) : t()
        })
      }(function () {
        $(x).addClass("visible"), $(_).each(function () {
          $(this).addClassSVG("visible")
        })
      }), t
    }

    function d(t) {
      $(x).removeClass("visible"), $(_).each(function () {
          $(this).removeClassSVG("visible")
        }),
        function (t) {
          var e = 1;
          window.requestAnimationFrame(function n() {
            (function (t) {
              var e = y.length - 1,
                n = t;
              v[0].setAttribute("opacity", 1);
              for (var i = 0; i <= e; i++) {
                var r = y[i][1],
                  c = l(r, i, e),
                  u = o(a(r), i),
                  d = c + n * s(r) * (Math.PI / 2),
                  h = Math.cos(c) * u,
                  p = S - Math.sin(c) * u,
                  f = Math.cos(d) * u,
                  m = S - Math.sin(d) * u,
                  g = ["M", h, p, "A", u, u, 0, 0, 0, f, m, "L", 0, S, "Z"];
                w[i][0].setAttribute("d", g.join(" ")), _[i].setAttribute("x", f - $(_[i]).width() - 4), _[i].setAttribute("y", m + $(_[i]).height() - 2), _[i].setAttribute("transform", "rotate(" + 180 * (2 * Math.PI - d) / Math.PI + " " + f + "," + m + ")")
              }
            })(i(e -= T)), e > 0 ? window.requestAnimationFrame(n) : t()
          })
        }(function () {
          $(x).remove(), x = [], y = t, k = [], E = 0, j = [], b = [], w = [], _ = [], v = null, k = [], E = 0, $(g).remove(), g = null, u()
        })
    }
    var h = t("../../core_modules"),
      p = h.analytics,
      f = h.elementWatcher;
    $.fn.addClassSVG = function (t) {
      return $(this).attr("class", function (e, n) {
        return n + " " + t
      }), this
    }, $.fn.removeClassSVG = function (t) {
      return $(this).attr("class", function (e, n) {
        var i = new RegExp(t, "g");
        return n.replace(i, "")
      }), this
    };
    var m = {
        "National Average": [["Coal", 35.6], ["Natural Gas", 24.1], ["Nuclear", 15.9], ["Conventional Hydroelectric", 8.1], ["Other", 4.9], ["Wind", 4.5]],
        Florida: [["Natural Gas", 60.8], ["Coal", 20.7], ["Nuclear", 11.8], ["Other", 4.5]],
        Alabama: [["Coal", 34], ["Natural Gas", 30.2], ["Nuclear", 26.6], ["Conventional Hydroelectric", 8.2], ["Other", 2.3]],
        Louisiana: [["Natural Gas", 50.5], ["Coal", 20.1], ["Nuclear", 16.3], ["Other", 10.9]],
        Georgia: [["Natural Gas", 37], ["Coal", 32.2], ["Nuclear", 26.4], ["Other", 6]],
        Hawaii: [["Petroleum Liquids", 63.9], ["Coal", 12.8], ["Other", 6], ["Wind", 4.6], ["Geothermal", 2.5]],
        Idaho: [["Conventional Hydroelectric", 48.1], ["Natural Gas", 17.9], ["Wind", 13.5], ["Other", 3.7]],
        Illinois: [["Nuclear", 46.5], ["Coal", 41.3], ["Wind", 4.5], ["Natural Gas", 3.1], ["Other", .7]],
        Indiana: [["Coal", 81.3], ["Natural Gas", 7.8], ["Other", 3.3], ["Wind", 3.1], ["Petroleum Coke", 1.3]],
        Iowa: [["Coal", 46.4], ["Wind", 21.5], ["Nuclear", 7.3], ["Other", 3.2]],
        Kansas: [["Coal", 51.2], ["Wind", 16.2], ["Nuclear", 12.3], ["Other", 3.9]],
        Alaska: [["Natural Gas", 52.3], ["Conventional Hydroelectric", 22.5], ["Petroleum Liquids", 12.1], ["Coal", 8.6], ["Wind", 2.2]],
        Maine: [["Natural Gas", 26.1], ["Conventional Hydroelectric", 21.8], ["Wood and Wood-Derived Fuels", 17.4], ["Other", 10.4]],
        Maryland: [["Coal", 44], ["Nuclear", 39], ["Other", 8.4], ["Natural Gas", 7.4]],
        Massachusetts: [["Natural Gas", 59], ["Other", 12.4], ["Nuclear", 12], ["Coal", 11.2]],
        Michigan: [["Coal", 51.1], ["Nuclear", 26.1], ["Natural Gas", 11.5], ["Other", 6.7]],
        Minnesota: [["Coal", 38.1], ["Nuclear", 17.5], ["Wind", 13.2], ["Natural Gas", 10.6], ["Other", 4.5]],
        Mississippi: [["Natural Gas", 58.5], ["Nuclear", 20], ["Coal", 16], ["Other", 2.8]],
        Missouri: [["Coal", 81.9], ["Nuclear", 9], ["Natural Gas", 4.8], ["Other", 3.1]],
        Montana: [["Coal", 50.3], ["Conventional Hydroelectric", 34.1], ["Wind", 5.7], ["Other", 4.2]],
        Nebraska: [["Coal", 68.7], ["Nuclear", 17.6], ["Wind", 4.6], ["Other", 4.5]],
        Nevada: [["Natural Gas", 61.3], ["Coal", 13], ["Geothermal", 7], ["Conventional Hydroelectric", 6.7], ["Other", 2.6]],
        Arizona: [["Coal", 38.5], ["Nuclear", 27.8], ["Natural Gas", 23.7], ["Conventional Hydroelectric", 5.3], ["Other", 2.3]],
        "New Hampshire": [["Nuclear", 51], ["Natural Gas", 19.1], ["Conventional Hydroelectric", 6.8], ["Coal", 6.8], ["Wood and Wood-Derived Fuels", 5.3], ["Other", 3.3]],
        "New Jersey": [["Nuclear", 50.2], ["Natural Gas", 40.9], ["Other", 6.7]],
        "New Mexico": [["Coal", 62.5], ["Natural Gas", 23.4], ["Wind", 5.7], ["Other", 1.7]],
        "New York": [["Natural Gas", 37.5], ["Nuclear", 31.6], ["Conventional Hydroelectric", 17.8], ["Other", 9]],
        "North Carolina": [["Coal", 36.7], ["Nuclear", 31.5], ["Natural Gas", 21.9], ["Conventional Hydroelectric", 5], ["Other", 2.6]],
        "North Dakota": [["Coal", 68], ["Wind", 13.5], ["Conventional Hydroelectric", 4.5], ["Other", .4]],
        Ohio: [["Coal", 68.4], ["Natural Gas", 15.2], ["Nuclear", 11.6], ["Other", 3.5]],
        Oklahoma: [["Natural Gas", 41], ["Coal", 35.4], ["Wind", 12.8], ["Other", 2.9]],
        Oregon: [["Conventional Hydroelectric", 48.7], ["Natural Gas", 20.9], ["Wind", 10.9], ["Coal", 5.5], ["Other", 1.6]],
        Arkansas: [["Coal", 51.3], ["Natural Gas", 19.6], ["Nuclear", 19.2], ["Other", 7.3]],
        Pennsylvania: [["Coal", 38.5], ["Nuclear", 33.7], ["Natural Gas", 21], ["Other", 4.4]],
        "Rhode Island": [["Natural Gas", 88.1], ["Other", 11.9]],
        "South Carolina": [["Nuclear", 55.5], ["Coal", 25], ["Natural Gas", 12.4], ["Other", 5.1]],
        "South Dakota": [["Conventional Hydroelectric", 31.3], ["Coal", 22.7], ["Wind", 20.6], ["Other", 4.9]],
        Tennessee: [["Coal", 40.8], ["Nuclear", 35.7], ["Conventional Hydroelectric", 14.7], ["Natural Gas", 5.9], ["Other", 1.5]],
        Texas: [["Natural Gas", 43.1], ["Coal", 31.7], ["Nuclear", 8.1], ["Wind", 7.6], ["Other", 1.5]],
        Utah: [["Coal", 78.8], ["Natural Gas", 15], ["Other", 4.1]],
        Vermont: [["Nuclear", 63.5], ["Conventional Hydroelectric", 17.8], ["Wood and Wood-Derived Fuels", 5.6], ["Other", 3.6]],
        Virginia: [["Nuclear", 36.1], ["Natural Gas", 27.9], ["Coal", 26.3], ["Other", 6.3]],
        Colorado: [["Coal", 55.4], ["Natural Gas", 17.5], ["Wind", 12], ["Other", 2.6]],
        Washington: [["Conventional Hydroelectric", 63.8], ["Natural Gas", 8.9], ["Nuclear", 6.9], ["Wind", 5.7], ["Coal", 5.5], ["Other", 1.9]],
        "West Virginia": [["Coal", 93.6], ["Conventional Hydroelectric", 2.2], ["Wind", 1.8], ["Other", .6]],
        Wisconsin: [["Coal", 59.3], ["Nuclear", 17], ["Natural Gas", 12], ["Other", 7.1]],
        Wyoming: [["Coal", 81.7], ["Wind", 7.8], ["Other", 2.8]],
        Connecticut: [["Nuclear", 50], ["Natural Gas", 43.1], ["Other", 5.7]],
        Delaware: [["Natural Gas", 74], ["Coal", 20.6], ["Other", 3.9]],
        Kentucky: [["Coal", 92.3], ["Conventional Hydroelectric", 3.7], ["Natural Gas", 1.6], ["Other", 1.9]],
        California: [["Natural Gas", 49.6], ["Conventional Hydroelectric", 10.4], ["Nuclear", 7.6], ["Other", 6.1], ["Wind", 5.6], ["Geothermal", 5.4]]
      },
      g = null,
      v = null,
      y = null,
      b = [],
      w = [],
      _ = [],
      k = [],
      x = [],
      E = 0,
      C = 600,
      S = 600,
      T = 1 / 42,
      j = [],
      L = !1;
    e.exports = function () {
      ! function () {
        if (!L) {
          L = !0;
          var t = document.getElementById("pieSelect"),
            e = [];
          Object.keys(m).forEach(function (t) {
            "National Average" !== t && e.push(t)
          }), e.sort(), (e = ["National Average"].concat(e)).forEach(function (e) {
            var n = document.createElement("option");
            n.value = e, n.innerHTML = e, t.appendChild(n)
          }), y = m["National Average"], t.addEventListener("change", function () {
            window.pageYOffset > g.offset().top && $("html, body").animate({
              scrollTop: g.offset().top
            }, 500), d(m[this.value]), p.track("send", "event", "stories", "changed-save-energy-location", this.value)
          })
        }
      }(), f.add({
        element: $("#pieChart"),
        offset: $("#pieChart").outerHeight(),
        enter: function (t) {
          u()
        },
        callback: function () {
          p.track("send", "event", "stories", "viewed-section", "just-energy-graphs")
        }
      })
    }
  }, {
    "../../core_modules": 194
  }],
  287: [function (t, e, n) {
    "use strict";
    var i = t("../../core_modules").elementWatcher;
    e.exports = function () {
      i.add({
        element: $("#leed-difference"),
        enter: function (t) {
          t.element.addClass("triggered")
        },
        callback: function () {
          analytics.track("send", "event", "stories", "viewed-section", "leed-difference")
        }
      })
    }
  }, {
    "../../core_modules": 194
  }],
  288: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("../../core_modules"),
      o = r.elementWatcher,
      a = r.nlEvents,
      s = r.client,
      l = r.analytics,
      c = $(window),
      u = {},
      d = $("#power-in-numbers"),
      h = !1;
    e.exports = function () {
      function t() {
        return $(window).width() >= 768
      }
      u.events = {}, a.createEmitter(u.events), $(window).on("resize", i.debounce(function () {
        u.events.trigger("windowResizeEnd"), u.events.IS_RESIZING = !1
      }, 600)), u.init = function () {
        function t() {
          b = c.height(), w = Math.min(r, b)
        }

        function e() {
          if (x = c.scrollTop() - a + b, _ = w - x, _ = _ > 0 ? _ : 0, k = function (t, e) {
              return Math.sin((t / e - 1) * Math.PI / 2) * e + e
            }(_ / r, 1), S) {
            for (var t, e = 0, o = f.length; e < o; e++)(t = f[e]).el.css(E, "translate(" + ("left" === t.direction ? "-" : "") + Math.pow(t.xFactor + Math.pow(k, 2), 2) * Math.pow(t.row + 1 + Math.pow(k, 3), 2) * (_ / 1500) + "px," + Math.pow(t.row + k, 2) * _ / 30 + "px)");
            n.css(E, "translateY(" + _ / 3 + "px)")
          }
          0 === _ && (c.off("scroll.powerInNumbers"), function () {
            f = i.shuffle(f);
            for (var t = 0; t < f.length; t++) setTimeout(i.bind(function () {
              this.activate()
            }, f[t]), 10 * t)
          }(), d.addClass("triggered"))
        }
        h = !0;
        var n = $("#device-grid"),
          r = d.outerHeight(!0),
          a = d.offset().top,
          p = n.width(),
          f = [],
          m = function () {
            this.row = 0, this.column = 0
          },
          g = n.find(".thermostat");
        m.prototype.template = '<div class="thermostat">' + g.html() + "</div>", g.remove(), m.prototype.activate = function () {
          this.el.addClass("on")
        };
        for (var v, y = 0; y < 242; y++) v = new m, f.push(v), v.row = Math.floor(y / 22), v.column = y % 22, v.direction = 2 * v.column >= 22 ? "right" : "left", v.xFactor = v.column >= 11 ? v.column - 11 + 1 : 11 - v.column, v.threshold = 50 * v.row, v.wrapper = $(v.template).appendTo(n), v.el = v.wrapper.find(".device"), v.wrapper.css({
          marginLeft: p / 22 * v.column + "px",
          marginTop: p / 22 * v.row + "px"
        }), v.wrapper.data("model", v), v.wrapper.attr("data-d", v.xFactor);
        o.add({
          element: d,
          enter: function (t) {
            c.on("scroll.powerInNumbers", e), e(), l.track("send", "event", "stories", "viewed-section", "power-in-numbers")
          }
        });
        var b, w, _, k, x = 0,
          E = s.supports.transform,
          C = !!navigator.userAgent.match(/(iPad|iPhone|iPod)/g),
          S = E && !C;
        u.events.on("windowResizeEnd", function () {
          t()
        }), t(), S && e()
      }, u.events.on("windowResizeEnd", function () {
        if (t()) {
          if (h) return;
          u.init()
        }
      }), t() && u.init()
    }
  }, {
    "../../core_modules": 194,
    underscore: 58
  }],
  289: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  290: [function (t, e, n) {
    "use strict";
    var i = t("../../core_modules").elementWatcher;
    e.exports = function () {
      var t = $("#the-high-bar");
      t.find("[data-target]").on("click", function () {
        var e = $(this);
        e.hasClass("the-high-bar-section") && $(window).width() < 600 || (t.find("[data-target]").removeClass("active"), e.addClass("active"), $(e.attr("data-target")).addClass("active"))
      }), i.add({
        element: t,
        persist: !0,
        enter: function (e) {
          t.addClass("animate")
        },
        exit: function () {
          t.removeClass("animate")
        }
      })
    }
  }, {
    "../../core_modules": 194
  }],
  291: [function (t, e, n) {
    "use strict";
    var i = t("spin.js");
    e.exports = function () {
      var t, e, n, r, o, a = $("#video"),
        s = !1,
        l = {
          lines: 9,
          length: 0,
          width: 24,
          radius: 0,
          corners: 1,
          rotate: 0,
          direction: 1,
          color: "#fff",
          speed: 2,
          trail: 50,
          shadow: !1,
          hwaccel: !0,
          className: "spinner",
          zIndex: 2e9,
          top: "50%",
          left: "50%"
        };
      a.addClass("untouched");
      var c = new function (c) {
        var u = this;
        this.ready = !1;
        var d, h = !1;
        this.play = function () {
          u.player.playVideo(), window.setTimeout(function () {
            a.removeClass("finished"), a.addClass("active"), u.stopLoader()
          }, 1e3)
        }, this.startLoader = function () {
          a.addClass("loading");
          var t = $(".poster-image.start");
          d = new i(l).spin(t.get(0))
        }, this.stopLoader = function () {
          a.removeClass("loading"), d.stop()
        }, this.init = function () {
          a.find(".replay").on("click", function (t) {
            t.preventDefault(), u.play()
          }), u.player = new YT.Player("video-frame", {
            height: "100%",
            width: "100%",
            videoId: "V8PnrdwcTeQ",
            playerVars: c,
            events: {
              onReady: function () {
                u.ready = !0, o = function () {
                  s = !1, clearInterval(n)
                }, t = function (t) {
                  n = window.setInterval(function () {
                    s = !0, r = u.player.getCurrentTime(), t - r < 2 && (a.addClass("finished"), o())
                  }, 1e3)
                }, h && u.play(), u.ready = !0
              },
              onStateChange: function (n) {
                1 !== n.data || s || (e = u.player.getDuration(), t(e)), 2 !== n.data && 3 !== n.data || o(), 0 === n.data && (o(), a.removeClass("active").addClass("finished"))
              }
            }
          }), a.find(".play").on("click.poster", function (t) {
            t.preventDefault(), h = !0, u.startLoader(), a.removeClass("untouched"), u.ready && u.play()
          })
        }
      }({
        rel: 0,
        autoplay: 0,
        theme: "dark",
        fs: 1,
        modestbranding: 1,
        controls: 1,
        vq: "hd1080",
        showinfo: 0,
        wmode: "opaque"
      });
      window.onYouTubeIframeAPIReady = c.init;
      var u = document.createElement("script");
      u.src = "//www.youtube.com/iframe_api";
      var d = document.getElementsByTagName("script")[0];
      return d.parentNode.insertBefore(u, d), c
    }
  }, {
    "spin.js": 57
  }],
  292: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("./core_modules").validator,
      o = t("./analytics");
    e.exports = {
      isInvalid: !1,
      form: document.getElementById("share-clip-form"),
      requiredFields: function () {
        return this.form.getElementsByClassName("required")
      },
      submitForm: function (t) {
        if (t.preventDefault(), t.stopPropagation(), this.validate(), this.isInvalid || !this.form.tos_agreement__c.checked) {
          var e = this.form.getElementsByClassName("error")[0];
          $("html,body").animate({
            scrollTop: e.offsetTop
          }, 500);
          var n = [];
          return $(this.form).find(".error").each(function () {
            var t = $(this).find("[name]").attr("name"),
              e = $(this).find(".message").text();
            n.push(e ? t + " " + e : t)
          }), void o.trackEvent({
            gtm: {
              event: "gaEvent",
              gaCategory: "videos",
              gaAction: "nestcam best submit",
              gaLabel: "submit clip fail - " + n.join(",")
            }
          })
        }
        $(".submit").addClass("clip-fadeOutDown"), $(".submitting").addClass("clip-fadeInDown");
        var i = $(this.form);
        $.ajax({
          contentType: "text/plain;charset=UTF-8",
          url: i.attr("action"),
          type: "POST",
          data: JSON.stringify(this.data()),
          success: $.proxy(this.success, this)
        })
      },
      data: function () {
        return {
          locale__c: this.form.locale__c.value,
          link__c: this.form.link__c.value.trim(),
          title__c: this.form.title__c.value,
          description__c: this.form.description__c.value,
          first_name__c: this.form.first_name__c.value,
          last_name__c: this.form.last_name__c.value,
          email__c: this.form.email__c.value,
          city__c: this.form.city__c.value,
          state__c: this.form.state__c.value,
          zip__c: this.form.zip__c.value,
          country__c: this.form.country__c.value,
          promo_agreement__c: !!this.form.promo_agreement__c && this.form.promo_agreement__c.checked,
          tos_agreement__c: this.form.tos_agreement__c.checked,
          source_type__c: this.form.source_type__c.value
        }
      },
      success: function () {
        this.clearForm(), o.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "videos",
            gaAction: "nestcam best submit",
            gaLabel: "submit clip success"
          }
        }), setTimeout(function () {
          $(".submitting").removeClass("clip-fadeInDown").addClass("clip-fadeOutDown"), $(".thank-you").addClass("clip-fadeInDown"), setTimeout(function () {
            $(".thank-you").removeClass("clip-fadeInDown").addClass("clip-fadeOutDown"), $(".submit").removeClass("clip-fadeOutDown").addClass("clip-fadeInDown"), setTimeout(function () {
              $(".clip-fadeOutDown").removeClass("clip-fadeOutDown"), $(".clip-fadeInDown").removeClass("clip-fadeInDown")
            }, 1e3)
          }, 3e3)
        }, 1e3)
      },
      clearForm: function () {
        this.form.link__c.value = "", this.form.title__c.value = "", this.form.description__c.value = "", this.form.promo_agreement__c && (this.form.promo_agreement__c.checked = !1), this.form.tos_agreement__c.checked = !1
      },
      applyErrorMessage: function (t) {
        t.parentElement.className += " error"
      },
      resetErrorState: function (t) {
        var e = t.parentElement.className;
        t.parentElement.className = e.replace(/\s?error/, "")
      },
      validateInput: function (t) {
        var e = t.target;
        this.resetErrorState(e), (r.invalidEmail(e) || this.isNotChecked(e) && "tos_agreement__c" === $(e).attr("id") || this.invalidUrl(e) || this.invalidInput(e)) && (this.isInvalid = !0, this.applyErrorMessage(e))
      },
      invalidInput: function (t) {
        return r.invalidInput(t) || $(t).attr("placeholder") === $(t).val()
      },
      validate: function () {
        this.isInvalid = !1, i.each(this.requiredFields(), $.proxy(function (t) {
          $(t).trigger("focusout")
        }, this))
      },
      isNotChecked: function (t) {
        return t.attributes.type && "checkbox" === t.attributes.type.value && !t.checked
      },
      invalidUrl: function (t) {
        return $(t).hasClass("url") && !this.isValidUrl($(t).val())
      },
      isValidUrl: function (t) {
        return /^(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/.test(t.trim())
      },
      parseUrl: function (t) {
        t.match(/^[a-z]+:\/\//i) || (t = "https://" + t);
        var e = document.createElement("a");
        return e.href = t, {
          hostname: e.hostname,
          pathname: e.pathname
        }
      },
      init: function () {
        this.form.addEventListener("submit", $.proxy(this.submitForm, this)), i.each(this.requiredFields(), $.proxy(function (t) {
          $(t).on("focusout", $.proxy(this.validateInput, this))
        }, this))
      }
    }
  }, {
    "./analytics": 136,
    "./core_modules": 194,
    underscore: 58
  }],
  293: [function (t, e, n) {
    "use strict";

    function i(t) {
      if (Array.isArray(t)) {
        for (var e = 0, n = Array(t.length); e < t.length; e++) n[e] = t[e];
        return n
      }
      return Array.from(t)
    }

    function r() {
      if (N.debug) {
        E.debug = !0;
        for (var t = arguments.length, e = Array(t), n = 0; n < t; n++) e[n] = arguments[n];
        console.info.apply(this, ["articleSymptomList: "].concat(e))
      }
    }

    function o() {
      r("getFilteredData()");
      var t = E.master.articles,
        e = E.activeFilters.products,
        n = E.activeFilters.symptom;
      e.includes("all") || (t = t.filter(function (t) {
        return t.products.some(function (t) {
          return e.includes(t)
        })
      }));
      return {
        fullyFiltered: t.filter(function (t) {
          return t.symptoms.includes(n)
        }),
        filteredByProducts: t
      }
    }

    function a() {
      return r("isMobile()"), !I.matches
    }

    function s() {
      r("error()"), dataLayer.push({
        event: "gaEvent",
        gaCategory: "support-pdp-article-list",
        gaAction: "request-error"
      }), w.find(b.mainArticleListContent).html(P)
    }

    function l() {
      r("xhrDone()"), w.find(b.loadingOverlay).remove()
    }

    function c() {
      r("xhr()"), "complete" === document.readyState ? $.ajax({
        url: x + "/" + C,
        dataType: "json",
        headers: (r("xhrHeaders()"), {
          "X-App-Safe": (r("isAppSafe()"), !(!N.debug || "jasper" !== N.debug) || m.isIniPhoneWebView())
        }),
        success: function (t) {
          r("xhrSuccess(data)"), t.data.symptoms.push({
            loc: w.data("top-articles"),
            key: "top_articles"
          }), E.master = function (t) {
            r("cleanPayload(data)");
            var e = t,
              n = e.symptoms.map(function (t) {
                return t.key
              });
            return e.articles.forEach(function (t) {
              t.symptoms = t.symptoms.filter(function (t) {
                return n.includes(t) || r("--- removing " + t), n.includes(t)
              })
            }), e.articles = e.articles.filter(function (t) {
              return t.symptoms.length > 0
            }), e.articles.length || w.trigger(y.error), e.symptoms = function (t) {
              r("sortSymptoms(symptoms)");
              var e = t.map(function (t, e) {
                var n = t;
                return "top_articles" === n.key ? n.index = 0 : n.index = e + 1, n
              });
              return e = e.sort(function (t, e) {
                return t.index > e.index ? 1 : t.index < e.index ? -1 : 0
              })
            }(e.symptoms), e
          }(t.data), w.trigger(y.updateProductList), w.trigger(y.renderSymptoms), w.trigger(y.renderArticles)
        },
        error: s,
        complete: l
      }) : (r("document isn't ready yet"), setTimeout(c, 200))
    }

    function u() {
      r("updateSymptomFilter(evt)");
      var t = this.value;
      E.activeFilters.symptom = t, w.trigger(y.resetShowMore), w.trigger(y.renderArticles), w.trigger(y.renderSymptoms)
    }

    function d() {
      r("updateByBreakpoint()"), r("isMobile() => " + a()), a() ? (w.find(b.symptomSelect).show(), w.find(b.symptomList).hide()) : (w.find(b.symptomSelect).hide(), w.find(b.symptomList).show())
    }

    function h() {
      return "support categories " + E.activeFilters.products.sort().join(", ") + " | " + E.activeFilters.symptom.replace(/_/g, " ")
    }

    function p() {
      r("fireAnalytics()"), dataLayer.push({
        event: "gaEvent",
        gaCategory: "support",
        gaAction: h()
      })
    }
    var f = t("handlebars"),
      m = t("../../nest-app-cookie"),
      g = t("../../_modules/query_utils"),
      v = t("../../_modules/side-scroll-controller");
    f.registerHelper("join", function (t, e) {
      return new f.SafeString(e.join(t))
    }), Array.prototype.remove = function (t) {
      this.includes(t) && this.splice(this.indexOf(t), 1)
    }, Array.prototype.simplify = function () {
      for (var t = 0; t < this.length; t++) this.indexOf(this[t]) !== t && (this.splice(t, 1), t--);
      return this
    };
    var y = {
        error: "error",
        renderArticles: "render-articles",
        renderSymptoms: "render-symptoms",
        resetShowMore: "reset-show-more",
        setupProductFilterScroller: "setup-product-filter-scroller",
        showMore: "show-more",
        updateProduct: "update-product-filter",
        updateProductList: "update-product-list",
        updateProducts: "update-products",
        updateShowMore: "update-show-more",
        updateSymptom: "update-symptom"
      },
      b = {
        mainScope: "#article-symptom-list",
        articleListTemplate: "#article-list-template",
        errorTemplate: "#article-list-error",
        listOfArticles: "#list-of-articles",
        loadingOverlay: ".loading-overlay",
        mainArticleListContent: ".main-article-list-content",
        productFilter: "#product-filter",
        productFilterButton: "#product-filter button[value]",
        seeMoreButton: "button.article-see-more",
        symptomList: "#symptom-list",
        symptomListTemplate: "#symptom-list-template",
        symptomSelect: "#symptom-select",
        symptomSelectTemplate: "#symptom-select-template",
        unselectedSymptoms: '#symptom-list button:not(".selected-true")',
        sideScrollContainer: ".side-scroll-container"
      },
      w = $(b.mainScope),
      _ = 8,
      k = 3,
      x = "/salesforce/api/v1/kb/" + document.documentElement.lang.toLowerCase().replace("-", "_"),
      E = {
        master: {},
        activeFilters: {
          products: ["all"],
          symptom: "top_articles"
        },
        articleListLength: _,
        debug: !1
      },
      C = w.data("all"),
      S = w.find(b.symptomListTemplate).html(),
      T = f.compile(S),
      j = w.find(b.symptomSelectTemplate).html(),
      L = f.compile(j),
      A = w.find(b.articleListTemplate).html(),
      O = f.compile(A),
      P = w.find(b.errorTemplate).html(),
      N = g.parseQuery(window.location.search.substr(1)),
      I = matchMedia("(min-width:768px)"),
      M = w.find(b.listOfArticles),
      D = w.find(b.symptomSelect),
      R = w.find(b.symptomList);
    e.exports = {
      init: function () {
        w.length && (r("start()"), w.on(y.renderArticles, function () {
          r("renderArticles()");
          var t = o().fullyFiltered.splice(0, E.articleListLength),
            e = O({
              articles: t,
              debug: E.debug
            });
          M.html(e), w.trigger(y.updateShowMore)
        }), w.on(y.renderSymptoms, function () {
          r("renderSymptoms()");
          var t = function (t) {
              var e;
              r("getFilteredSymptoms(articles)");
              var n = E.master.symptoms,
                o = (e = []).concat.apply(e, i(t.map(function (t) {
                  return t.symptoms
                }))).simplify(),
                a = n.filter(function (t) {
                  return o.includes(t.key)
                });
              if (!o.includes(E.activeFilters.symptom)) {
                try {
                  E.activeFilters.symptom = a[0].key
                } catch (t) {
                  w.trigger(y.error)
                }
                w.trigger(y.renderArticles)
              }
              return a.forEach(function (t) {
                t.selected = t.key === E.activeFilters.symptom
              }), a
            }(o().filteredByProducts),
            e = T({
              symptoms: t
            });
          R.html(e);
          var n = L({
            symptoms: t
          });
          D.html(n)
        }), w.on(y.updateShowMore, function () {
          r("updateShowMore()"), o().fullyFiltered.length <= E.articleListLength ? w.find(b.seeMoreButton).hide() : w.find(b.seeMoreButton).show()
        }), w.on(y.updateProducts, function () {
          r("updateProductClasses()"), w.find(b.productFilterButton).each(function (t, e) {
            E.activeFilters.products.includes(e.value) ? e.classList.add("selected") : e.classList.remove("selected")
          })
        }), w.on(y.updateProductList, function () {
          var t;
          r("updateProductList()");
          var e = (t = []).concat.apply(t, i(E.master.articles.map(function (t) {
            return t.products
          }))).simplify();
          r(e), w.find(b.productFilterButton).each(function (t, n) {
            e.includes(n.value) || "all" === n.value || $(n).remove()
          }), w.find(b.productFilterButton).length < 3 && w.find(b.productFilter).remove(), w.trigger(y.setupProductFilterScroller)
        }), w.on(y.error, s), w.on(y.error, l), w.on(y.setupProductFilterScroller, function () {
          r("setupProductFilterScroller()"), v.update()
        }), w.on(y.resetShowMore, function () {
          r("resetShowMore()"), E.articleListLength = _, w.trigger(y.renderArticles)
        }), w.on("debug", function () {
          console.info(E)
        }), w.on("click", b.seeMoreButton, function () {
          r("seeMore()"), E.articleListLength += k, w.trigger(y.renderArticles)
        }), w.on("change", b.symptomSelect, u), w.on("click", b.unselectedSymptoms, u), w.on("click", b.productFilterButton, function () {
          r("updateProductFilter(evt)");
          var t = this.value;
          E.activeFilters.products.remove("all"), "all" === t ? E.activeFilters.products = ["all"] : E.activeFilters.products.includes(t) ? E.activeFilters.products.remove(t) : E.activeFilters.products.push(t), E.activeFilters.products.length || (E.activeFilters.products = ["all"]), w.trigger(y.renderArticles), w.trigger(y.renderSymptoms), w.trigger(y.updateProducts)
        }), w.on("click", function () {
          r("- click -")
        }), I.addListener(d), c(), d(), r("setupAnalytics()"), w.one(y.renderArticles, p), w.on("click", b.productFilterButton + ", " + b.symptomList + " button", p), w.on("change", b.symptomSelect, p), w.on("click", b.seeMoreButton, function () {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "support",
            gaAction: h(),
            gaLabel: E.activeFilters.symptom.replace(/_/g, " ") + " load more"
          })
        }), w.on("click", "a.article", function (t) {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "support",
            gaAction: h(),
            gaLabel: E.activeFilters.symptom.replace(/_/g, " ") + " " + (Number(t.target.dataset.index) + 1)
          })
        }), v.init())
      }
    }
  }, {
    "../../_modules/query_utils": 92,
    "../../_modules/side-scroll-controller": 94,
    "../../nest-app-cookie": 234,
    handlebars: 39
  }],
  294: [function (t, e, n) {
    "use strict";
    var i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (t) {
        return typeof t
      } : function (t) {
        return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
      },
      r = t("../_modules/query_utils"),
      o = t("nl-modal"),
      a = t("../nest-app-cookie");
    e.exports = function () {
      var t, e, n, s, l = this,
        c = window.__chat__,
        u = null,
        d = document.documentElement.lang.replace(/\-/g, "_"),
        h = null,
        p = !1,
        f = new function () {
          var t = [];
          this.scope = l, this.add = function (e) {
            t.push(e)
          }, this.runFirst = function () {
            t.length > 0 && (t[0].apply(this.scope), t = [])
          }.bind(this)
        },
        m = [],
        g = [],
        v = 0,
        y = new Event("chat-available"),
        b = new Event("chat-unavailable"),
        w = $("body"),
        _ = $(".chat-session-container"),
        k = _.find('> [data-id="offline-message"]'),
        x = $("[chat-show=online]"),
        E = $("[chat-show=offline]"),
        C = function (t) {
          p && console.debug(t)
        },
        S = function () {
          j(), L(), C("dispatch unavailable event"), document.dispatchEvent(b)
        },
        T = function () {
          g.forEach(function (t) {
            jQuery.contains(document, $(t.selector)[0]) && $(t.selector).replaceWith(t.script)
          })
        },
        j = function () {
          m.forEach(function (t) {
            jQuery.contains(document, $(t.selector)[0]) && $(t.selector).replaceWith(t.script)
          })
        },
        L = function () {
          g.forEach(function (t, e) {
            $("script#chat-is-offline-" + e).replaceWith(t.element), $(t.selector).show()
          })
        },
        A = function () {
          m.forEach(function (t, e) {
            $("script#chat-is-online-" + e).replaceWith(t.element), $(t.selector).show()
          })
        },
        O = function (t) {
          switch (C(t), t) {
            case liveagent.BUTTON_EVENT.BUTTON_AVAILABLE:
              h = !0, P(), T(), A(), C("dispatch available event"), document.dispatchEvent(y), Date.now() - v > 100 && (location.pathname.indexOf("support/contact-us") >= 0 && dataLayer.push({
                event: "gaEvent",
                gaCategory: "support",
                gaAction: "support type",
                gaLabel: "chat available"
              }), C("chat available"), v = Date.now()), f.runFirst();
              break;
            case liveagent.BUTTON_EVENT.BUTTON_UNAVAILABLE:
              h = !1, S(), Date.now() - v > 100 && (location.pathname.indexOf("support/contact-us") >= 0 && dataLayer.push({
                event: "gaEvent",
                gaCategory: "support",
                gaAction: "support type",
                gaLabel: "chat unavailable"
              }), C("chat unavailable"), v = Date.now()), f.runFirst();
              break;
            case liveagent.BUTTON_EVENT.BUTTON_ACCEPTED:
            case liveagent.BUTTON_EVENT.BUTTON_REJECTED:
          }
          $("body").trigger("chat-ready", [h])
        },
        P = function () {
          u = liveagent.getSid(), n = SITE_URLS.www_url + "/prechatform/?sessionId=" + u + "&language=" + d + "&caseNumber=" + (e || ""), document.documentElement.classList.contains("app-torso-mode") && (n += "&app=true"), SITE_URLS.prechat_url = n
        },
        N = function () {
          null === h || void 0 === h ? f.add(N.bind(this)) : h ? void 0 !== n && null !== n && (H(), window.location = n) : I()
        }.bind(this),
        I = function () {
          dataLayer.push({
            event: "virtualPageView",
            page: "/support/chat/no-agents"
          });
          var t = document.createElement("div"),
            e = document.createElement("a");
          $(e).addClass("widget-close-button"), $(t).addClass("chat-offline-widget"), t.appendChild(e), t.appendChild(k[0]);
          var n = new o;
          n.el.appendChild(t), n.open();
          var i = function t() {
            n.close(), $(e).off("click", t)
          };
          n.on("should-close-modal", i), $(e).on("click", i), $(t).on("click", "a", function () {
            dataLayer.push({
              event: "gaEvent",
              gaCategory: "support",
              gaAction: "chat",
              gaLabel: "no agents - contact",
              page: "/support/chat/no-agents"
            })
          })
        },
        M = function (t) {
          try {
            t.preventDefault()
          } catch (t) {
            C("not an event")
          }(function (t) {
            return "object" === ("undefined" == typeof HTMLElement ? "undefined" : i(HTMLElement)) ? t instanceof HTMLElement : t && "object" === (void 0 === t ? "undefined" : i(t)) && null !== t && 1 === t.nodeType && "string" == typeof t.nodeName
          })(this) && (s = this, this.blur()), null === h || void 0 === h ? C("connection not established yet.") : h ? (C("online"), D()) : C("offline")
        },
        D = function () {
          void 0 !== n && null !== n && (H(), window.open(n))
        },
        R = function () {
          w.on("click", "[chat-button]", M), w.on("click", '[data-id="chat-session-close-button"]', this.close.bind(this))
        }.bind(this),
        H = function () {
          var t = $("#locale-root").attr("content"),
            e = JSON.stringify({
              localeRoot: t,
              caseCountry: c.caseCountry,
              caseLanguage: c.caseLanguage
            });
          $.cookie("nest-chat-root", e, {
            expires: 1,
            path: "/"
          })
        };
      this.setup = function () {
        if (f.scope = this, x.each(function (t, e) {
            $(e).attr("chat-selector", "online-" + t), m[t] = {
              element: e.outerHTML,
              script: '<script id="chat-is-online-' + t + '"><\/script>',
              selector: "[chat-selector=online-" + t + "]"
            }
          }), E.each(function (t, e) {
            $(e).attr("chat-selector", "offline-" + t), g[t] = {
              element: e.outerHTML,
              script: '<script id="chat-is-offline-' + t + '"><\/script>',
              selector: "[chat-selector=offline-" + t + "]"
            }
          }), j(), T(), t = r.parseQuery(window.location.search.substr(1)), Object.keys(t).forEach(function (n) {
            "debug" === n.toLowerCase() ? C("debugMode = " + (p = !0)) : "ccn" === n.toLowerCase() && (e = t[n], C("caseNumber = " + e)), C("query-parameters " + n + ":" + t[n])
          }), a.isInApp() && a.isAndroidApp()) return C("Jumping Ship - App parameter"), S();
        R(),
          function t() {
            C("initLiveAgent"), window._laq || (window._laq = []);
            try {
              window._laq.push(function () {
                liveagent.showWhenOnline(c.chatButtonID, document.getElementById("chat-is-online")), liveagent.showWhenOffline(c.chatButtonID, document.getElementById("chat-is-offline"))
              }), p && liveagent.enableLogging(), liveagent.addButtonEventHandler(c.chatButtonID, O.bind(this)), liveagent.init("https://" + c.chatInitHost + "/chat", c.chatDeploymentID, c.chatOrgID)
            } catch (e) {
              C(e), S(), document.getElementById("liveagent-deployment-script").addEventListener("load", t.bind(this))
            }
          }(), e && N()
      }.bind(this), this.startChat = function () {
        M()
      }, this.close = function () {
        _.removeClass("up"), _.height(0)
      }
    }
  }, {
    "../_modules/query_utils": 92,
    "../nest-app-cookie": 234,
    "nl-modal": 50
  }],
  295: [function (t, e, n) {
    "use strict";
    $(".contact-options");
    e.exports = {
      init: function () {
        $("body").on("click", "section.faq-disclosures .disclosure:not(.active) a[data-analytics-category]", function () {
          var t = $(this).attr("data-analytics-category");
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "support",
            gaAction: "contact us page categories",
            gaLabel: t
          })
        }), $("body").on("click", "section.faq-disclosures .disclosure div a", function () {
          var t, e = $(this).parents(".disclosure").find("a[data-analytics-category]").attr("data-analytics-category"),
            n = this.href;
          if (n.includes("#")) t = n.substr(n.indexOf("#"));
          else {
            var i = function (t) {
              var e = [];
              return n.split("/").forEach(function (t) {
                null !== t && "" !== t && e.indexOf(t) < 0 && e.push(t)
              }), e
            }();
            t = i[i.length - 1]
          }
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "support",
            gaAction: "contact us page links",
            gaLabel: e + " : " + t
          })
        }), "" !== window.location.hash && $('.faq-disclosures [href="' + location.hash + '"]').trigger("click")
      }
    }
  }, {}],
  296: [function (t, e, n) {
    "use strict";
    var i = t("../core_modules").analytics,
      r = t("./web_to_case_form");
    n.init = function () {
      r.setCallbacks({
        submit: function () {
          var t = $("#00N40000002RvUz").val(),
            e = $("#subject").val();
          dataLayer.push({
            dimSupportFormSubmit: "yes",
            metSupportFormSubmit: 1,
            dimSupportCat1: t,
            dimSupportCat2: e
          }), i.trackEvent({
            gtm: {
              event: "gaEvent",
              gaCategory: "Contact Us Form",
              gaAction: t,
              gaLabel: e
            }
          })
        },
        error: function (t) {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "support_email-us",
            gaAction: "form-submission-error",
            gaLabel: t.status + "\n\n" + t.statusText,
            page: window.location.pathname
          })
        },
        success: function () {},
        always: function () {}
      }), r.init("#email-support-form")
    }
  }, {
    "../core_modules": 194,
    "./web_to_case_form": 304
  }],
  297: [function (t, e, n) {
    "use strict";

    function i() {
      $(this).removeClass("error"), $(this).siblings(".message").removeClass("visible")
    }
    var r = t("../../core_modules").validator;
    n.init = function () {
      var t = $("#email");
      t.length > 0 && function (t) {
        t.on("keyup focus", i), t.on("blur", function () {
          r.isValidEmail($(this).val()) || i()
        })
      }(t)
    }
  }, {
    "../../core_modules": 194
  }],
  298: [function (t, e, n) {
    "use strict";
    e.exports = {
      init: function () {
        $("body").on("click", ".status-bar a", function () {
          var t = $(this).data("analytics-id");
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "support",
            gaAction: "system status",
            gaLabel: "open - " + t
          })
        }), $("body").on("click", ".product-tiles a", function () {
          var t = $(this).data("analytics-id");
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "support",
            gaAction: "get help",
            gaLabel: t
          })
        }), $("body").on("click", ".index-contact-footer a", function () {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "support",
            gaAction: "contact support",
            gaLabel: "support home"
          })
        })
      }
    }
  }, {}],
  299: [function (t, e, n) {
    "use strict";
    var i = t("nl-client");
    t("../_includes/fmt").init();
    e.exports = function () {
      this.isRequired = !0, this.value = null, this.opts = {}, this._runLoop = function () {
        var t = this.value,
          e = document.getElementById("g-recaptcha-response");
        this.value = null !== e ? e.value : null, t !== this.value && $(this).trigger("recaptcha-value-changed")
      }.bind(this), this._setupCaptcha = function () {
        if (this.isRequired) {
          $("#captcha").remove();
          var t = document.createElement("script");
          t.id = "captcha", t.src = "https://www.google.com/recaptcha/api.js?hl=%@1".fmt(i.language), $("body").append(t), window.setInterval(this._runLoop, 400)
        }
        $(this).trigger("recaptcha-initialized")
      }, this.init = function (t) {
        this.opts = t, $.ajax({
          type: "GET",
          headers: {
            "X-ReqType": t.reqType
          },
          url: "/salesforce/api/needs-captcha/",
          error: function () {
            this.isRequired = !0
          }.bind(this),
          success: function (t) {
            this.isRequired = Boolean(t)
          }.bind(this),
          complete: function () {
            this._setupCaptcha()
          }.bind(this)
        })
      }, this.requireCaptcha = function () {
        this.isRequired = !0, this._setupCaptcha()
      }
    }
  }, {
    "../_includes/fmt": 62,
    "nl-client": 42
  }],
  300: [function (t, e, n) {
    "use strict";
    t("../_includes/fmt").init();
    Array.prototype.clean = function (t) {
      for (var e = 0; e < this.length; e++) this[e] == t && (this.splice(e, 1), e--);
      return this
    }, e.exports = {
      init: function () {
        this.updateLocaleSelect(), document.getElementById("widget-name").onchange = this.inputWatcher.bind(this), document.getElementById("locale-select").onchange = this.inputWatcher.bind(this), document.getElementById("embed-select").onchange = this.inputWatcher.bind(this), document.getElementById("gen-select").onchange = this.inputWatcher.bind(this), document.getElementById("referrer").onchange = this.inputWatcher.bind(this), $("body").on("keyup", "[required]", this.requiredInputWatcher.bind(this)), $("#reseller form").on("submit", function (t) {
          t.preventDefault(), this.updateScript()
        }.bind(this)), this.checkRequired(), this.updateScript(), window.addEventListener("orientationchange", function () {
          this.updateScript()
        }.bind(this))
      },
      data: {
        locale: "en-US",
        embedType: "embedded",
        referrer: "acme-corp",
        path: "compatibility",
        widgetName: "compatibility",
        generation: ""
      },
      checkRequired: function () {
        return $("body [required]").each(this.requiredInputWatcher), $("[required].error").length > 0
      },
      inputWatcher: function (t) {
        var e = t.target.value,
          n = t.target.attributes["data-name"].value;
        "referrer" === n && (e = e.trim().replace(/[A-Z \*<>;]/g, function (t, e) {
          return t.match(/[A-Z]/) ? (0 !== e ? "-" : "") + t.trim().toLowerCase() : ""
        })), this.data[n] = e, "widgetName" === n && this.updateLocaleSelect(), this.updateScript()
      },
      updateLocaleSelect: function () {
        var t = document.getElementById("locale-select");
        t.onchange = null, t.innerHTML = "";
        var e = localeMap[this.data.widgetName];
        Object.keys(e).forEach(function (n) {
          var i = document.createElement("option");
          i.value = n, i.textContent = e[n].label, t.appendChild(i)
        }), this.data.locale = "en-US", t.onchange = $.proxy(this.inputWatcher, this)
      },
      buildQueryParams: function () {
        var t = Array.prototype.slice.call(arguments);
        return t.clean(""), "?" + t.join("&")
      },
      updateScript: function () {
        if (this.checkRequired()) return this.previewSection.className = "", this.scriptSection.innerText = "", this.scriptSection.textContent = "", void(this.previewSection.innerHTML = "");
        var t = localeMap[this.data.widgetName][this.data.locale],
          e = this.localeRoot.fmt(t.root),
          n = this.referrerString.fmt(this.data.referrer),
          i = "" === this.data.generation ? "" : this.modeString.fmt(this.data.generation),
          r = this.buildQueryParams(n, i),
          o = this.widgetURL.fmt(e, t.path, r),
          a = void 0,
          s = 800,
          l = 500;
        "compatibility" === this.data.widgetName && ["en-US", "en-CA", "fr-CA"].includes(this.data.locale) ? $("#reseller").removeClass("hide-generation") : $("#reseller").addClass("hide-generation"), "compatibility" === this.data.widgetName && ["en-US", "en-CA", "fr-CA", "es-MX"].includes(this.data.locale) && (l = 600), "calculator" === this.data.widgetName && (s = 900, l = 760), "embedded" === this.data.embedType ? (a = this.inlineScript.fmt(l, s, o), this.previewSection.className = "embed " + this.data.widgetName) : (a = this.popupScript.fmt(o, s, l, t.helperText), this.previewSection.className = ""), this.scriptSection.innerText = a, this.scriptSection.textContent = a, this.previewSection.innerHTML = a
      },
      requiredInputWatcher: function () {
        "" === this.value ? $(this).addClass("error") : $(this).removeClass("error")
      },
      localeOptionTag: '<option value="%@1">%@2</option>',
      scriptSection: document.getElementById("the-code"),
      previewSection: document.getElementById("testing-ground"),
      widgetURL: "https://" + window.location.hostname + "%@1widget/%@2/%@3",
      localeRoot: "%@1/",
      referrerString: "referrer=%@1",
      modeString: "mode=%@1",
      popupScript: "<a href=\"javascript:;\" onClick=\"javascript: window.open('%@1','','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=%@2,height=%@3');\">%@4</a>",
      inlineScript: '<div style="height:%@1px; max-width:%@2px"><iframe src="%@3" frameborder="0" height="100%" width="100%"></iframe></div>'
    }
  }, {
    "../_includes/fmt": 62
  }],
  301: [function (t, e, n) {
    "use strict";
    t("../../core_modules").utilities;
    var i = t("../../_modules/query_utils");
    e.exports = {
      init: function () {
        var t, e, n = i.parseQuery(window.location.search.substr(1)),
          r = $("section.smoke-alarm-learn-more"),
          o = n.articles,
          a = window.SITE_URLS;
        if (o) {
          if ((e = decodeURIComponent(o).split(/[\s,]+/)).length > 1) return e.forEach(function (t) {
            r.find("." + t).show()
          }), void r.removeClass("loading");
          t = a["support." + e[0]] || a["support.main"]
        } else t = a["support.main"];
        window.location.href = t
      }
    }
  }, {
    "../../_modules/query_utils": 92,
    "../../core_modules": 194
  }],
  302: [function (t, e, n) {
    "use strict";

    function i(t) {
      $("body").trigger("status-bar-ready", [t])
    }
    var r = "/salesforce/api/" + t("../core_modules").client.locale.toLowerCase().replace("-", "_"),
      o = $("#support-server-status"),
      a = o.parent(),
      s = "Normal",
      l = window.statusStrings;
    e.exports = {
      init: function () {
        $(".status-bar").length ? $.ajax({
          url: r + "/sfdc-status/current",
          dataType: "json",
          success: function (t) {
            t && t.status && (function (t) {
              l[t.toLowerCase()] && (t = l[t.toLowerCase()]), o.removeClass("normal").addClass("problem").html(t), a.attr("title", t)
            }(t.status), s = t.status), $(".status-bar a").data("analytics-id", s)
          }
        }).always(function () {
          i(s)
        }) : i("n/a")
      }
    }
  }, {
    "../core_modules": 194
  }],
  303: [function (t, e, n) {
    "use strict";
    Array.prototype.remove = function (t) {
      return this.filter(function (e) {
        return t.indexOf(e) < 0
      })
    };
    var i = t("./chat"),
      r = t("../_includes/fmt"),
      o = t("./status_bar");
    e.exports = {
      init: function () {
        r.init(),
          function () {
            function t() {
              void 0 === n && (n = $("#topics-list a.topic.selected").data("api-name").replace(/[_-]+/g, " "))
            }
            var e = ("//" + window.location.hostname + window.location.pathname + "/").replace(SITE_URLS["support.main"], "");
            e = e.replace(/\/+$/, "");
            var n;
            $("body").on("submit", "#search-form", function (t) {
              var n = $(this).find('input[name="q"]').val();
              "" === e ? dataLayer.push({
                event: "gaEvent",
                gaCategory: "sitewide search",
                gaAction: "support homepage",
                gaLabel: n
              }) : e.includes("article") || dataLayer.push({
                event: "gaEvent",
                gaCategory: "sitewide search",
                gaAction: "support category %@1".fmt(e),
                gaLabel: n
              })
            }), $("body.pdp").on("click", ".helpful-tools a", function (t) {
              var n = $(this).data("analytics-label");
              dataLayer.push({
                event: "gaEvent",
                gaCategory: "support",
                gaAction: "helpful tools %@1".fmt(e),
                gaLabel: n
              })
            }), $("body.pdp").on("click", "#topics-list a.topic", function (t) {
              n = $(this).data("api-name").replace(/[_-]+/g, " "), dataLayer.push({
                event: "gaEvent",
                gaCategory: "support",
                gaAction: "support categories %@1".fmt(e),
                gaLabel: n
              })
            }), $("body.pdp").on("click", "li.article a", function (i) {
              t();
              var r = 1 + $(this).data("index");
              dataLayer.push({
                event: "gaEvent",
                gaCategory: "support",
                gaAction: "support categories %@1".fmt(e),
                gaLabel: "%@1 %@2".fmt(n, r)
              })
            }), $("body").on("article-see-more", function () {
              t(), dataLayer.push({
                event: "gaEvent",
                gaCategory: "support",
                gaAction: "support categories %@1".fmt(e),
                gaLabel: "%@1 load more".fmt(n)
              })
            });
            var i = 0;
            $("body").on("click", ".contact-options [data-analytics-type]", function (t) {
              var e = $(this).data("analytics-type");
              "phone" === e && i++, i > 1 || dataLayer.push({
                event: "gaEvent",
                gaCategory: "support",
                gaAction: "support type",
                gaLabel: e
              })
            });
            var r, o, a, s = 0;
            void 0 === window.__chat__ && (a = "n/a"), $("body").on("status-bar-ready", function (t, e) {
              r = e
            }), $("body").on("chat-ready", function (t, e) {
              a = e
            }), $("body").on("status-bar-ready chat-ready", function (t) {
              if (void 0 !== r && void 0 !== a && 0 === s) {
                s++;
                var e = {
                  event: "virtualPageView"
                };
                "n/a" !== a && (a = a ? "yes" : "no", e.dimSupportChatAvailable = a), o = "no", e.dimSupportEmailAvailable = o, "n/a" !== r && (e.dimSupportSystemStatus = r), dataLayer.push(e)
              }
            })
          }(), o.init(), $("body").on("click", ".disclosure > a", function (t) {
            t.preventDefault();
            var e = $(this).parent();
            e.has("div").length > 0 && (Modernizr.touchevents ? e.find("> div").toggle() : e.find("> div").slideToggle(200), e.toggleClass("active"), e.find(".show-more-icon").toggleClass("show-less"))
          }), $("body").on("click", ".show-number", function (t) {
            t.preventDefault()
          }), $("body").on("click", ".show-number-trigger", function (t) {
            "#" === $(this).attr("href") && t.preventDefault(), $(this).find(".show-number").remove(), $(this).find(".hidden-number").show();
            var e = $(this).find(".hidden-number").attr("href"),
              n = $(this).find(".hidden-number").data("title");
            if (Modernizr.touchevents) $(this).attr("href", e), $(this).attr("title", n);
            else {
              $(this).removeClass("chevron"), $(this).find(".link").removeClass("link");
              var i = this.attributes,
                r = $(this),
                o = $("<span>");
              r.after(o.html(r.html())).remove();
              for (var a = 0; a < i.length; a++) o.attr(i[a].name, i[a].value);
              o.removeAttr("title")
            }
          }), $.ajax({
            url: "/salesforce/api/sfdchealthcheck",
            type: "GET",
            success: function () {
              document.documentElement.classList.remove("salesforce-is-down"), document.documentElement.classList.add("salesforce-is-up")
            },
            error: function () {
              document.documentElement.classList.add("salesforce-is-down"), document.documentElement.classList.remove("salesforce-is-up")
            }
          }), void 0 !== window.__chat__ && (new i).setup()
      }
    }
  }, {
    "../_includes/fmt": 62,
    "./chat": 294,
    "./status_bar": 302
  }],
  304: [function (t, e, n) {
    "use strict";

    function i() {
      var t = o.find(".required").map(function () {
        return "" !== this.value && !$(this).hasClass("error")
      });
      if (c.isRequired) {
        var e = document.getElementById("g-recaptcha-response");
        null !== e ? "" === $(e).val() ? t.push(!1) : t.push(!0) : t.push(!1)
      }
      a.prop("disabled", $.inArray(!1, t) >= 0)
    }
    var r, o, a, s, l = t("./includes/email"),
      c = new(t("./recaptcha"));
    e.exports = {
      init: function (t) {
        c.init({
            reqType: $(t).attr("action").indexOf("web/case") >= 0 ? "case" : "lead"
          }), r = t || "form", o = $(r), a = o.find("button"),
          function () {
            o.on("submit", function (t) {
              var e = {},
                n = {},
                i = o.attr("action");
              void 0 !== t && t.preventDefault(), s && s.submit && s.submit(), c.isRequired && null !== c.value && (n["X-Recaptcha"] = c.value), o.find("input, select, textarea").each(function (t, n) {
                e[n.name] = n.value
              }), $.ajax({
                type: "POST",
                url: i,
                contentType: "application/json; charset=utf-8",
                headers: n,
                data: JSON.stringify(e),
                success: function () {
                  s && s.success && s.success.apply(null, arguments), window.location = o.find('input[name="retURL"]').val()
                },
                error: function () {
                  c.requireCaptcha(), $(".error-message").addClass("visible"), s && s.error && s.error.apply(null, arguments)
                },
                complete: function () {
                  s && s.always && s.always.apply(null, arguments)
                }
              })
            }.bind(this))
          }(), i(), $("body").on("paste keyup change input", r + ' textarea[name="description"], ' + r + ' input[name="subject"]', function () {
            var t = $(this).parents("div.row").find("[data-char-limit]").data("char-limit"),
              e = $(this).val().length,
              n = t - e;
            n < 0 && (n = 0), $(this).parents("div.row").find(".char-count")[0].innerHTML = n, setTimeout(function () {
              this.value = this.value.substring(0, t)
            }.bind(this), 100)
          }), l.init(), window.setInterval(function () {
            i()
          }, 400)
      },
      setCallbacks: function (t) {
        s = t
      }
    }
  }, {
    "./includes/email": 297,
    "./recaptcha": 299
  }],
  305: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("./core_modules").validator;
    e.exports = {
      isInvalid: !1,
      form: document.getElementById("thank-firefighters-form"),
      requiredFields: function () {
        return this.form.getElementsByClassName("required")
      },
      submitForm: function (t) {
        if (t.preventDefault(), t.stopPropagation(), this.validate(), this.isInvalid) {
          var e = this.form.getElementsByClassName("error")[0];
          $("html,body").animate({
            scrollTop: e.offsetTop
          }, 500)
        } else {
          $(".submit").addClass("clip-fadeOutDown"), $(".submitting").addClass("clip-fadeInDown");
          var n = $(this.form);
          $.ajax({
            contentType: "text/plain;charset=UTF-8",
            url: n.attr("action"),
            type: "POST",
            data: JSON.stringify(this.data()),
            success: this.success.bind(this)
          })
        }
      },
      data: function () {
        return {
          locale__c: this.form.locale__c.value,
          zip__c: this.form.zip__c.value,
          description__c: this.form.description__c.value,
          name__c: this.form.name__c.value,
          email__c: this.form.email__c.value
        }
      },
      success: function () {
        this.clearForm(), $(".ie9")[0] ? ($(".thanks-message").addClass("visible"), setTimeout(function () {
          $(".thanks-message").removeClass("visible")
        }, 3e3)) : setTimeout(function () {
          $(".submitting").removeClass("clip-fadeInDown").addClass("clip-fadeOutDown"), $(".thank-you").addClass("clip-fadeInDown"), setTimeout(function () {
            $(".thank-you").removeClass("clip-fadeInDown").addClass("clip-fadeOutDown"), $(".submit").removeClass("clip-fadeOutDown").addClass("clip-fadeInDown"), setTimeout(function () {
              $(".clip-fadeOutDown").removeClass("clip-fadeOutDown"), $(".clip-fadeInDown").removeClass("clip-fadeInDown")
            }, 1e3)
          }, 3e3)
        }, 1e3)
      },
      clearForm: function () {
        this.form.zip__c.value = "", this.form.name__c.value = "", this.form.description__c.value = "", this.form.email__c.value = ""
      },
      applyErrorMessage: function (t) {
        t.parentElement.className += " error"
      },
      resetErrorState: function (t) {
        var e = t.parentElement.className;
        t.parentElement.className = e.replace(/\s?error/, "")
      },
      validateInput: function (t) {
        var e = t.target;
        this.resetErrorState(e), (r.invalidEmail(e) || this.isNotChecked(e) && "agree" === e.name || r.invalidZip(e) || this.invalidInput(e)) && (this.isInvalid = !0, this.applyErrorMessage(e))
      },
      invalidInput: function (t) {
        return r.invalidInput(t) || $(t).attr("placeholder") === $(t).val()
      },
      validate: function () {
        this.isInvalid = !1, i.each(this.requiredFields(), function (t) {
          $(t).trigger("focusout")
        }.bind(this))
      },
      isNotChecked: function (t) {
        return t.attributes.type && "checkbox" === t.attributes.type.value && !t.checked
      },
      init: function () {
        this.form.addEventListener("submit", this.submitForm.bind(this)), i.each(this.requiredFields(), function (t) {
          $(t).on("focusout", this.validateInput.bind(this))
        }.bind(this))
      }
    }
  }, {
    "./core_modules": 194,
    underscore: 58
  }],
  306: [function (t, e, n) {
    "use strict";
    e.exports = {
      init: function () {
        ! function () {
          var e = t("underscore"),
            n = t("../_modules/incentives"),
            i = !1;
          if ($(".yes-rebate").length) {
            var r = $(".yes-rebate");
            n.get(function (t) {
              if (t.incentives && t.incentives.length) {
                var n = e.filter(t.incentives, function (t) {
                  return "Energy" === t.provides
                });
                if (n.length) {
                  var o = e.where(n, {
                    featured: !0
                  });
                  if (o.length) {
                    var a = o[0],
                      s = parseFloat(a.value),
                      l = a.provider.name,
                      c = 70 + s,
                      u = r.find("h1 .total-value"),
                      d = r.find("h2 .rebate-value"),
                      h = r.find("h2 .provider-name");
                    u.html(c), d.html(s), h.html(l), i = !0
                  }
                }
              }
              i ? $(".yes-rebate").addClass("is-visible") : $(".no-rebate").addClass("is-visible")
            })
          }
        }()
      }
    }
  }, {
    "../_modules/incentives": 78,
    underscore: 58
  }],
  307: [function (t, e, n) {
    "use strict";
    var i = t("../_modules/geotargeted-incentives-module"),
      r = (t("../core_modules").analytics, t("./google-home-mini-banner"));
    e.exports = {
      init: function () {
        i.init($(".promotion-banner")), $("body").on("click", ".buy-button", function (t) {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "navigation",
            gaAction: "go to store",
            gaLabel: t.target.getAttribute("ga-label")
          })
        }), $("body").on("click", ".key-link", function (t) {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "navigation",
            gaAction: "internal link",
            gaLabel: t.target.getAttribute("ga-label")
          })
        }), r.init()
      }
    }
  }, {
    "../_modules/geotargeted-incentives-module": 76,
    "../core_modules": 194,
    "./google-home-mini-banner": 308
  }],
  308: [function (t, e, n) {
    "use strict";
    var i = t("../_modules/footnote-tooltip");
    e.exports = {
      init: function () {
        var t = document.querySelector(".mini-promotion-2017-category");
        t && new i(t.querySelector(".nl-footnote-tooltip-root"))
      }
    }
  }, {
    "../_modules/footnote-tooltip": 75
  }],
  309: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("../core_modules"),
      o = t("../_modules/ui-controller"),
      a = (o.Timer, t("../_modules/tabs")),
      s = r.client.isMobile;
    t("../_modules/utilities/section-toggler").setCtrlModelEnableStatusToggler;
    e.exports = function () {
      function t() {
        if (!c.matches || s) return function () {
          e && clearInterval(e);
          var t = r.index(r.filter(".active")) || 0;
          e = setInterval(function () {
            t = t === r.length - 1 ? 0 : t + 1, r.removeClass("active").eq(t).addClass("active"), l.removeClass("active").eq(t).addClass("active")
          }, 4e3)
        }();
        e && clearInterval(e)
      }
      $("#hero");
      var e, n = $(".slide-thermostat .product-background"),
        r = n.children("li"),
        l = $("#thermostats-colors-tab-controls").children("li"),
        c = window.matchMedia("(min-width:768px)"),
        u = o.Model.create({
          count: l.length
        });
      a.PanelView.create(u, {
        elements: {
          container: n,
          panels: r
        }
      }), o.View.Index.create(u, {
        elements: l
      }), t(), $(window).on("resize", i.debounce(t, 500))
    }
  }, {
    "../_modules/tabs": 95,
    "../_modules/ui-controller": 100,
    "../_modules/utilities/section-toggler": 110,
    "../core_modules": 194,
    underscore: 58
  }],
  310: [function (t, e, n) {
    "use strict";
    t("underscore"), t("../core_modules").analytics;
    var i = t("../_modules/ui-controller"),
      r = t("../_modules/tabs"),
      o = t("./hero-gallery"),
      a = t("./products-shelf"),
      s = t("./google-home-mini-banner"),
      l = t("./boxing-day-promo-2017");
    e.exports = {
      init: function () {
        i.init(), r.init(), s.init(), l.init(), o(), $("body").on("click", ".key-link", function (t) {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "navigation",
            gaAction: "internal link",
            gaLabel: t.target.getAttribute("ga-label")
          })
        }), a.init()
      }
    }
  }, {
    "../_modules/tabs": 95,
    "../_modules/ui-controller": 100,
    "../core_modules": 194,
    "./boxing-day-promo-2017": 306,
    "./google-home-mini-banner": 308,
    "./hero-gallery": 309,
    "./products-shelf": 334,
    underscore: 58
  }],
  311: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  312: [function (t, e, n) {
    "use strict";
    var i = t("../../../_modules/footnote-tooltip");
    e.exports = function () {
      window.ticker = new function (t) {
        var e = this;
        (t = t || {}).start = t.start || {}, t.start.date = t.start.date || new Date(2017, 2, 31, 24), t.start.kwh = t.start.kwh || 12736465399, t.end = t.end || {}, t.end.date = t.end.date || new Date(2017, 3, 30, 24), t.end.kwh = t.end.kwh || 13131400078, t.seasonalDerating = void 0 === t.seasonalDerating ? .75 : t.seasonalDerating;
        var n = new Date(t.start.date),
          i = t.start.kwh,
          r = new Date(t.end.date),
          o = t.end.kwh,
          a = t.seasonalDerating,
          s = (o - i) / (r - n),
          l = Array.prototype.slice.call(document.querySelectorAll(".ticker .digit"));
        this.init = function () {
          l.length && (e.tickerInterval = setInterval(c, 250))
        }, this.getCurrentKwh = function () {
          var t = (new Date - n) * s * a;
          return Math.round(i + t).toString()
        };
        var c = function () {
          var t = e.getCurrentKwh();
          l.forEach(function (e, n) {
            e.dataset.number = e.innerHTML = t[n]
          })
        };
        this.init()
      }({
        start: {
          date: new Date(Date.UTC(2018, 0, 1, 0)),
          kwh: 17480472973
        },
        end: {
          date: new Date(Date.UTC(2018, 1, 1, 0)),
          kwh: 18848322654
        },
        seasonalDerating: 1
      });
      var t = document.querySelectorAll("#energy-ticker .nl-footnote-tooltip-root");
      t.length && new i(t[0])
    }
  }, {
    "../../../_modules/footnote-tooltip": 75
  }],
  313: [function (t, e, n) {
    "use strict";
    var i = t("../../../core_modules").elementWatcher;
    e.exports = function () {
      var t = $("#farsight");
      i.add({
        element: t,
        enter: function () {
          t.addClass("is-visible")
        }
      })
    }
  }, {
    "../../../core_modules": 194
  }],
  314: [function (t, e, n) {
    "use strict";

    function i() {
      var t;
      s.style.cssText = "", l.style.cssText = "", window.matchMedia("(max-width: 767px)").matches || (t = Math.max(s.clientHeight, l.clientHeight), s.style.height = t + "px", l.style.height = t + "px")
    }
    var r = t("underscore"),
      o = t("../../../core_modules").elementWatcher,
      a = document.getElementById("follow-the-leaf"),
      s = a.querySelector(".follow-leaf"),
      l = a.querySelector(".see-your-savings");
    e.exports = function () {
      o.add({
        element: a,
        callback: function () {
          var t = a.querySelector(".nl-gallery");
          a.classList.add("is-visible"), t && t.setAttribute("data-auto", "true")
        }
      }), i(), $(window).resize(r.debounce(i, 50))
    }
  }, {
    "../../../core_modules": 194,
    underscore: 58
  }],
  315: [function (t, e, n) {
    "use strict";
    var i = t("../../../_modules/geotargeted-incentives-module");
    e.exports = function () {
      i.init($(".promotion-banner"))
    }
  }, {
    "../../../_modules/geotargeted-incentives-module": 76
  }],
  316: [function (t, e, n) {
    "use strict";
    var i = t("../../../core_modules").analytics,
      r = t("../../../_modules/tabs"),
      o = t("../../../_modules/ui-controller"),
      a = t("./control-your-hot-water"),
      s = t("./follow-the-leaf"),
      l = t("./nest-home"),
      c = t("./saves-energy"),
      u = t("./energy-ticker"),
      d = t("./open-therm"),
      h = t("./your-home-is-safe"),
      p = t("./farsight"),
      f = t("./hero"),
      m = t("./ring-for-every-home"),
      g = t("./your-life-with-nest"),
      v = t("../../boxing-day-promo-2017");
    e.exports = {
      init: function () {
        o.init(), r.init(), v.init(), i.trackEvent(".thermostat-hero-incentive-link", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "navigation",
              gaAction: "mid-page",
              gaLabel: "find incentives"
            }
          }), i.trackEvent(".promotion-banner .incentives a", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "partners",
              gaAction: "incentive meet therm",
              gaLabel: "find rebates top"
            }
          }), i.trackEvent(".bring-home .buy-now", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "navigation",
              gaAction: "go to store",
              gaLabel: "buy now bottom thermostat"
            }
          }), i.trackEvent("#nest-home-tab-controls .protect", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "a nest home module",
              gaLabel: "protect"
            }
          }), i.trackEvent("#nest-home-tab-controls .nestcam", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "a nest home module",
              gaLabel: "nestcam"
            }
          }), i.trackEvent("#nest-home-tab-controls .wwn", "click", {
            gtm: {
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "a nest home module",
              gaLabel: "works with nest"
            }
          }),
          function () {
            var e = t("../../../_modules/footnote-tooltip"),
              n = document.querySelector(".mini-promotion-2017"),
              i = document.querySelector(".yes-rebate");
            document.querySelector(".no-rebate"), n && new e(n.querySelector(".nl-footnote-tooltip-root")), i && new e(i.querySelector(".nl-footnote-tooltip-root"))
          }(), a(), u(), p(), s(), f(), d(), m(), c(), h(), g(), l()
      }
    }
  }, {
    "../../../_modules/footnote-tooltip": 75,
    "../../../_modules/tabs": 95,
    "../../../_modules/ui-controller": 100,
    "../../../core_modules": 194,
    "../../boxing-day-promo-2017": 306,
    "./control-your-hot-water": 311,
    "./energy-ticker": 312,
    "./farsight": 313,
    "./follow-the-leaf": 314,
    "./hero": 315,
    "./nest-home": 317,
    "./open-therm": 318,
    "./ring-for-every-home": 319,
    "./saves-energy": 320,
    "./your-home-is-safe": 321,
    "./your-life-with-nest": 324
  }],
  317: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  318: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  319: [function (t, e, n) {
    "use strict";
    var i = t("../../../_modules/expand-gallery");
    e.exports = function () {
      document.getElementById("ring-gallery") && (window.RingGallery = new i("#ring-gallery", {
        aspectRatioLarge: .5625,
        aspectRatioSmall: 1,
        image0: {
          scaleLarge: 2,
          topLarge: "-33%",
          leftLarge: "-71%",
          scaleSmall: .9,
          topSmall: "-52%",
          leftSmall: "18%"
        },
        image1: {
          topLarge: "-30%",
          leftLarge: "-5%",
          scaleSmall: .75,
          topSmall: "-9%"
        },
        image2: {
          scaleLarge: 1.3,
          topLarge: "-11%",
          leftLarge: "14%",
          scaleSmall: .75,
          topSmall: "16%",
          leftSmall: "28%"
        },
        image3: {
          scaleLarge: 1.8,
          topLarge: "-89%",
          leftLarge: "-4%",
          scaleSmall: .75,
          topSmall: "69%",
          leftSmall: "4%"
        }
      }))
    }
  }, {
    "../../../_modules/expand-gallery": 74
  }],
  320: [function (t, e, n) {
    "use strict";
    var i = t("../../../_modules/footnote-tooltip"),
      r = t("nl-element-watcher"),
      o = document.getElementById("saves-energy");
    e.exports = function () {
      r.add({
        element: o,
        callback: function () {
          o.classList.add("is-visible")
        },
        offset: .5 * Math.min(window.innerHeight, o.getBoundingClientRect().height),
        persist: !1
      }), new i(o.querySelector(".nl-footnote-tooltip-root"))
    }
  }, {
    "../../../_modules/footnote-tooltip": 75,
    "nl-element-watcher": 45
  }],
  321: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  322: [function (t, e, n) {
    "use strict";
    var i = 500,
      r = t("underscore"),
      o = t("velocity-animate");
    e.exports = {
      fadeOverlay: function (t, e, n) {
        "function" == typeof n && n(), e.style.zIndex = 2, o(e, {
          opacity: 1
        }, {
          duration: i,
          complete: function () {
            e.style.zIndex = 1, void 0 !== t && (t.style.zIndex = 0, t.style.opacity = 0)
          }
        })
      },
      switchActiveVideo: function (t, e) {
        e.play(!0), r.isEmpty(t) || t.pause()
      }
    }
  }, {
    underscore: 58,
    "velocity-animate": 59
  }],
  323: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("velocity-animate"),
      o = t("../../../../_modules/ui-controller"),
      a = t("../../../../_modules/nl_media"),
      s = t("../../../../core_modules"),
      l = s.elementWatcher,
      c = s.analytics,
      u = s.client,
      d = t("event-emitter/all-off"),
      h = t("./size-manager"),
      p = t("./pin-position-manager"),
      f = t("./scene-position-manager"),
      m = t("./animation-utilities");
    e.exports = function () {
      function t() {
        q.css("height", _.get("viewportHeight")), M.css("height", 1.5 * M.outerHeight())
      }

      function e(t) {
        var e = "-" + N.css("padding-left");
        "destroy" === t && (e = 0), M.css("transform", "translateX(" + e + ")")
      }

      function n(t) {
        L.css(t ? {
          top: "auto",
          bottom: 0
        } : {
          top: 0,
          bottom: "auto"
        })
      }

      function s() {
        j.addClass(E), B && (c.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "your life with nest module",
            gaLabel: "start"
          }
        }), B = !1)
      }

      function g() {
        j.removeClass(E), V && (c.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "your life with nest module",
            gaLabel: "finish"
          }
        }), V = !1)
      }

      function v(t) {
        var e = {
          opacity: 1,
          translateZ: 0
        };
        "hide" === t && (e.opacity = 0), r(A, "stop"), r(A, e, {
          duration: 250,
          easing: "linear"
        })
      }

      function y(t) {
        var e = I[S],
          n = {
            opacity: 1
          },
          i = {
            duration: 250,
            easing: "linear",
            delay: 150
          };
        "hide" === t && (n.opacity = 0, i.delay = 0), r(e, "stop"), r(e, n, i)
      }

      function b(t) {
        var e = t.indexFrom,
          n = t.indexTo;
        ! function (t, e) {
          var n = D[t],
            i = D[e],
            r = H[t] || {},
            o = H[e];
          u.isSafari && o.el.addEventListener("ended", function t(e) {
            o.el.removeEventListener("ended", t), o.el.currentTime = o.el.duration - .1
          });
          m.fadeOverlay(n, i, function () {
            m.switchActiveVideo(r, o)
          })
        }(e, n),
        function (t, e) {
          if (!(3 === t && 4 === e || 4 === t && 3 === e)) {
            4 === t && (t = 3), 4 === e && (e = 3);
            var n = O[t],
              i = O[e],
              r = P[t] || {},
              o = P[e];
            u.isSafari && o.el.addEventListener("ended", function t(e) {
              o.el.removeEventListener("ended", t), o.el.currentTime = o.el.duration - .1
            }), m.fadeOverlay(n, i, function () {
              m.switchActiveVideo(r, o)
            })
          }
        }(e, n), n === S ? (v("hide"), y("show")) : e === S && (v("show"), y("hide"))
      }

      function w() {
        b({
          indexTo: x.getScene()
        }), T.setIndex(x.getScene())
      }
      var _, k, x, E = "is-active",
        C = "is-initialized",
        S = 4,
        T = o.Model.create({
          count: 5
        }),
        j = $("#your-life-with-nest"),
        L = j.find(".fixed-panel"),
        A = j.find(".sidebar"),
        O = A.find(".sidebar-thermostat-scene"),
        P = i.map(O.find("video"), a.init),
        N = j.find(".copy-container"),
        I = N.children("li"),
        M = I.eq(S),
        D = j.find(".background-video-scene"),
        R = D.find(".background-video"),
        H = i.map(R, a.init),
        F = I.find(".label"),
        q = L.add(I),
        B = !0,
        V = !0;
      _ = h.init(), k = p.init(j[0]), x = f.init(F), t(), e(), y("hide"), k.inPinRange() && s(), k.atBottom() && n(!0);
      var z = i.debounce(_.calculate, 100);
      return x.evaluate(), ! function () {
        var t = j[0].getBoundingClientRect();
        return t.top < window.innerHeight && t.bottom > 0
      }() ? l.add({
        element: j,
        callback: w
      }) : w(), window.addEventListener("resize", z), _.on("viewportHeightUpdated", function () {
        t(), k.evaluate(), x.evaluate()
      }), _.on("viewportWidthUpdated", e), k.on("shouldPin", s).on("shouldUnpin", g).on("shouldUnpin", n), x.on("sceneChanged", T.setIndex), T.on("changed", b), setTimeout(function () {
        j.addClass(C)
      }, 500), {
        destroy: function () {
          k.destroy(), x.destroy(), q.css("height", ""), e("destroy"), g(), A.removeAttr("style"), q.removeAttr("style"), D.removeAttr("style"), window.removeEventListener("resize", z), d(_), d(k), d(x), d(T), j.removeClass(C)
        }
      }
    }
  }, {
    "../../../../_modules/nl_media": 88,
    "../../../../_modules/ui-controller": 100,
    "../../../../core_modules": 194,
    "./animation-utilities": 322,
    "./pin-position-manager": 325,
    "./scene-position-manager": 326,
    "./size-manager": 327,
    "event-emitter/all-off": 22,
    underscore: 58,
    "velocity-animate": 59
  }],
  324: [function (t, e, n) {
    "use strict";
    var i = t("./desktop-no-touch");
    e.exports = function () {
      var t, e = window.matchMedia("(min-width:768px)");
      !Modernizr.touchevents && e.matches && (t = i()), e.addListener(function (e) {
        !e.matches || t || Modernizr.touchevents ? !e.matches && t && (t = t.destroy()) : t = i()
      })
    }
  }, {
    "./desktop-no-touch": 323
  }],
  325: [function (t, e, n) {
    "use strict";
    var i = {
      extend: t("event-emitter")
    };
    e.exports = {
      init: function (t) {
        function e() {
          var t = a.getBoundingClientRect();
          return t.top <= 0 && t.bottom >= window.innerHeight
        }

        function n() {
          return a.getBoundingClientRect().bottom <= window.innerHeight
        }

        function r() {
          !s && e() ? (o.emit("shouldPin"), s = !0) : s && !e() && (o.emit("shouldUnpin", n()), s = !1)
        }
        var o, a = t[0] || t,
          s = !1;
        return o = i.extend({
          inPinRange: e,
          atBottom: n,
          evaluate: r,
          destroy: function () {
            window.removeEventListener("scroll", r)
          }
        }), window.addEventListener("scroll", r), o
      }
    }
  }, {
    "event-emitter": 23
  }],
  326: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = {
        extend: t("event-emitter")
      };
    e.exports = {
      init: function (t) {
        function e() {
          var e = i.find(t, function (t) {
              var e = t.getBoundingClientRect(),
                n = e.height,
                i = e.top >= 0 - n,
                r = e.bottom <= window.innerHeight + n;
              return i && r
            }),
            r = i.indexOf(t, e);
          r < 0 && (r = t[0].getBoundingClientRect().top < 0 ? o : 0), a !== r && (a = r, n.emit("sceneChanged", r))
        }
        var n, o = t.length - 1,
          a = 0;
        return n = r.extend({
          getScene: function () {
            return a
          },
          evaluate: e,
          destroy: function () {
            window.removeEventListener("scroll", e)
          }
        }), window.addEventListener("scroll", i.debounce(e, 100)), n
      }
    }
  }, {
    "event-emitter": 23,
    underscore: 58
  }],
  327: [function (t, e, n) {
    "use strict";
    var i = {
      extend: t("event-emitter")
    };
    n.init = function () {
      var t, e = {
        viewportHeight: window.innerHeight,
        viewportWidth: window.innerWidth
      };
      return t = i.extend({
        get: function (t) {
          if (null != e[t]) return e[t];
          throw new Error('sizes["' + t + '"] cannot be found')
        },
        calculate: function () {
          ! function () {
            var n = window.innerHeight;
            e.viewportHeight !== n && (e.viewportHeight = n, t.emit("viewportHeightUpdated", n))
          }(),
          function () {
            var n = window.innerWidth;
            e.viewportWidth !== n && (e.viewportWidth = n, t.emit("viewportWidthUpdated", n))
          }()
        }
      })
    }
  }, {
    "event-emitter": 23
  }],
  328: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("../../_modules/ui-controller"),
      o = t("../../_modules/tabs"),
      a = t("../../_modules/tech-specs"),
      s = t("../../_modules/utilities/section-toggler").setSectionVisibilityToggler,
      l = t("./tech-specs/nest-sense"),
      c = t("./tech-specs/exploded-view"),
      u = t("../../core_modules").analytics;
    n.init = function () {
      r.init(), o.init(), document.getElementById("find-pro") && document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("find-pro").classList.add("is-visible")
      }), document.getElementById("installation-options") && function () {
        function t() {
          e || (function () {
              var t = $("#installation-options-tab-controls"),
                n = t.find(".pagination-item");
              e = r.create({
                model: {
                  count: 2
                },
                container: t,
                galleryArrows: {},
                indexView: {
                  elements: n
                }
              })
            }(), r.View.TouchSwipe.create(e, {
              element: $(".options-list")
            })),
            function () {
              var t = $(".options-list");
              n = o.PanelView.create(e, {
                elements: {
                  container: t,
                  panels: t.find("li")
                },
                style: "tallest"
              })
            }(), i.classList.add("init-tab-gallery")
        }
        var e, n, i = document.getElementById("installation-options"),
          a = window.matchMedia("(max-width:599px)");
        a.matches && t(), a.addListener(function () {
          a.matches && !n ? t() : !a.matches && n && (n.destroy(), n = null, i.classList.remove("init-tab-gallery"))
        })
      }(), s($("#energy-partners")), l(), u.trackEvent('a[href="#install-your-nest"]', "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "Videos",
          gaAction: "Start",
          gaLabel: "install the nest thermostat"
        }
      }), u.trackEvent('#hero a[href="#works/?mode=buy"]', "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "Compatibility Widget",
          gaAction: "opened from install-and-explore page",
          gaLabel: "marketing"
        }
      }), u.trackEvent('#hero a[href="#in-your-home"]', "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "In Your Home Widget",
          gaAction: "opened from install-and-explore page",
          gaLabel: "marketing"
        }
      }), u.trackEvent('.find-pro a[href="#pro"]', "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "Pro Finder Widget",
          gaAction: "opened from install-and-explore page",
          gaLabel: "marketing"
        }
      }), u.trackEvent(".bring-home-content .buy-now", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "navigation",
          gaAction: "go to store",
          gaLabel: "buy now bottom thermostat"
        }
      }), u.trackEvent(".tech-specs .button", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "tech specs",
          gaLabel: "Thermostat"
        }
      }), u.trackEvent("#energy-partners .cta a", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "navigation",
          gaAction: "mid-page",
          gaLabel: "energy partners"
        }
      }), u.trackEvent("#nest-sense .airwave", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest sense module",
          gaLabel: "airwave"
        }
      }), u.trackEvent("#nest-sense .sunblock", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest sense module",
          gaLabel: "sunblock"
        }
      }), u.trackEvent("#nest-sense .cool-to-dry", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest sense module",
          gaLabel: "cool to dry"
        }
      }), u.trackEvent("#nest-sense .early-on", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest sense module",
          gaLabel: "early on"
        }
      }), u.trackEvent("#nest-sense .radiant", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest sense module",
          gaLabel: "radiant"
        }
      }), u.trackEvent("#nest-sense .heat-pump", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest sense module",
          gaLabel: "heat pump"
        }
      }), u.trackEvent("#looks-out .safety-alerts", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest looks out for you module",
          gaLabel: "safety alerts"
        }
      }), u.trackEvent("#looks-out .furnace-heads-up", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest looks out for you module",
          gaLabel: "furnace heads up"
        }
      }), u.trackEvent("#looks-out .filter-reminders", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "nest looks out for you module",
          gaLabel: "filter reminders"
        }
      }), u.trackEvent("#explore-app .home-screen", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "explore the nest app module",
          gaLabel: "home screen"
        }
      }), u.trackEvent("#explore-app .schedule", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "explore the nest app module",
          gaLabel: "schedule"
        }
      }), u.trackEvent("#explore-app .away", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "explore the nest app module",
          gaLabel: "away"
        }
      }), u.trackEvent("#explore-app .advanced-home-control", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "site functions",
          gaAction: "explore the nest app module",
          gaLabel: "advanced home control"
        }
      }), c.init(), i.each($(".tech-specs"), function (t) {
        var e = $(t);
        a.init({
          toggleButton: e.find(".nl-button"),
          table: e.find(".tech-specs-table-wrapper")
        })
      })
    }
  }, {
    "../../_modules/tabs": 95,
    "../../_modules/tech-specs": 99,
    "../../_modules/ui-controller": 100,
    "../../_modules/utilities/section-toggler": 110,
    "../../core_modules": 194,
    "./tech-specs/exploded-view": 329,
    "./tech-specs/nest-sense": 331,
    underscore: 58
  }],
  329: [function (t, e, n) {
    "use strict";

    function i(t) {
      return JSON.parse(t.getAttribute("data-callout-coordinates"))
    }
    var r = t("nl-event-emitter"),
      o = t("nl-client"),
      a = t("../../../_modules/paged_list"),
      s = t("./localized-chapter-configs"),
      l = t("../../../_modules/binary-init-switch"),
      c = t("../../../_modules/nl-video-controller"),
      u = t("../../../_modules/page_index_controls"),
      d = t("../../../core_modules").analytics,
      h = function (t) {
        function e(t) {
          this.el = t;
          var e = function (t) {
            var e = $(this.el),
              n = $.Deferred();
            return o.supports.transition ? e.on("transitionend.view msTransitionEnd.view webkitTransitionEnd.view", function (t) {
              "opacity" === t.originalEvent.propertyName && (e.off("transitionend.view msTransitionEnd.view webkitTransitionEnd.view"), n.resolve())
            }) : n.resolve(), "hide" === t ? this.el.setAttribute("data-visible", !1) : "show" === t && this.el.setAttribute("data-visible", !0), n
          }.bind(this);
          this.hide = function () {
            return e("hide")
          }, this.show = function () {
            return e("show")
          }, this.setIndex = function (t) {
            this.el.setAttribute("data-selected-index", t)
          }, this.getIndex = function () {
            var t = this.el.getAttribute("data-selected-index");
            return t ? window.parseInt(t, 10) : null
          }
        }
        var n = function () {
            this.currentIndex = -1, this.view = new e(t.querySelector('[data-gallery-role="parent-view"]')), this.posterImages = new e(t.querySelector('[data-gallery-role="poster-images"]')), this.scroller = new function (e) {
              var n, r = $(e);
              this.hidePages = function () {
                this.pages.forEach(function (t) {
                  t.el.setAttribute("data-visible", !1)
                })
              }, this.scrollToPage = function (t, e) {
                var i = this.pages[t],
                  a = $(i.el);
                ! function (t, e) {
                  t.el.setAttribute("data-visible", !0);
                  var n = (e && e >= .8 ? e - .8 : "0") + "s";
                  $(t.el).css("transition-delay", n)
                }(i, e);
                var s = $.Deferred(),
                  l = -1 * Math.abs(a.position().top - window.parseInt(a.css("padding-top"), 10));
                r.css("transition-duration", e + "s");
                var c = function () {
                  a.css("transition-delay", "0s"), n = i, s.resolve()
                };
                return o.supports.transition ? (r.on("transitionend.scroller msTransitionEnd.scroller webkitTransitionEnd.scroller", function (t) {
                  "transform" !== t.originalEvent.propertyName && t.originalEvent.propertyName !== o.supports.transform || (r.off("transitionend.scroller msTransitionEnd.scroller webkitTransitionEnd.scroller"), c())
                }), r.css(o.supports.transform, "translateY(" + l + "px)")) : (r.css(o.supports.transform, "translateY(" + l + "px)"), c()), s
              };
              var a = t.querySelector(".pages").querySelectorAll(".page");
              this.pages = [];
              for (var s = 0; s < a.length; s++) this.pages.push(new function (t, e) {
                this.el = t, this.block = t.querySelector(".feature-group"), this.chapter = e
              }(a[s], s));
              this.layout = function () {
                for (var t = document.querySelectorAll('[data-layout-type="manual"]'), e = 0; e < t.length; e++) ! function (t) {
                  for (var e = t.querySelectorAll(".feature"), n = 0; n < e.length; n++) ! function (t, e) {
                    var n = i(t),
                      r = Math.floor(n[1] * e.clientHeight);
                    t.style.top = r + "px"
                  }(e[n], t)
                }(t[e])
              }, this.layout()
            }(t.querySelector('[data-gallery-role="scroller"]')), this.controls = new u({
              count: this.scroller.pages.length,
              orientation: "vertical",
              style: "hollow"
            }), this.view.el.appendChild(this.controls.el), $("#explore-thermostat .dot").on("click", function () {
              d.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "site functions",
                  gaAction: "get closer module",
                  gaLabel: "radio " + ($(this).index() + 1)
                }
              })
            }), d.trackEvent(".icon-nest-cam-teardown-outline-gray-down-arrow", "click", {
              gtm: {
                event: "gaEvent",
                gaCategory: "site functions",
                gaAction: "get closer module",
                gaLabel: "down"
              }
            }), d.trackEvent(".icon-nest-cam-teardown-outline-gray-up-arrow", "click", {
              gtm: {
                event: "gaEvent",
                gaCategory: "site functions",
                gaAction: "get closer module",
                gaLabel: "up"
              }
            }), this.sceneController = new function (t) {
              var e = function () {
                  this.el = t, this.initialized = !1, r.createEmitter(this), this.videoController = new c({
                    el: this.el,
                    FPS: 29.8
                  }), this.videoController.load().then(function () {
                    this.initialized = !0, this.trigger("initialized")
                  }.bind(this))
                }.bind(this),
                n = s[o.locale];
              this.getChapterDuration = function (t) {
                return t > 0 ? this.videoController.FRAME_LENGTH * (n[t] - n[t - 1]) : 1
              }, this.playChapter = function (t) {
                return t > 0 ? this.videoController.playRange(n[t - 1], n[t]) : this.skipToChapter(0)
              }, this.skipToChapter = function (t) {
                return this.videoController.skipToFrame(n[t])
              }, e()
            }(t.querySelector('[data-gallery-role="render-layer"]')), this.sceneController.on("initialized", function () {
              this.sceneController.el.setAttribute("data-visible", !0)
            }.bind(this)), this.calloutRenderer = new function (t) {
              function e(t) {
                t = t || 1, f.width = p.width() * t, f.height = p.height() * t, g.scale(t, t)
              }

              function n() {
                g.clearRect(0, 0, f.width, f.height)
              }
              var r, a, s, l, c, u, d, h, p = $(t.overlay),
                f = t.overlay,
                m = $(t.overlaid),
                g = f.getContext("2d"),
                v = [];
              this.draw = function (t) {
                if (t && (r = t), r) {
                  v = [];
                  for (var o = r.el.querySelectorAll("[data-callout-coordinates]"), f = 0; f < o.length; f++) v.push(new function (t) {
                    this.el = t, this.coordinates = i(this.el), this.calculateOffset = function () {
                      var t = $(this.el);
                      this.offset = t.offset(), this.offset.left -= u.left, this.offset.right = this.offset.left + t.outerWidth(!0)
                    }, this.GUTTER = 26, this.SHELF_LENGTH = 40
                  }(o[f]));
                  e(window.devicePixelRatio || 1), u = p.offset(), h = m.offset(), v.forEach(function (t) {
                    t.calculateOffset()
                  }), a = h.top - u.top, s = h.left - u.left, c = m.height(), l = m.outerWidth(), d = p.offset().top, n();
                  for (var y = 0, b = v.length; y < b; y++) ! function (t, e, n) {
                    g.strokeStyle = "#00AFD8", g.beginPath(), n = function (t) {
                      return Math.floor(t * c + a)
                    }(t.coordinates[1]), e = function (t) {
                      return Math.floor(t * l + s)
                    }(t.coordinates[0]), g.moveTo(e, n), n = t.offset.top - u.top, t.offset.left > e ? (e = t.offset.left - t.SHELF_LENGTH - t.GUTTER, g.lineTo(e + .5, n), g.lineTo(t.offset.left - t.GUTTER + .5, n)) : t.offset.left < e && (e = t.offset.right + t.SHELF_LENGTH + t.GUTTER, g.lineTo(e + .5, n), g.lineTo(t.offset.right + t.GUTTER + .5, n)), g.stroke()
                  }(v[y]);
                  this.showLayer()
                }
              }, this.stopDrawing = function (t) {
                var e = $.Deferred();
                return t ? (n(), void e.resolve()) : (o.supports.transition ? p.on("transitionend.callout-fade msTransitionEnd.callout-fade webkitTransitionEnd.callout-fade", function () {
                  p.off("transitionend.callout-fade msTransitionEnd.callout-fade webkitTransitionEnd.callout-fade"), n(), e.resolve()
                }) : (n(), e.resolve()), this.hideLayer(), e)
              }, this.showLayer = function () {
                this.visible = !0, f.setAttribute("data-visible", "true")
              }, this.hideLayer = function () {
                this.visible = !1, f.setAttribute("data-visible", "false")
              }, window.matchMedia("(-webkit-min-device-pixel-ratio:1.5),(min-device-pixel-ratio:1.5)").addListener(function () {
                e(window.devicePixelRatio || 1)
              })
            }({
              overlay: t.querySelector('[data-gallery-role="callout-layer"]'),
              overlaid: this.sceneController.el
            }), r.createEmitter(this), this.controls.on("index-selected", this.playSequence), this.controls.selectIndex(0), this.view.el.querySelector("#advance-teardown").addEventListener("click", function (t) {
              t.preventDefault(), this.controls.selectIndex(1), d.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "site functions",
                  gaAction: "get closer module",
                  gaLabel: "open"
                }
              })
            }.bind(this)), this.enableResizeListeners()
          }.bind(this),
          a = function () {
            this.playSequence(this.currentIndex), this.scroller.layout()
          }.bind(this),
          l = function () {
            this.calloutRenderer.hideLayer()
          }.bind(this);
        this.enableResizeListeners = function () {
          r.on("windowResizeEnd.ExplodedViewGallery", a), r.on("windowResizeStart.ExplodedViewGallery", l)
        }, this.disableResizeListeners = function () {
          r.off("windowResizeEnd.ExplodedViewGallery", a), r.off("windowResizeStart.ExplodedViewGallery", l)
        };
        var h = function () {
            return this.scroller.scrollToPage(0, 0), this.posterImages.setIndex(0), this.posterImages.show(), this.view.show(), this.calloutRenderer.draw(this.scroller.pages[0]), $.Deferred().resolve(this)
          }.bind(this),
          p = function (t) {
            var e = $.Deferred(),
              n = this.view.hide();
            return this.scroller.hidePages(), $.when(n).done(function () {
              this.scroller.scrollToPage(t, 0), this.posterImages.setIndex(t), this.calloutRenderer.draw(this.scroller.pages[t]), this.view.show().then(e.resolve)
            }.bind(this)), e
          }.bind(this),
          f = function (t) {
            var e = $.Deferred(),
              n = $.Deferred(),
              i = $.Deferred(),
              r = $.Deferred(),
              o = $.Deferred();
            return this.calloutRenderer.visible ? this.calloutRenderer.stopDrawing().then(e.resolve) : e.resolve(), this.sceneController.skipToChapter(t - 1).then(i.resolve), $.when(i).done(function () {
              this.posterImages.hide()
            }.bind(this)), $.when(e, i).done(function () {
              this.sceneController.playChapter(t).then(r.resolve), this.scroller.hidePages(), this.scroller.scrollToPage(t, this.sceneController.getChapterDuration(t)).then(n.resolve)
            }.bind(this)), $.when(n, r).done(function () {
              this.posterImages.setIndex(t), this.posterImages.show().then(function () {}), this.calloutRenderer.draw(this.scroller.pages[t]), o.resolve()
            }.bind(this)), o
          }.bind(this);
        this.playSequence = function (t) {
          var e = $.Deferred(),
            n = this.currentIndex;
          this.view.setIndex(""), this.controls.disable();
          var i = function () {
            this.view.setIndex(t), this.currentIndex = t, this.controls.enable(), e.resolve()
          }.bind(this);
          if (-1 === n) return h().then(i);
          return function () {
            return !!this.sceneController.initialized && (t === n + 1 && (!o.isIOS() && (!o.isIE.any && !o.isEdge)))
          }.bind(this)() ? f(t).then(i) : p(t).then(i)
        }.bind(this), n()
      };
    e.exports = {
      init: function () {
        var t, e, n = new l("(min-width:768px)");
        n.makeMobile = function () {
          if (t && (t.disableResizeListeners(), t = null), !e) {
            e = !0;
            for (var n = [], i = document.querySelector("#explore-thermostat").querySelector(".explore-thermostat-mobile").querySelectorAll(".nl-paged-list"), r = 0; r < i.length; r++) n.push(new a({
              container: i[r],
              spacer: i[r].querySelector('[data-role="spacer"]'),
              pages: i[r].querySelectorAll("ol > li")
            }))
          }
        }, n.makeDesktop = function () {
          t = new h(document.querySelector("#explore-thermostat").querySelector(".explore-thermostat-desktop"))
        }, n.init()
      }
    }
  }, {
    "../../../_modules/binary-init-switch": 67,
    "../../../_modules/nl-video-controller": 87,
    "../../../_modules/page_index_controls": 90,
    "../../../_modules/paged_list": 91,
    "../../../core_modules": 194,
    "./localized-chapter-configs": 330,
    "nl-client": 42,
    "nl-event-emitter": 47
  }],
  330: [function (t, e, n) {
    "use strict";
    var i = [0, 91, 136, 223, 293, 361],
      r = [0, 92, 160, 239, 300];
    e.exports = {
      "en-US": i,
      "en-CA": i,
      "es-MX": [0, 92, 160, 239, 300, 374],
      "fr-CA": i,
      "en-GB": r,
      "en-IE": r,
      "fr-FR": r,
      "fr-BE": r,
      "nl-NL": r,
      "nl-BE": r,
      "es-ES": r,
      "it-IT": r
    }
  }, {}],
  331: [function (t, e, n) {
    "use strict";
    var i = t("underscore"),
      r = t("../../../_modules/ui-controller").View.TouchSwipe,
      o = t("../../../_modules/tabs"),
      a = t("../../../_modules/infinite-carousel"),
      s = t("../../../_modules/nl_media"),
      l = t("../../../_modules/binary-init-switch"),
      c = t("../../../core_modules"),
      u = c.elementWatcher,
      d = c.client,
      h = c.client.isiPad,
      p = t("../../../_modules/utilities/section-toggler"),
      f = d.isIOS(),
      m = p.setCtrlModelEnableStatusToggler,
      g = !1;
    e.exports = function () {
      var t, e, n = $("#nest-sense"),
        c = new l("(min-width:768px)"),
        d = $("#nest-sense-tab-controls").data("model");
      m(n, d), r.create(d, {
        element: $("#nest-sense-slides")
      }), c.makeMobile = function () {
        e && (e.destroy(), e = null), t = function (t) {
          var e = $("#nest-sense-slides"),
            n = e.children("li"),
            r = n.find(".panel-image").find("img"),
            a = i.map(r, function (t) {
              return t.getAttribute("data-src")
            }),
            s = {
              container: e,
              panels: n
            },
            l = {
              onActive: function (t, e) {
                r.eq(e).attr("src", "").attr("src", a[e])
              }
            };
          return i.times(r.length, function (t) {
            r[t].setAttribute("src", a[t])
          }), o.PanelView.create(t, {
            elements: s,
            style: "tallest",
            onActive: l
          })
        }(d)
      }, c.makeDesktop = function () {
        t && (t.destroy(), t = null), e = function (t) {
          function e(t, e) {
            var n = d[e];
            void 0 !== n && n.pause()
          }

          function n(e) {
            var n, i = $(e.currentTarget);
            i.hasClass("active") || (n = 0 !== i.prev(".active").length ? "next" : "previous", e.preventDefault(), t.onViewInput("step", n))
          }
          var r, o, l = $("#nest-sense-slides"),
            c = l.children("li"),
            d = i.map(c.find("video"), s.init),
            p = {
              container: l,
              panels: c
            },
            m = {
              onActive: function (t, e) {
                var n = d[e];
                void 0 !== n && n.play(!0)
              },
              onDeactive: e
            };
          return h && function () {
            var t = $("<a></a>", {
                class: "play-button"
              }).prependTo(c.find(".panel-image")),
              n = f ? "click" : "touchstart";
            t.on(n, function (t) {
              t.preventDefault();
              var e = t.target,
                n = e.parentNode,
                i = s.init(n.querySelector("video"));
              e.classList.add("is-hidden"), i.play(), i.on("ended pause", function () {
                e.classList.remove("is-hidden"), i.off("ended pause")
              })
            }), m.onActive = i.noop, m.onDeactive = function (t) {
              e(), t.find(".play-button").removeClass("is-hidden")
            }
          }(), g || u.add({
            element: $("#nest-sense"),
            callback: function () {
              d[0].preload(), i.each(d.slice(1), function (t) {
                t.preload("metadata")
              }), g = !0
            }
          }), r = a.create(t, {
            elements: p,
            onActive: m,
            setHeight: !0,
            onDestroy: function () {
              o.off("click", n)
            }
          }), (o = r.elements.panelsAndClones).on("click", n), r
        }(d)
      }, c.init()
    }
  }, {
    "../../../_modules/binary-init-switch": 67,
    "../../../_modules/infinite-carousel": 79,
    "../../../_modules/nl_media": 88,
    "../../../_modules/tabs": 95,
    "../../../_modules/ui-controller": 100,
    "../../../_modules/utilities/section-toggler": 110,
    "../../../core_modules": 194,
    underscore: 58
  }],
  332: [function (t, e, n) {
    "use strict";
    var i = t("nl-element-watcher"),
      r = t("../../_modules/geotargeted-incentives-module"),
      o = t("../../_modules/card-gallery"),
      a = t("../../_modules/ui-controller"),
      s = t("../../_modules/tabs"),
      l = t("../../_modules/make-sections-visible");
    e.exports = {
      init: function () {
        a.init(), s.init(), $("body").on("click", ".buy-button", function (t) {
            dataLayer.push({
              event: "gaEvent",
              gaCategory: "navigation",
              gaAction: "go to store",
              gaLabel: t.target.getAttribute("ga-label")
            })
          }), $("body").on("click", ".watch-video", function (t) {
            dataLayer.push({
              event: "gaEvent",
              gaCategory: "videos",
              gaAction: "start",
              gaLabel: t.target.getAttribute("data-widget-binding")
            })
          }), $("body").on("click", ".key-link", function (t) {
            dataLayer.push({
              event: "gaEvent",
              gaCategory: "navigation",
              gaAction: "internal link",
              gaLabel: t.target.getAttribute("ga-label")
            })
          }), $("body").on("click", "#nest-home button", function (t) {
            dataLayer.push({
              event: "gaEvent",
              gaCategory: "site functions",
              gaAction: "a nest home module",
              gaLabel: "works with nest"
            })
          }), l(),
          function () {
            var t = $(".meet-cinemagraph.mobile"),
              e = $(".meet-cinemagraph.desktop"),
              n = $(".cinemagraph-container.mobile"),
              i = $(".cinemagraph-container.desktop");
            t.on("canplaythrough", function () {
              t.removeClass("loading")
            }), e.on("canplaythrough", function () {
              e.removeClass("loading")
            }), setTimeout(function () {
              n.addClass("bg-visible"), i.addClass("bg-visible")
            }, 2e3), t.on("pause", function () {
              setTimeout(function () {
                t.addClass("wont-play")
              }, 2500)
            }), e.on("pause", function () {
              setTimeout(function () {
                e.addClass("wont-play")
              }, 2500)
            })
          }(),
          function () {
            var t = document.querySelector("#app"),
              e = t.querySelector(".app-video-container video.desktop"),
              n = t.querySelector(".app-video-container video.mobile");
            i.add({
              element: e,
              callback: function () {
                e.play()
              },
              offset: 300
            }), i.add({
              element: n,
              callback: function () {
                n.play()
              },
              offset: 300
            })
          }(),
          function () {
            var t = document.querySelector("#saves-energy"),
              e = t.querySelector(".saves-energy-video-container video.mobile"),
              n = t.querySelector(".saves-energy-video-container video.desktop"),
              r = function () {
                t.classList.add("animate-leaf")
              };
            e.addEventListener("play", r), n.addEventListener("play", r), i.add({
              element: e,
              callback: function () {
                matchMedia("(min-width: 768px)").matches || e.play()
              },
              offset: 300
            }), i.add({
              element: n,
              callback: function () {
                matchMedia("(min-width: 768px)").matches && n.play()
              },
              offset: 300
            })
          }(),
          function () {
            var t = new o("#lifestyle-gallery", {
                addArrowsDesktop: !0,
                shrinkInactiveCards: !1,
                shouldConvert: !1,
                matchCardHeight: !1
              }),
              e = setInterval(function () {
                t.next()
              }, 5e3);
            t.gallery.addEventListener("user-interaction", function () {
              clearInterval(e)
            })
          }(),
          function () {
            var e = t("../../_modules/footnote-tooltip"),
              n = document.querySelector(".mini-promotion-2017");
            n && new e(n.querySelector(".nl-footnote-tooltip-root"))
          }(), r.init($(".promotion-banner"))
      }
    }
  }, {
    "../../_modules/card-gallery": 70,
    "../../_modules/footnote-tooltip": 75,
    "../../_modules/geotargeted-incentives-module": 76,
    "../../_modules/make-sections-visible": 82,
    "../../_modules/tabs": 95,
    "../../_modules/ui-controller": 100,
    "nl-element-watcher": 45
  }],
  333: [function (t, e, n) {
    "use strict";
    t("../../core_modules").analytics;
    e.exports = {
      init: function () {
        $("body").on("click", ".key-link", function (t) {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "navigation",
            gaAction: "internal link",
            gaLabel: t.target.getAttribute("ga-label")
          })
        })
      }
    }
  }, {
    "../../core_modules": 194
  }],
  334: [function (t, e, n) {
    "use strict";
    var i = t("../core_modules").analytics;
    e.exports = {
      init: function () {
        $(".slide a").on("click", function () {
          i.trackEvent(i.gaEventObj({
            gaCategory: "navigation",
            gaAction: "category shelf",
            gaLabel: $(this).attr("data-category-name")
          }))
        })
      }
    }
  }, {
    "../core_modules": 194
  }],
  335: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  336: [function (t, e, n) {
    "use strict";
    var i = t("../../core_modules").analytics,
      r = t("./main-hero"),
      o = t("./programming-isnt-proven"),
      a = t("./learning-changed-everything"),
      s = t("./it-saves-energy"),
      l = t("./even-more-savings-all-year-around"),
      c = t("./kwh-ticker"),
      u = t("./savings-calculator");
    e.exports = {
      init: function () {
        i.trackEvent("#main-hero .button", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "Videos",
            gaAction: "Start",
            gaLabel: "your energy partner"
          }
        }), i.trackEvent("#learning-changed-everything .turn-it-up", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "learning changed everything module",
            gaLabel: "turn it up and down"
          }
        }), i.trackEvent("#learning-changed-everything .knows-when-home", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "learning changed everything module",
            gaLabel: "It learns what you like"
          }
        }), i.trackEvent("#learning-changed-everything .knows-when-away", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "learning changed everything module",
            gaLabel: "it knows when you are away"
          }
        }), i.trackEvent("#learning-changed-everything .learns-about", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "learning changed everything module",
            gaLabel: "it learns about your home"
          }
        }), i.trackEvent("#learning-changed-everything .control-it", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "learning changed everything module",
            gaLabel: "control it from anywhere"
          }
        }), i.trackEvent("#it-saves-energy .whitepaper a", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "downloads",
            gaLabel: "energy savings whitepaper"
          }
        }), i.trackEvent("#even-more-savings-all-year-around .seasonal-savings a", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "downloads",
            gaLabel: "seasonal savings whitepaper"
          }
        }), i.trackEvent("#even-more-savings-all-year-around .rhr a", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "site functions",
            gaAction: "downloads",
            gaLabel: "rush hour rewards whitepaper"
          }
        }), i.trackEvent(".bring-home-content .buy-now", "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "navigation",
            gaAction: "go to store",
            gaLabel: "buy now bottom thermostat"
          }
        }), r(), o(), a(), s(), l(), c(), u()
      }
    }
  }, {
    "../../core_modules": 194,
    "./even-more-savings-all-year-around": 335,
    "./it-saves-energy": 337,
    "./kwh-ticker": 338,
    "./learning-changed-everything": 339,
    "./main-hero": 340,
    "./programming-isnt-proven": 341,
    "./savings-calculator": 342
  }],
  337: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  338: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  339: [function (t, e, n) {
    "use strict";
    var i = t("../../_modules/ui-controller"),
      r = t("../../_modules/tabs");
    e.exports = function () {
      i.init(), r.init()
    }
  }, {
    "../../_modules/tabs": 95,
    "../../_modules/ui-controller": 100
  }],
  340: [function (t, e, n) {
    "use strict";
    var i = t("../../core_modules").client;
    e.exports = function () {
      var t = $("#main-hero"),
        e = $("#main-hero").outerWidth(),
        n = t.find(".animation-overlay"),
        r = window.matchMedia("(min-width:768px)"),
        o = $(".stats");
      r.matches && (n.css("background-size", e), n.addClass("animated"), i.supports.transition ? n.on("transitionend msTransitionEnd webkitTransitionEnd", function (e) {
        "width" === e.originalEvent.propertyName && (t.addClass("red-bg"), n.addClass("fade"), o.addClass("visible"))
      }) : (t.addClass("red-bg"), n.addClass("fade"), o.addClass("visible"))), r.addListener(function () {
        r.matches && t.addClass("red-bg")
      })
    }
  }, {
    "../../core_modules": 194
  }],
  341: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  342: [function (t, e, n) {
    "use strict";
    e.exports = function () {}
  }, {}],
  343: [function (t, e, n) {
    "use strict";
    e.exports = {
      "*": function () {
        return t("../init")
      },
      "/": function () {
        return t("../homepage")
      },
      about: function () {
        return t("../about")
      },
      "-apps": {
        "*": function () {
          return t("../apps/app_redirects")
        },
        eula: function () {
          return t("../apps/app_legal")
        },
        embedded: {
          terms: function () {
            return t("../apps/app_legal")
          },
          "privacy-statement": function () {
            return t("../apps/app_legal")
          },
          "ip-and-other-notices": function () {
            return t("../apps/app_legal")
          }
        }
      },
      "alarm-system": {
        overview: function () {
          return t("../alarm-system/overview")
        },
        "tech-specs": function () {
          return t("../alarm-system/tech-specs")
        },
        "professional-monitoring": function () {
          return t("../alarm-system/professional-monitoring")
        }
      },
      app: function () {
        return t("../nest_app")
      },
      blog: {
        "*": function () {
          return t("../blog")
        }
      },
      careers: {
        positions: {
          "*": function () {
            return t("../careers/positions")
          }
        },
        "life-at-nest": function () {
          return t("../careers/life-at-nest")
        },
        internships: function () {
          return t("../careers/internships")
        }
      },
      cameras: {
        "/": function () {
          return t("../cameras")
        },
        compare: function () {
          return t("../cameras/compare")
        },
        "nest-aware": function () {
          return t("../cameras/nest-aware")
        },
        "pet-cam": function () {
          return t("../cameras/pet-cam/index")
        },
        "family-cam": function () {
          return t("../cameras/family-cam/index")
        },
        "home-security": function () {
          return t("../cameras/home-security")
        },
        "nest-cam-indoor": {
          overview: function () {
            return t("../cameras/nest-cam-indoor/overview")
          },
          "tech-specs": function () {
            return t("../cameras/nest-cam-indoor/tech-specs")
          }
        },
        "nest-cam-outdoor": {
          overview: function () {
            return t("../cameras/nest-cam-outdoor/overview")
          },
          "tech-specs": function () {
            return t("../cameras/nest-cam-outdoor/tech-specs")
          }
        },
        "nest-cam-iq-indoor": {
          overview: function () {
            return t("../cameras/nest-cam-iq-indoor/overview")
          },
          "tech-specs": function () {
            return t("../cameras/nest-cam-iq-indoor/tech-specs")
          }
        },
        "nest-cam-iq-outdoor": {
          overview: function () {
            return t("../cameras/nest-cam-iq-outdoor/overview")
          },
          "tech-specs": function () {
            return t("../cameras/nest-cam-iq-outdoor/tech-specs")
          }
        }
      },
      "coming-soon": function () {
        return t("../coming-soon")
      },
      "connected-home": {
        "*": function () {
          return t("../connected-home")
        }
      },
      contact: {
        partners: function () {
          return t("../contact")
        }
      },
      doorbell: {
        "nest-hello": {
          overview: function () {
            return t("../doorbell/nest-hello/overview")
          },
          "tech-specs": function () {
            return t("../doorbell/nest-hello/tech-specs")
          }
        }
      },
      "email-signup": function () {
        return t("../email-signup")
      },
      "energy-partners": {
        "*": function () {
          return t("../energy_partners")
        }
      },
      "energy-solutions": function () {
        return t("../energy_solutions")
      },
      installnestcam: function () {
        return t("../requirements")
      },
      "insurance-partners": function () {
        return t("../insurance_partners")
      },
      "meridian-energy": function () {
        return t("../enterprise")
      },
      orsted: function () {
        return t("../enterprise")
      },
      "e-on": function () {
        return t("../enterprise")
      },
      elisa: function () {
        return t("../enterprise")
      },
      iselect: function () {
        return t("../enterprise")
      },
      reliant: function () {
        return t("../enterprise")
      },
      "igs-protect": function () {
        return t("../enterprise")
      },
      "igs-thermostat": function () {
        return t("../enterprise")
      },
      legal: {
        compliance: function () {
          return t("../legal/opensource")
        }
      },
      "letter-from-the-ceo": function () {
        return t("../letter_from_the_ceo")
      },
      "nest-for-business": function () {
        return t("../nest-for-business")
      },
      "nest-pro-installation": function () {
        return t("../nest_pro_installation")
      },
      nestiesaward: function () {
        return t("../nesties")
      },
      pair: function () {
        return t("../requirements")
      },
      partners: {
        "*": function () {
          return t("../energy_partners")
        }
      },
      preferences: function () {
        return t("../preferences")
      },
      press: function () {
        return t("../press")
      },
      pro: {
        "*": function () {
          return t("../cms/pro")
        }
      },
      review: function () {
        return t("../review")
      },
      "protect-replacement-request": function () {
        return t("../protect-replacement-request")
      },
      "rebates-and-rewards": function () {
        return t("../rebates-and-rewards")
      },
      responsibility: function () {
        return t("../responsibility")
      },
      search: function () {
        return t("../search")
      },
      "smoke-co-alarm": {
        overview: function () {
          return t("../smoke-co-alarm/overview")
        },
        "tech-specs": function () {
          return t("../smoke-co-alarm/tech-specs")
        }
      },
      stories: {
        "a-co-emergency": function () {
          return t("../stories/a_co_emergency")
        },
        LEED: function () {
          return t("../stories/leed")
        }
      },
      "submit-video": function () {
        return t("../submit-video")
      },
      support: {
        "*": function () {
          return t("../support/support_main")
        },
        "/": function () {
          return t("../support/index")
        },
        "contact-us": function () {
          return t("../support/contact_us")
        },
        "alarm-system": function () {
          return t("../support/article-symptom-list")
        },
        thermostats: function () {
          return t("../support/article-symptom-list")
        },
        cameras: function () {
          return t("../support/article-symptom-list")
        },
        doorbell: function () {
          return t("../support/article-symptom-list")
        },
        store: function () {
          return t("../support/article-symptom-list")
        },
        "nest-aware": function () {
          return t("../support/article-symptom-list")
        },
        app: function () {
          return t("../support/article-symptom-list")
        },
        "works-with-nest": function () {
          return t("../support/article-symptom-list")
        },
        "smoke-co-alarm": {
          "/": function () {
            return t("../support/article-symptom-list")
          },
          "learn-more": function () {
            return t("../support/smoke-co-alarm/learn-more")
          }
        },
        "email-us": function () {
          return t("../support/email_us")
        },
        reseller: function () {
          return t("../support/reseller")
        }
      },
      thanks: function () {
        return t("../thanks")
      },
      thermostats: {
        "/": function () {
          return t("../thermostats")
        },
        compare: function () {
          return t("../thermostats/compare")
        },
        "nest-learning-thermostat": {
          overview: function () {
            return t("../thermostats/nest-learning-thermostat/overview")
          },
          "tech-specs": function () {
            return t("../thermostats/nest-learning-thermostat/tech-specs")
          }
        },
        "nest-thermostat-e": {
          overview: function () {
            return t("../thermostats/nest-thermostat-e/overview")
          },
          "tech-specs": function () {
            return t("../thermostats/nest-thermostat-e/tech-specs")
          }
        },
        "real-savings": function () {
          return t("../thermostats/real-savings")
        }
      },
      video: {
        "/": function () {
          return t("../video")
        },
        category: {
          "*": function () {
            return t("../video/category")
          }
        },
        live: {
          "*": function () {
            return t("../video/live")
          }
        },
        clip: {
          "*": function () {
            return t("../video/clip")
          }
        }
      },
      "we-love-home": function () {
        return t("../we-love-home")
      },
      "where-to-buy": function () {
        return t("../where-to-buy")
      },
      widget: {
        "*": function () {
          return t("../widget/global-widget-object")
        },
        utility: function () {
          return t("../widgets/handle-legacy-utility")
        },
        rebates: function () {
          return t("../widget/rebates")
        }
      },
      "works-with-nest": function () {
        return t("../works-with-nest")
      },
      weave: function () {
        return t("../weave")
      }
    }
  }, {
    "../about": 119,
    "../alarm-system/overview": 121,
    "../alarm-system/professional-monitoring": 131,
    "../alarm-system/tech-specs": 135,
    "../apps/app_legal": 137,
    "../apps/app_redirects": 139,
    "../blog": 140,
    "../cameras": 145,
    "../cameras/compare": 142,
    "../cameras/family-cam/index": 143,
    "../cameras/home-security": 144,
    "../cameras/nest-aware": 146,
    "../cameras/nest-cam-indoor/overview": 148,
    "../cameras/nest-cam-indoor/tech-specs": 151,
    "../cameras/nest-cam-iq-indoor/overview": 153,
    "../cameras/nest-cam-iq-indoor/tech-specs": 156,
    "../cameras/nest-cam-iq-outdoor/overview": 161,
    "../cameras/nest-cam-iq-outdoor/tech-specs": 168,
    "../cameras/nest-cam-outdoor/overview": 171,
    "../cameras/nest-cam-outdoor/tech-specs": 178,
    "../cameras/pet-cam/index": 179,
    "../careers/internships": 183,
    "../careers/life-at-nest": 184,
    "../careers/positions": 185,
    "../cms/pro": 188,
    "../coming-soon": 189,
    "../connected-home": 191,
    "../contact": 192,
    "../doorbell/nest-hello/overview": 203,
    "../doorbell/nest-hello/tech-specs": 207,
    "../email-signup": 208,
    "../energy_partners": 210,
    "../energy_solutions": 216,
    "../enterprise": 217,
    "../homepage": 223,
    "../init": 228,
    "../insurance_partners": 229,
    "../legal/opensource": 230,
    "../letter_from_the_ceo": 231,
    "../nest-for-business": 236,
    "../nest_app": 242,
    "../nest_pro_installation": 245,
    "../nesties": 246,
    "../preferences": 255,
    "../press": 256,
    "../protect-replacement-request": 257,
    "../rebates-and-rewards": 259,
    "../requirements": 260,
    "../responsibility": 261,
    "../review": 263,
    "../search": 268,
    "../smoke-co-alarm/overview": 272,
    "../smoke-co-alarm/tech-specs": 276,
    "../stories/a_co_emergency": 278,
    "../stories/leed": 285,
    "../submit-video": 292,
    "../support/article-symptom-list": 293,
    "../support/contact_us": 295,
    "../support/email_us": 296,
    "../support/index": 298,
    "../support/reseller": 300,
    "../support/smoke-co-alarm/learn-more": 301,
    "../support/support_main": 303,
    "../thanks": 305,
    "../thermostats": 310,
    "../thermostats/compare": 307,
    "../thermostats/nest-learning-thermostat/overview": 316,
    "../thermostats/nest-learning-thermostat/tech-specs": 328,
    "../thermostats/nest-thermostat-e/overview": 332,
    "../thermostats/nest-thermostat-e/tech-specs": 333,
    "../thermostats/real-savings": 336,
    "../video": 357,
    "../video/category": 355,
    "../video/clip": 356,
    "../video/live": 358,
    "../we-love-home": 367,
    "../weave": 368,
    "../where-to-buy": 369,
    "../widget/global-widget-object": 370,
    "../widget/rebates": 372,
    "../widgets/handle-legacy-utility": 373,
    "../works-with-nest": 374
  }],
  344: [function (t, e, n) {
    "use strict";

    function i(t) {
      return t.split("x")[0].replace(/\D/g, "")
    }

    function r() {
      switch (f.country) {
        case "US":
          return m.NANP_US;
        case "CA":
          return m.NANP_CA;
        default:
          return m.E123
      }
    }

    function o(t) {
      if (t && "" !== $(t).val()) {
        var e = i($(t).val()),
          n = r();
        $(t).val($.trim(e.replace(n.regex, n.format).replace(/x$/, "")))
      }
    }

    function a(t) {
      var e = $(t).val();
      return $(t).hasClass("zipcode") && (!/(^\d{5}$)|(^\d{5}-\d{4}$)|(^([A-Za-z]\d[A-Za-z])\s?(\d[A-Za-z]\d)$)/.test(e) || $(t).val().indexOf(" ") > 0)
    }

    function s(t) {
      return ($(t).hasClass("email") || "email" === $(t).attr("type")) && (!l($(t).val()) || $(t).val().indexOf(" ") > 0)
    }

    function l(t) {
      return /^[^,^\s]+[\@][^,^\s]+\.[^,^\s]{2,}$/.test(t)
    }

    function c(t) {
      return "" === $(t).val() || null === $(t).val()
    }

    function u(t) {
      if ($(t).hasClass("phone") || "tel" === $(t).attr("type")) {
        var e = i($(t).val()),
          n = r();
        return null === e.match(n.regex)
      }
    }

    function d(t) {
      return c(t) || s(t) || u(t) || a(t)
    }

    function h(t) {
      var e = $(t);
      if (e.length > 0) {
        e.find(".required").removeClass("error");
        var n = !0;
        return e.find(".required").each(function () {
          d(this) && (n = !1, $(this).addClass("error"), $(this).parent().find(".invalid").fadeIn(200).delay(2e3).fadeOut(300))
        }), n
      }
    }

    function p(t) {
      var e = $(t);
      e.data("onsubmit") && $(t).on("submit", function () {
        return h(this)
      }), e.find('.phone, [type="tel"]').on("blur", function () {
        o(this)
      }), e.find("input, textarea, select").on("blur change paste", function () {
        $(this).hasClass("required") && (d(this) ? $(this).addClass("error") : $(this).removeClass("error"))
      }), e.find("input, textarea, select").on("focus", function () {
        $(this).removeClass("error")
      })
    }
    var f = t("nl-client"),
      m = {
        NANP_US: {
          regex: /^1?([2-9]\d{2})(\d{3})(\d{4})(\d*)$/i,
          format: "1 ($1) $2-$3 x$4",
          type: "NANP"
        },
        NANP_CA: {
          regex: /^1?([2-9]\d{2})(\d{3})(\d{4})(\d*)$/i,
          format: "1-$1-$2-$3 x$4",
          type: "NANP"
        },
        E123: {
          regex: /^\+?([0-9]{1,3})([0-9]{4,})(x.+)?$/,
          format: "+$1 $2 $3",
          type: "E123"
        }
      };
    $(".nlValidation").each(function (t, e) {
      p(e)
    }), e.exports = {
      formattedPhoneNumber: o,
      invalidElement: d,
      invalidEmail: s,
      invalidInput: c,
      invalidPhone: u,
      invalidZip: a,
      isValid: h,
      isValidEmail: l,
      phoneNumberFormatter: r,
      validate: p
    }
  }, {
    "nl-client": 42
  }],
  345: [function (t, e, n) {
    "use strict";
    ! function (t) {
      function e(t) {
        if (r.raw) return t;
        try {
          return decodeURIComponent(t.replace(i, " "))
        } catch (t) {}
      }

      function n(t) {
        0 === t.indexOf('"') && (t = t.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, "\\")), t = e(t);
        try {
          return r.json ? JSON.parse(t) : t
        } catch (t) {}
      }
      var i = /\+/g,
        r = t.cookie = function (i, o, a) {
          if (void 0 !== o) {
            if ("number" == typeof (a = t.extend({}, r.defaults, a)).expires) {
              var s = a.expires,
                l = a.expires = new Date;
              l.setDate(l.getDate() + s)
            }
            return o = r.json ? JSON.stringify(o) : String(o), document.cookie = [r.raw ? i : encodeURIComponent(i), "=", r.raw ? o : encodeURIComponent(o), a.expires ? "; expires=" + a.expires.toUTCString() : "", a.path ? "; path=" + a.path : "", a.domain ? "; domain=" + a.domain : "", a.secure ? "; secure" : ""].join("")
          }
          for (var c = i ? void 0 : {}, u = document.cookie ? document.cookie.split("; ") : [], d = 0, h = u.length; d < h; d++) {
            var p = u[d].split("="),
              f = e(p.shift()),
              m = p.join("=");
            if (i && i === f) {
              c = n(m);
              break
            }
            i || void 0 === (m = n(m)) || (c[f] = m)
          }
          return c
        };
      r.defaults = {}, t.removeCookie = function (e, n) {
        return void 0 !== t.cookie(e) && (t.cookie(e, "", t.extend({}, n, {
          expires: -1
        })), !0)
      }
    }(window.$)
  }, {}],
  346: [function (t, e, n) {
    "use strict";
    var i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (t) {
      return typeof t
    } : function (t) {
      return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
    };
    ! function (t) {
      "function" == typeof define && define.amd && define.amd.jQuery ? define(["jquery"], t) : t(jQuery)
    }(function (t) {
      var e = "left",
        n = "right",
        r = "up",
        o = "down",
        a = "in",
        s = "out",
        l = "none",
        c = "auto",
        u = "swipe",
        d = "pinch",
        h = "tap",
        p = "doubletap",
        f = "longtap",
        m = "horizontal",
        g = "vertical",
        v = "all",
        y = 10,
        b = "start",
        w = "move",
        _ = "end",
        k = "cancel",
        x = "ontouchstart" in window,
        E = window.navigator.msPointerEnabled && !window.navigator.pointerEnabled,
        C = window.navigator.pointerEnabled || window.navigator.msPointerEnabled,
        S = "TouchSwipe";
      t.fn.swipe = function (T) {
        var j = t(this),
          L = j.data(S);
        if (L && "string" == typeof T) {
          if (L[T]) return L[T].apply(this, Array.prototype.slice.call(arguments, 1));
          t.error("Method " + T + " does not exist on jQuery.swipe")
        } else if (!(L || "object" !== (void 0 === T ? "undefined" : i(T)) && T)) return function (i) {
          return !i || void 0 !== i.allowPageScroll || void 0 === i.swipe && void 0 === i.swipeStatus || (i.allowPageScroll = l), void 0 !== i.click && void 0 === i.tap && (i.tap = i.click), i || (i = {}), i = t.extend({}, t.fn.swipe.defaults, i), this.each(function () {
            var T = t(this),
              j = T.data(S);
            j || (j = new function (i, T) {
              function j(i) {
                if (!0 !== _t.data(S + "_intouch") && !(t(i.target).closest(T.excludedElements, _t).length > 0)) {
                  var a, s = i.originalEvent ? i.originalEvent : i,
                    l = x ? s.touches[0] : s;
                  return kt = b, x ? xt = s.touches.length : i.preventDefault(), ht = 0, pt = null, bt = null, ft = 0, mt = 0, gt = 0, vt = 1, yt = 0, Et = function () {
                    for (var t = [], e = 0; e <= 5; e++) t.push({
                      start: {
                        x: 0,
                        y: 0
                      },
                      end: {
                        x: 0,
                        y: 0
                      },
                      identifier: 0
                    });
                    return t
                  }(), wt = function () {
                    var t = {};
                    return t[e] = nt(e), t[n] = nt(n), t[r] = nt(r), t[o] = nt(o), t
                  }(), Q(), !x || xt === T.fingers || T.fingers === v || q() ? (K(0, l), Ct = ot(), 2 == xt && (K(1, s.touches[1]), mt = gt = rt(Et[0].start, Et[1].start)), (T.swipeStatus || T.pinchStatus) && (a = I(s, kt))) : a = !1, !1 === a ? (kt = k, I(s, kt), a) : (T.hold && (Ot = setTimeout(t.proxy(function () {
                    _t.trigger("hold", [s.target]), T.hold && (a = T.hold.call(_t, s, s.target))
                  }, this), T.longTapThreshold)), Z(!0), null)
                }
              }

              function L(i) {
                var u = i.originalEvent ? i.originalEvent : i;
                if (kt !== _ && kt !== k && !J()) {
                  var d, h = tt(x ? u.touches[0] : u);
                  if (St = ot(), x && (xt = u.touches.length), T.hold && clearTimeout(Ot), kt = w, 2 == xt && (0 == mt ? (K(1, u.touches[1]), mt = gt = rt(Et[0].start, Et[1].start)) : (tt(u.touches[1]), gt = rt(Et[0].end, Et[1].end), Et[0].end, Et[1].end, bt = vt < 1 ? s : a), vt = (gt / mt * 1).toFixed(2), yt = Math.abs(mt - gt)), xt === T.fingers || T.fingers === v || !x || q()) {
                    if (pt = function (t, i) {
                        var a = function (t, e) {
                          var n = t.x - e.x,
                            i = e.y - t.y,
                            r = Math.atan2(i, n),
                            o = Math.round(180 * r / Math.PI);
                          return o < 0 && (o = 360 - Math.abs(o)), o
                        }(t, i);
                        return a <= 45 && a >= 0 ? e : a <= 360 && a >= 315 ? e : a >= 135 && a <= 225 ? n : a > 45 && a < 135 ? o : r
                      }(h.start, h.end), function (t, i) {
                        if (T.allowPageScroll === l || q()) t.preventDefault();
                        else {
                          var a = T.allowPageScroll === c;
                          switch (i) {
                            case e:
                              (T.swipeLeft && a || !a && T.allowPageScroll != m) && t.preventDefault();
                              break;
                            case n:
                              (T.swipeRight && a || !a && T.allowPageScroll != m) && t.preventDefault();
                              break;
                            case r:
                              (T.swipeUp && a || !a && T.allowPageScroll != g) && t.preventDefault();
                              break;
                            case o:
                              (T.swipeDown && a || !a && T.allowPageScroll != g) && t.preventDefault()
                          }
                        }
                      }(i, pt), ht = function (t, e) {
                        return Math.round(Math.sqrt(Math.pow(e.x - t.x, 2) + Math.pow(e.y - t.y, 2)))
                      }(h.start, h.end), ft = it(), function (t, e) {
                        e = Math.max(e, et(t)), wt[t].distance = e
                      }(pt, ht), (T.swipeStatus || T.pinchStatus) && (d = I(u, kt)), !T.triggerOnTouchEnd || T.triggerOnTouchLeave) {
                      var p = !0;
                      if (T.triggerOnTouchLeave) {
                        var f = function (e) {
                          var n = (e = t(e)).offset();
                          return {
                            left: n.left,
                            right: n.left + e.outerWidth(),
                            top: n.top,
                            bottom: n.top + e.outerHeight()
                          }
                        }(this);
                        p = function (t, e) {
                          return t.x > e.left && t.x < e.right && t.y > e.top && t.y < e.bottom
                        }(h.end, f)
                      }!T.triggerOnTouchEnd && p ? kt = $(w) : T.triggerOnTouchLeave && !p && (kt = $(_)), kt != k && kt != _ || I(u, kt)
                    }
                  } else I(u, kt = k);
                  !1 === d && I(u, kt = k)
                }
              }

              function A(t) {
                var e = t.originalEvent;
                return x && e.touches.length > 0 ? (X(), !0) : (J() && (xt = jt), St = ot(), ft = it(), R() || !D() ? I(e, kt = k) : T.triggerOnTouchEnd || 0 == T.triggerOnTouchEnd && kt === w ? (t.preventDefault(), I(e, kt = _)) : !T.triggerOnTouchEnd && U() ? M(e, kt = _, h) : kt === w && I(e, kt = k), Z(!1), null)
              }

              function O() {
                xt = 0, St = 0, Ct = 0, mt = 0, gt = 0, vt = 1, Q(), Z(!1)
              }

              function P(t) {
                var e = t.originalEvent;
                T.triggerOnTouchLeave && (kt = $(_), I(e, kt))
              }

              function N() {
                _t.unbind(st, j), _t.unbind(dt, O), _t.unbind(lt, L), _t.unbind(ct, A), ut && _t.unbind(ut, P), Z(!1)
              }

              function $(t) {
                var e = t,
                  n = H(),
                  i = D(),
                  r = R();
                return !n || r ? e = k : !i || t != w || T.triggerOnTouchEnd && !T.triggerOnTouchLeave ? !i && t == _ && T.triggerOnTouchLeave && (e = k) : e = _, e
              }

              function I(t, e) {
                var n = void 0;
                return B() && V() || V() ? n = M(t, e, u) : (!F() || !q()) && !q() || !1 === n || (n = M(t, e, d)), G() && Y() && !1 !== n ? n = M(t, e, p) : ft > T.longTapThreshold && ht < y && T.longTap && !1 !== n ? n = M(t, e, f) : 1 !== xt && x || !(isNaN(ht) || ht < T.threshold) || !U() || !1 === n || (n = M(t, e, h)), e === k && O(), e === _ && (x ? 0 == t.touches.length && O() : O()), n
              }

              function M(i, l, c) {
                var m = void 0;
                if (c == u) {
                  if (_t.trigger("swipeStatus", [l, pt || null, ht || 0, ft || 0, xt, Et]), T.swipeStatus && !1 === (m = T.swipeStatus.call(_t, i, l, pt || null, ht || 0, ft || 0, xt, Et))) return !1;
                  if (l == _ && B()) {
                    if (_t.trigger("swipe", [pt, ht, ft, xt, Et]), T.swipe && !1 === (m = T.swipe.call(_t, i, pt, ht, ft, xt, Et))) return !1;
                    switch (pt) {
                      case e:
                        _t.trigger("swipeLeft", [pt, ht, ft, xt, Et]), T.swipeLeft && (m = T.swipeLeft.call(_t, i, pt, ht, ft, xt, Et));
                        break;
                      case n:
                        _t.trigger("swipeRight", [pt, ht, ft, xt, Et]), T.swipeRight && (m = T.swipeRight.call(_t, i, pt, ht, ft, xt, Et));
                        break;
                      case r:
                        _t.trigger("swipeUp", [pt, ht, ft, xt, Et]), T.swipeUp && (m = T.swipeUp.call(_t, i, pt, ht, ft, xt, Et));
                        break;
                      case o:
                        _t.trigger("swipeDown", [pt, ht, ft, xt, Et]), T.swipeDown && (m = T.swipeDown.call(_t, i, pt, ht, ft, xt, Et))
                    }
                  }
                }
                if (c == d) {
                  if (_t.trigger("pinchStatus", [l, bt || null, yt || 0, ft || 0, xt, vt, Et]), T.pinchStatus && !1 === (m = T.pinchStatus.call(_t, i, l, bt || null, yt || 0, ft || 0, xt, vt, Et))) return !1;
                  if (l == _ && F()) switch (bt) {
                    case a:
                      _t.trigger("pinchIn", [bt || null, yt || 0, ft || 0, xt, vt, Et]), T.pinchIn && (m = T.pinchIn.call(_t, i, bt || null, yt || 0, ft || 0, xt, vt, Et));
                      break;
                    case s:
                      _t.trigger("pinchOut", [bt || null, yt || 0, ft || 0, xt, vt, Et]), T.pinchOut && (m = T.pinchOut.call(_t, i, bt || null, yt || 0, ft || 0, xt, vt, Et))
                  }
                }
                return c == h ? l !== k && l !== _ || (clearTimeout(At), clearTimeout(Ot), Y() && !G() ? (Lt = ot(), At = setTimeout(t.proxy(function () {
                  Lt = null, _t.trigger("tap", [i.target]), T.tap && (m = T.tap.call(_t, i, i.target))
                }, this), T.doubleTapThreshold)) : (Lt = null, _t.trigger("tap", [i.target]), T.tap && (m = T.tap.call(_t, i, i.target)))) : c == p ? l !== k && l !== _ || (clearTimeout(At), Lt = null, _t.trigger("doubletap", [i.target]), T.doubleTap && (m = T.doubleTap.call(_t, i, i.target))) : c == f && (l !== k && l !== _ || (clearTimeout(At), Lt = null, _t.trigger("longtap", [i.target]), T.longTap && (m = T.longTap.call(_t, i, i.target)))), m
              }

              function D() {
                var t = !0;
                return null !== T.threshold && (t = ht >= T.threshold), t
              }

              function R() {
                var t = !1;
                return null !== T.cancelThreshold && null !== pt && (t = et(pt) - ht >= T.cancelThreshold), t
              }

              function H() {
                return !(T.maxTimeThreshold && ft >= T.maxTimeThreshold)
              }

              function F() {
                var t = z(),
                  e = W(),
                  n = null === T.pinchThreshold || yt >= T.pinchThreshold;
                return t && e && n
              }

              function q() {
                return !!(T.pinchStatus || T.pinchIn || T.pinchOut)
              }

              function B() {
                var t = H(),
                  e = D(),
                  n = z(),
                  i = W();
                return !R() && i && n && e && t
              }

              function V() {
                return !!(T.swipe || T.swipeStatus || T.swipeLeft || T.swipeRight || T.swipeUp || T.swipeDown)
              }

              function z() {
                return xt === T.fingers || T.fingers === v || !x
              }

              function W() {
                return 0 !== Et[0].end.x
              }

              function U() {
                return !!T.tap
              }

              function Y() {
                return !!T.doubleTap
              }

              function G() {
                if (null == Lt) return !1;
                var t = ot();
                return Y() && t - Lt <= T.doubleTapThreshold
              }

              function X() {
                Tt = ot(), jt = event.touches.length + 1
              }

              function Q() {
                Tt = 0, jt = 0
              }

              function J() {
                var t = !1;
                return Tt && ot() - Tt <= T.fingerReleaseThreshold && (t = !0), t
              }

              function Z(t) {
                !0 === t ? (_t.bind(lt, L), _t.bind(ct, A), ut && _t.bind(ut, P)) : (_t.unbind(lt, L, !1), _t.unbind(ct, A, !1), ut && _t.unbind(ut, P, !1)), _t.data(S + "_intouch", !0 === t)
              }

              function K(t, e) {
                var n = void 0 !== e.identifier ? e.identifier : 0;
                return Et[t].identifier = n, Et[t].start.x = Et[t].end.x = e.pageX || e.clientX, Et[t].start.y = Et[t].end.y = e.pageY || e.clientY, Et[t]
              }

              function tt(t) {
                var e = function (t) {
                  for (var e = 0; e < Et.length; e++)
                    if (Et[e].identifier == t) return Et[e]
                }(void 0 !== t.identifier ? t.identifier : 0);
                return e.end.x = t.pageX || t.clientX, e.end.y = t.pageY || t.clientY, e
              }

              function et(t) {
                if (wt[t]) return wt[t].distance
              }

              function nt(t) {
                return {
                  direction: t,
                  distance: 0
                }
              }

              function it() {
                return St - Ct
              }

              function rt(t, e) {
                var n = Math.abs(t.x - e.x),
                  i = Math.abs(t.y - e.y);
                return Math.round(Math.sqrt(n * n + i * i))
              }

              function ot() {
                return (new Date).getTime()
              }
              var at = x || C || !T.fallbackToMouseEvents,
                st = at ? C ? E ? "MSPointerDown" : "pointerdown" : "touchstart" : "mousedown",
                lt = at ? C ? E ? "MSPointerMove" : "pointermove" : "touchmove" : "mousemove",
                ct = at ? C ? E ? "MSPointerUp" : "pointerup" : "touchend" : "mouseup",
                ut = at ? null : "mouseleave",
                dt = C ? E ? "MSPointerCancel" : "pointercancel" : "touchcancel",
                ht = 0,
                pt = null,
                ft = 0,
                mt = 0,
                gt = 0,
                vt = 1,
                yt = 0,
                bt = 0,
                wt = null,
                _t = t(i),
                kt = "start",
                xt = 0,
                Et = null,
                Ct = 0,
                St = 0,
                Tt = 0,
                jt = 0,
                Lt = 0,
                At = null,
                Ot = null;
              try {
                _t.bind(st, j), _t.bind(dt, O)
              } catch (e) {
                t.error("events not supported " + st + "," + dt + " on jQuery.swipe")
              }
              this.enable = function () {
                return _t.bind(st, j), _t.bind(dt, O), _t
              }, this.disable = function () {
                return N(), _t
              }, this.destroy = function () {
                return N(), _t.data(S, null), _t
              }, this.option = function (e, n) {
                if (void 0 !== T[e]) {
                  if (void 0 === n) return T[e];
                  T[e] = n
                } else t.error("Option " + e + " does not exist on jQuery.swipe.options");
                return null
              }
            }(this, i), T.data(S, j))
          })
        }.apply(this, arguments);
        return j
      }, t.fn.swipe.defaults = {
        fingers: 1,
        threshold: 75,
        cancelThreshold: null,
        pinchThreshold: 20,
        maxTimeThreshold: null,
        fingerReleaseThreshold: 250,
        longTapThreshold: 500,
        doubleTapThreshold: 200,
        swipe: null,
        swipeLeft: null,
        swipeRight: null,
        swipeUp: null,
        swipeDown: null,
        swipeStatus: null,
        pinchIn: null,
        pinchOut: null,
        pinchStatus: null,
        click: null,
        tap: null,
        doubleTap: null,
        longTap: null,
        hold: null,
        triggerOnTouchEnd: !0,
        triggerOnTouchLeave: !1,
        allowPageScroll: "auto",
        fallbackToMouseEvents: !0,
        excludedElements: "label, button, input, select, textarea, a, .noSwipe"
      }, t.fn.swipe.phases = {
        PHASE_START: b,
        PHASE_MOVE: w,
        PHASE_END: _,
        PHASE_CANCEL: k
      }, t.fn.swipe.directions = {
        LEFT: e,
        RIGHT: n,
        UP: r,
        DOWN: o,
        IN: a,
        OUT: s
      }, t.fn.swipe.pageScroll = {
        NONE: l,
        HORIZONTAL: m,
        VERTICAL: g,
        AUTO: c
      }, t.fn.swipe.fingers = {
        ONE: 1,
        TWO: 2,
        THREE: 3,
        ALL: v
      }
    })
  }, {}],
  347: [function (t, e, n) {
    "use strict";
    e.exports = function (e) {
      var n = t("nl-event-emitter"),
        i = !0;
      this.el = document.createElement("a"), this.el.className = "arrow", this.el.setAttribute("href", "#"), this.direction = e, n.createEmitter(this), this.disable = function () {
        i = !1, this.el.setAttribute("data-enabled", i)
      }.bind(this), this.enable = function () {
        i = !0, this.el.setAttribute("data-enabled", i)
      }.bind(this), this.hide = function () {
        this.el.setAttribute("data-hidden", !0)
      }.bind(this), this.show = function () {
        this.el.setAttribute("data-hidden", !1)
      }.bind(this);
      var r = function (t) {
        t.preventDefault(), i && this.trigger("clicked", this.direction)
      }.bind(this);
      this.el.addEventListener("click", r)
    }
  }, {
    "nl-event-emitter": 47
  }],
  348: [function (t, e, n) {
    "use strict";
    e.exports = function (e) {
      function n(t) {
        var e, n = p(this.index.current());
        e = "previous" === t ? this.index.decrement() : this.index.increment();
        var i = p(e),
          r = f(e);
        i.on("transition-complete", function () {
          i.off("transition-complete"), i.videoPlayer.showControls(), n.videoPlayer.player.el().classList.contains("vjs-ended") && n.videoPlayer.rebuild(), c && i.videoPlayer.canAutoplay() && i.play(), this.root.setAttribute("data-slide-direction", "")
        }.bind(this)), d(n), this.root.setAttribute("data-slide-direction", t), m(r), u(i), this.trigger("index-selected", e), this.root.setAttribute("data-selected-index", e)
      }
      var i = t("underscore"),
        r = t("./VideoPlayer"),
        o = t("./IndexMachine"),
        a = t("nl-event-emitter"),
        s = t("./Arrow"),
        l = t("../analytics"),
        c = !1,
        u = function (t) {
          t.videoPlayer.on("next", function () {
            t.videoPlayer.off("next"), this.next()
          }.bind(this)), t.el.setAttribute("data-activated", !0)
        }.bind(this),
        d = function (t) {
          t.videoPlayer.off("next"), t.el.setAttribute("data-activated", !1), t.videoPlayer.INITIALIZED ? t.videoPlayer.deactivate() : t.videoPlayer.abortLoading()
        },
        h = function (t) {
          this.play = function () {
              this.videoPlayer.play()
            }.bind(this), this.reset = function () {
              this.videoPlayer.deactivate()
            }.bind(this), this.setWidth = function (t) {
              this.width = t, this.el.style.width = t + "px"
            }.bind(this), this.setHeight = function (t) {
              this.height = t, this.el.style.height = t + "px"
            }.bind(this), this.setX = function (t) {
              this.coordinates.x = t;
              var e = "translateX(" + t + "px)";
              this.el.style.webkitTransform = e, this.el.style.transform = e
            }.bind(this),
            function (t) {
              a.createEmitter(this), this.el = t.el, this.el.classList.add("slide"), this.el.setAttribute("data-animate-transition", !1), this.index = t.index, this.el.setAttribute("data-index", this.index), this.coordinates = {
                x: 0
              }, this.videoPlayer = t.videoPlayer
            }.call(this, t)
        },
        p = function (t) {
          var e;
          if (this.slides[t]) e = this.slides[t];
          else {
            if (t < 0) return this.slides[this.slides.length + t];
            t >= this.slides.length && (e = this.slides[t % this.slides.length])
          }
          return e
        }.bind(this),
        f = function (t) {
          for (var e = [], n = t - 2; n <= t + 2; n++) e.push(p(n));
          return e
        }.bind(this),
        m = function (t, e) {
          var n = t[2];
          i.difference(this.slides, t).forEach(function (t) {
            t.el.setAttribute("data-detached", "true")
          });
          var r = function t() {
            n.el.removeEventListener("transitionend", t), n.el.removeEventListener("webkitTransitionEnd", t), n.trigger("transition-complete")
          };
          n.el.addEventListener("transitionend", r), n.el.addEventListener("webkitTransitionEnd", r);
          for (var o = 0; o < t.length; o++) {
            var a = t[o];
            a.el.setAttribute("data-detached", "false");
            var s = (o - 2) * (a.width + 10);
            e ? a.el.setAttribute("data-animate-transition", !1) : s > 0 && a.coordinates.x < 0 || s < 0 && a.coordinates.x > 0 ? a.el.setAttribute("data-animate-transition", !1) : a.el.setAttribute("data-animate-transition", !0), a.setX(s)
          }
        }.bind(this);
      this.next = function () {
          n.call(this, "next")
        }.bind(this), this.previous = function () {
          n.call(this, "previous")
        }.bind(this), this.layout = function () {
          for (var t = this.root.querySelector(".slider").offsetWidth, e = .5625 * t, n = 0; n < this.slides.length; n++) {
            var i = this.slides[n];
            i.setWidth(t), i.setHeight(e)
          }
          m(f(this.index.current()), !0)
        }.bind(this),
        function (t) {
          a.createEmitter(this), this.index = new o({
              length: t.payload.length
            }), this.config = t, this.root = t.root, this.root.classList.add("endless-video-slider"),
            function () {
              var t = this.root.querySelector(".slider"),
                e = document.createElement("ol");
              e.classList.add("slides"), t.appendChild(e);
              var n = [],
                i = [];
              this.config.payload.forEach(function (t, o) {
                var a = document.createElement("div");
                a.classList.add("video-player-wrapper");
                var s = document.createElement("li");
                s.appendChild(a), e.appendChild(s);
                var l = new r({
                  el: a,
                  metadata: t
                });
                i.push(l), n.push(new h({
                  index: o,
                  el: s,
                  videoPlayer: l
                }))
              }), this.videos = i, this.slides = n, this.root.appendChild(t)
            }.call(this),
            function () {
              var t = this.root.querySelector(".slider"),
                e = i.throttle(this.previous, 600, {
                  trailing: !1
                }),
                n = document.createElement("div");
              n.classList.add("control-zone", "left");
              var r = new s("previous");
              r.el.classList.add("previous", "icon", "icon-arrow-gallery-previous-small"), n.appendChild(r.el), t.appendChild(n), n.addEventListener("click", function (t) {
                t.preventDefault(), e(), l.trackEvent({
                  gtm: {
                    event: "gaEvent",
                    gaCategory: "videos",
                    gaAction: "nestcam best hero clip",
                    gaLabel: "left"
                  }
                })
              }.bind(this));
              var o = i.throttle(this.next, 600, {
                  trailing: !1
                }),
                a = document.createElement("div");
              a.classList.add("control-zone", "right");
              var c = new s("next");
              c.el.classList.add("next", "icon", "icon-arrow-gallery-next-small"), a.appendChild(c.el), t.appendChild(a), a.addEventListener("click", function (t) {
                t.preventDefault(), o(), l.trackEvent({
                  gtm: {
                    event: "gaEvent",
                    gaCategory: "videos",
                    gaAction: "nestcam best hero clip",
                    gaLabel: "right"
                  }
                })
              }.bind(this)), this.controls = {
                previous: n,
                next: a
              }
            }.call(this), this.layout(), a.on("windowResizeEnd", this.layout), m(f(0), !0), u.call(this, this.slides[0])
        }.call(this, e)
    }
  }, {
    "../analytics": 136,
    "./Arrow": 347,
    "./IndexMachine": 349,
    "./VideoPlayer": 353,
    "nl-event-emitter": 47,
    underscore: 58
  }],
  349: [function (t, e, n) {
    "use strict";
    var i = t("nl-event-emitter");
    e.exports = function (t) {
      this.config = t, this.length = t.length;
      var e;
      this.current = function (t) {
        if (void 0 === t) return e;
        o(t)
      };
      var n = function (t) {
          return t >= this.length ? t = this.length - 1 : t < 0 && (t = 0), t
        }.bind(this),
        r = function (t) {
          return t >= this.length ? t %= this.length : t < 0 && (t = this.length - Math.abs(t % this.length)), t
        }.bind(this),
        o = function (t) {
          return t = this.config.clamp ? n(t) : r(t), e = t, this.trigger("update", e), e
        }.bind(this);
      this.increment = function () {
          return o(this.current() + 1)
        }.bind(this), this.decrement = function () {
          return o(this.current() - 1)
        }.bind(this),
        function () {
          i.createEmitter(this), o(0)
        }.call(this)
    }
  }, {
    "nl-event-emitter": 47
  }],
  350: [function (t, e, n) {
    "use strict";
    e.exports = function (e) {
      var n = t("nl-event-emitter"),
        i = t("./VideoTile"),
        r = t("./Arrow"),
        o = function (t) {
          var e = this.pages[this.currentIndex],
            n = "left";
          e && (e.pageNumber < t.pageNumber ? e.hide(n) : e.pageNumber > t.pageNumber && (n = "right", e.hide(n))), t.show(n), this.setIndex(t.pageNumber), window.setTimeout(this.setHeight, 0)
        }.bind(this);
      this.nextPage = function () {
        var t;
        t = void 0 === this.currentIndex ? 0 : this.currentIndex + 1, o(this.pages[t])
      }.bind(this), this.previousPage = function () {
        var t;
        t = void 0 === this.currentIndex ? 0 : this.currentIndex - 1, o(this.pages[t])
      }.bind(this), this.setIndex = function (t) {
        this.currentIndex = t, this.trigger("index-selected", this.currentIndex)
      }.bind(this), this.setHeight = function (t) {
        t || (t = this.pages[this.currentIndex].el.offsetHeight), t && t !== this.container.offsetHeight && (this.container.style.height = t + "px", this.trigger("height-changed"))
      }.bind(this), this.enableClickHandlers = function () {
        this.arrows.previous.on("clicked", this.previousPage), this.arrows.next.on("clicked", this.nextPage), this.arrows.container.setAttribute("data-enabled", "true")
      }.bind(this), this.disableClickHandlers = function () {
        this.arrows.previous.off("clicked"), this.arrows.next.off("clicked"), this.arrows.container.setAttribute("data-enabled", "false")
      }.bind(this);
      var a = function () {
        var t = this.currentIndex;
        0 === t ? this.arrows.previous.disable() : this.arrows.previous.enable(), t === this.pages.length - 1 ? this.arrows.next.disable() : this.arrows.next.enable()
      }.bind(this);
      (function (t) {
        this.config = t, n.createEmitter(this), this.el = this.config.el, this.el.classList.add("paginated-video-grid"), this.container = document.createElement("ol"), this.container.classList.add("pages"), this.el.appendChild(this.container), this.pages = function () {
          for (var t = this.el.querySelector("ol.pages"), e = [], n = 0; n < this.config.payload.length; n++) {
            var r = Math.floor(n / this.config.pageSize);
            e[r] || (e[r] = []), e[r].push(this.config.payload[n])
          }
          var o = [];
          return e.forEach(function (e, n) {
            var r = new function (t, e) {
              this.show = function (t) {
                var e = "from-" + t,
                  n = function (t) {
                    "opacity" === t.propertyName && (this.el.removeEventListener("transitionend", n), this.el.removeEventListener("msTransitionEnd", n), this.el.removeEventListener("webkitTransitionEnd", n), this.el.setAttribute("data-transition-style", "none"))
                  }.bind(this);
                this.el.addEventListener("transitionend", n), this.el.addEventListener("msTransitionEnd", n), this.el.addEventListener("webkitTransitionEnd", n), window.setTimeout(function () {
                  this.el.setAttribute("data-transition-style", e), this.el.setAttribute("data-position", "current")
                }.bind(this), 0)
              }.bind(this), this.hide = function (t) {
                this.el.setAttribute("data-position", t)
              }.bind(this);
              var n = function () {
                var t = document.createElement("ol");
                t.classList.add("video-grid"), this.el.appendChild(t), this.list.forEach(function (e) {
                  var n = new i(e);
                  t.appendChild(n.el)
                })
              }.bind(this);
              (function (t, e) {
                this.list = t, this.pageNumber = e, this.el = document.createElement("li"), this.el.classList.add("page"), n()
              }).call(this, t, e)
            }(e, n);
            r.pageNumber > 0 && r.el.setAttribute("data-position", "right"), o.push(r), t.appendChild(r.el)
          }), o
        }.call(this), this.pages.length > 1 && (function () {
          this.arrows = {
            previous: new r("previous"),
            next: new r("next")
          }, this.arrows.previous.el.classList.add("previous", "icon", "icon-arrow-gallery-previous-small"), this.arrows.next.el.classList.add("next", "icon", "icon-arrow-gallery-next-small"), this.arrows.container = document.createElement("div"), this.arrows.container.classList.add("video-grid-controls"), this.arrows.container.appendChild(this.arrows.previous.el), this.arrows.container.appendChild(this.arrows.next.el), this.el.appendChild(this.arrows.container), this.enableClickHandlers(), this.on("disable-next-control", function () {}), this.on("disable-previous-control", function () {})
        }.call(this), this.on("index-selected", a)), window.setTimeout(function () {
          o(this.pages[0]), n.on("windowResizeEnd", function () {
            this.setHeight()
          }.bind(this))
        }.bind(this), 0)
      }).call(this, e)
    }
  }, {
    "./Arrow": 347,
    "./VideoTile": 354,
    "nl-event-emitter": 47
  }],
  351: [function (t, e, n) {
    "use strict";
    var i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (t) {
        return typeof t
      } : function (t) {
        return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
      },
      r = t("nl-event-emitter");
    e.exports = function (t) {
      var e, n, o = function (t) {
          "object" === (void 0 === t ? "undefined" : i(t)) ? (this.value = t.value, this.label = t.label) : this.value = this.label = t;
          var e = function () {
            this.trigger("click")
          }.bind(this);
          this.activate = function () {
              this.el.classList.add("active")
            }.bind(this), this.deactivate = function () {
              this.el.classList.remove("active")
            }.bind(this),
            function () {
              r.createEmitter(this), this.el = document.createElement("li"), this.el.textContent = this.label, this.el.addEventListener("click", e)
            }.call(this)
        },
        a = function (t) {
          n !== t && (n && n.deactivate(), t.activate(), n = t, this.trigger("selected", t.value))
        }.bind(this);
      this.selectIndex = function (t) {
          a(this.segments[t])
        }.bind(this),
        function (t) {
          this.list = t, this.el = function () {
            (e = document.createElement("ul")).classList.add("pill-controls"), this.segments = [];
            for (var t = 0; t < this.list.length; t++) {
              var n = new o(this.list[t]);
              n.index = t, e.appendChild(n.el), this.segments.push(n)
            }
            return e
          }.call(this), this.segments.forEach(function (t) {
            t.on("click", function () {
              a(t)
            })
          }), r.createEmitter(this)
        }.call(this, t)
    }
  }, {
    "nl-event-emitter": 47
  }],
  352: [function (t, e, n) {
    "use strict";
    e.exports = function (e) {
      var n, i, r, o = t("./VideoTile"),
        a = t("../analytics"),
        s = function () {
          (i = {}).el = document.createElement("a"), i.el.href = "#", i.el.classList.add("nl-button", "blue"), i.el.textContent = "load more", i.el.addEventListener("click", function (t) {
            t.preventDefault(), l(), a.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "videos",
                gaAction: "nestcam best clip link",
                gaLabel: "load more"
              }
            })
          }), i.show = function () {
            i.el.setAttribute("data-enabled", !0)
          }, i.hide = function () {
            i.el.setAttribute("data-enabled", !1)
          }, this.el.appendChild(i.el)
        }.bind(this),
        l = function () {
          for (var t = this.config.pageSize, e = 0; e < t; e++) {
            var a = r.pop();
            if (!a) break;
            var s = new o(a);
            n.appendChild(s.el), s.show(), this.tiles.push(s)
          }
          r.length ? i.show() : i.hide()
        }.bind(this);
      (function (t) {
        this.config = t, this.el = this.config.el, (n = document.createElement("ol")).classList.add("video-grid"), this.el.appendChild(n), this.tiles = [], (r = this.config.payload).reverse(), s(), l()
      }).call(this, e)
    }
  }, {
    "../analytics": 136,
    "./VideoTile": 354
  }],
  353: [function (t, e, n) {
    "use strict";
    e.exports = function (e) {
      var n, i = t("nl-event-emitter"),
        r = t("nl-utilities"),
        o = t("nl-client"),
        a = t("video.js"),
        s = t("../analytics"),
        l = {
          "live-stream": {
            controls: !0,
            autoplay: !1,
            preload: !0,
            bigPlayButton: !0,
            posterImage: !0,
            techOrder: ["flash", "html5"],
            flash: {
              swf: "//" + document.location.host + "/vendor/video-js.swf"
            },
            controlBar: {
              muteToggle: !0,
              progressControl: !1,
              remainingTimeDisplay: !1,
              volumeMenuButton: !1,
              playToggle: !1
            }
          },
          clip: {
            controls: !1,
            youtube: {
              ytControls: 2,
              iv_load_policy: 3,
              modestbranding: 1
            },
            autoplay: !1,
            preload: !0,
            bigPlayButton: !0,
            techOrder: ["youtube", "html5", "flash"],
            controlBar: {
              durationDisplay: !1,
              currentTimeDisplay: !0,
              remainingTimeDisplay: !1,
              timeDivider: !1
            }
          }
        },
        c = function (t) {
          this.config = t, i.createEmitter(this), u(t)
        }.bind(this),
        u = function (t) {
          this.el = t.el, this.el.classList.add("nl-video-player");
          var e = "nest-video_" + (new Date).getTime();
          this.playerEl = document.createElement("video"), this.playerEl.id = e, this.playerEl.classList.add("video-js", "vjs-default-skin"), this.el.appendChild(this.playerEl), this.errorOverlay = new p({
            template: document.querySelector(".nl-video-overlay.error.template")
          }), this.el.appendChild(this.errorOverlay.el), this.on("error", function (t) {
            this.errorOverlay.show(t)
          }.bind(this)), d(t)
        }.bind(this),
        d = function (e) {
          if (e.metadata) {
            this.metadata = e.metadata, this.playerEl.setAttribute("data-identifier", this.metadata.identifier), this.playerEl.setAttribute("poster", this.metadata.posterImage || ""), this.vjsOpts = l[this.metadata.kind], this.config.vjsOpts && (this.vjsOpts = r.extend(this.vjsOpts, this.config.vjsOpts)), (o.isIOS() || o.isAndroid()) && (this.config.mobile = !0, this.el.setAttribute("data-mobile", !0)), this.INITIALIZED = !1, n = !1;
            var i;
            "clip" === this.metadata.kind ? i = function () {
              this.adOverlay = new h({
                template: document.querySelector(".nl-video-overlay.end.template"),
                poster: this.metadata.posterImage
              }), this.adOverlay.on("replay", function () {
                this.trigger("replay")
              }.bind(this)), this.adOverlay.on("next", function () {
                this.trigger("next")
              }.bind(this)), this.el.appendChild(this.adOverlay.el), a.plugin("yt", t("videojs-youtube")), this.config.mobile && (this.vjsOpts.posterImage = !1), this.vjsOpts.sources = this.metadata.sources;
              var e = a(this.playerEl.id, this.vjsOpts);
              return e.on("ended", this.revealAdOverlay), this.on("replay", this.replay), e.one("play", function () {
                ! function (t) {
                  function e() {
                    n = t.player.currentTime(), r.forEach(function (t) {
                      n >= t.value && (t.triggered = !0, s.trackEvent({
                        gtm: {
                          event: "gaEvent",
                          gaCategory: "videos",
                          gaAction: "nestcam selected clip",
                          gaLabel: t.label
                        }
                      }))
                    }), (r = r.filter(function (t) {
                      return !t.triggered
                    })).length || t.player.off("timeupdate", e)
                  }
                  var n, i = Math.round(t.player.duration()),
                    r = [{
                      value: 0,
                      label: "start"
                    }, {
                      value: .1 * i,
                      label: "10%"
                    }, {
                      value: .5 * i,
                      label: "50%"
                    }, {
                      value: .9 * i,
                      label: "90%"
                    }];
                  t.player.on("timeupdate", e)
                }(this)
              }.bind(this)), e
            }.call(this) : "live-stream" === this.metadata.kind && (i = function () {
              this.metadata.isOnline || this.trigger("error", "live-stream");
              var t = document.createElement("div");
              t.className = "live-label", t.textContent = "Live", this.el.appendChild(t), this.metadata.sources && this.metadata.sources.forEach(function (t) {
                var e = document.createElement("source");
                e.src = t.url, e.type = t.type, this.playerEl.appendChild(e)
              }.bind(this));
              var e = a(this.playerEl.id, this.vjsOpts);
              return e.one("play", function () {
                this.el.setAttribute("data-live", !0),
                  function (t) {
                    function e() {
                      n = Date.now(), o += (n - r) / 1e3, l.forEach(function (t) {
                        o >= t.value && (t.triggered = !0, s.trackEvent({
                          gtm: {
                            event: "gaEvent",
                            gaCategory: "videos",
                            gaAction: "nestcam selected stream",
                            gaLabel: t.label
                          }
                        }))
                      }), l = l.filter(function (t) {
                        return !t.triggered
                      }), o >= 300 && (s.trackEvent({
                        gtm: {
                          event: "gaEvent",
                          gaCategory: "videos",
                          gaAction: "nestcam selected stream",
                          gaLabel: "5 minutes"
                        }
                      }), o = 0), r = n
                    }
                    var n, i = Date.now(),
                      r = i,
                      o = 0,
                      a = window.setInterval(e, 1e3);
                    t.player.on("pause", function () {
                      window.clearInterval(a), t.player.one("play", function () {
                        i = Date.now(), r = i, a = window.setInterval(e, 1e3)
                      })
                    });
                    var l = [{
                      value: 0,
                      label: "start"
                    }, {
                      value: 3,
                      label: "3 seconds"
                    }, {
                      value: 60,
                      label: "1 minute"
                    }]
                  }(this)
              }.bind(this)), e
            }.call(this)), i.one("click", function () {
              this.el.classList.add("player-activated")
            }.bind(this)), i.one("play", function () {
              n ? this.rebuild() : this.INITIALIZED = !0
            }.bind(this)), this.player = i, this.trigger("ready")
          } else this.trigger("error")
        }.bind(this);
      this.showControls = function () {
        this.player.userActive(!0)
      }.bind(this), this.hideControls = function () {
        this.player.userActive(!1)
      }.bind(this), this.restart = function () {
        this.INITIALIZED && "clip" === this.metadata.kind && (this.hideAdOverlay(), this.player.pause().currentTime(0), this.showControls())
      }.bind(this), this.replay = function () {
        this.config.mobile ? (this.restart(), this.player.play()) : (this.restart(), this.canAutoplay() && this.player.play())
      }.bind(this), this.play = function () {
        this.el.classList.add("player-activated"), this.player.play()
      }.bind(this), this.pause = function () {
        this.INITIALIZED && (this.player.pause(), this.showControls())
      }.bind(this), this.deactivate = function () {
        this.pause()
      }.bind(this), this.abortLoading = function () {
        this.player && this.player.el().classList.contains("vjs-waiting") && (n = !0)
      }.bind(this), this.dispose = function () {
        this.INITIALIZED = !1, this.player.dispose(), this.adOverlay.el.parentNode.removeChild(this.adOverlay.el)
      }.bind(this), this.rebuild = function () {
        this.dispose(), u(this.config)
      }.bind(this), this.canAutoplay = function () {
        return !this.config.mobile
      }.bind(this);
      var h = function (t) {
        this.show = function () {
            this.el.setAttribute("data-visible", !0)
          }.bind(this), this.hide = function () {
            this.el.setAttribute("data-visible", !1)
          }.bind(this),
          function () {
            i.createEmitter(this), this.el = t.template.cloneNode(!0), this.el.classList.remove("template"), this.el.style.backgroundImage = "url(" + t.poster + ")", this.el.querySelector(".control-buttons").querySelector(".replay").addEventListener("click", function (t) {
              t.preventDefault(), this.trigger("replay"), s.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "nestcam selected clip",
                  gaLabel: "restart"
                }
              })
            }.bind(this)), this.el.querySelector(".control-buttons").querySelector(".next").addEventListener("click", function (t) {
              t.preventDefault(), this.trigger("next"), s.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "nestcam selected clip",
                  gaLabel: "next video"
                }
              })
            }.bind(this)), this.el.querySelector(".link.indoor a").addEventListener("click", function () {
              s.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "nestcam selected clip",
                  gaLabel: "get nestcam indoor"
                }
              })
            }), this.el.querySelector(".link.outdoor a").addEventListener("click", function () {
              s.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "nestcam selected clip",
                  gaLabel: "get nestcam outdoor"
                }
              })
            })
          }.call(this)
      };
      this.hideAdOverlay = function () {
        this.adOverlay && this.adOverlay.hide()
      }.bind(this), this.revealAdOverlay = function () {
        this.adOverlay && (this.adOverlay.show(), s.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "videos",
            gaAction: "nestcam selected clip",
            gaLabel: "end screen"
          }
        }), this.trigger("reveal-overlay"))
      }.bind(this);
      var p = function (t) {
        this.show = function (t) {
            t = t || "default";
            var e = this.el.querySelector("[data-error-code=" + t + "]");
            e && e.setAttribute("data-visible", !0), this.el.setAttribute("data-visible", !0)
          }.bind(this),
          function () {
            this.el = t.template.cloneNode(!0), this.el.classList.remove("template")
          }.call(this)
      };
      c(e)
    }
  }, {
    "../analytics": 136,
    "nl-client": 42,
    "nl-event-emitter": 47,
    "nl-utilities": 53,
    "video.js": 60,
    "videojs-youtube": 61
  }],
  354: [function (t, e, n) {
    "use strict";
    var i = t("./utils/makeVideoURL");
    e.exports = function (t) {
      this.show = function () {
          this.el.setAttribute("data-visible", !0)
        }.bind(this),
        function (t) {
          this.config = t, this.el = document.createElement("li"), this.el.classList.add("video-tile"), $(this.el).data("config", t);
          var e = document.createElement("span");
          this.config.posterImage && (e.style.backgroundImage = "url('" + this.config.posterImage + "')"), e.setAttribute("role", "img");
          var n = document.createElement("a");
          n.classList.add("overlay"), t.kind = function (t) {
            return "live-streams" === t ? t = "live" : "clips" === t ? t = "clip" : "categories" === t && (t = "category"), t
          }(t.path);
          var r = i(t);
          n.classList.add("action-overlay"), n.href = r, e.appendChild(n), this.el.appendChild(e);
          var o = document.createElement("div");
          o.classList.add("title");
          var a = document.createElement("a");
          a.href = r, a.textContent = this.config.title, o.appendChild(a), this.el.appendChild(o)
        }.call(this, t)
    }
  }, {
    "./utils/makeVideoURL": 365
  }],
  355: [function (t, e, n) {
    "use strict";
    var i = t("../VideoGrid"),
      r = t("../utils/getSlug"),
      o = t("../utils/fetch"),
      a = t("../../analytics"),
      s = t("../utils/makeBanner"),
      l = t("../utils/makeCategoryPicker"),
      c = t("../utils/globalAnalytics");
    e.exports = {
      init: function () {
        var t = document.querySelector("#category-grid"),
          e = "//" + t.getAttribute("data-api-endpoint") + "/api/categories/" + r("/category/");
        o(e, function (e) {
          var n = document.createElement("div");
          n.classList.add("meta");
          var r = document.createElement("h1");
          r.textContent = e.title, n.appendChild(r);
          var o = document.createElement("p");
          o.textContent = e.description, n.appendChild(o), t.appendChild(n);
          var l = new i({
            payload: e.items,
            pageSize: 12,
            el: t
          });
          $(l.el).on("click", "li.video-tile", function () {
            var t = $(this).data("config");
            a.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "videos",
                gaAction: "nestcam best clip",
                gaLabel: t.slug
              }
            })
          }), s()
        }), l(), c()
      }
    }
  }, {
    "../../analytics": 136,
    "../VideoGrid": 352,
    "../utils/fetch": 359,
    "../utils/getSlug": 360,
    "../utils/globalAnalytics": 361,
    "../utils/makeBanner": 362,
    "../utils/makeCategoryPicker": 363
  }],
  356: [function (t, e, n) {
    "use strict";
    var i = t("../utils/getSlug"),
      r = t("../VideoPlayer"),
      o = t("../VideoGrid"),
      a = t("../utils/fetch"),
      s = t("../utils/makeInfoPanel"),
      l = t("../utils/setDocumentMetadata"),
      c = t("../utils/makeBanner"),
      u = t("../../analytics"),
      d = t("../utils/globalAnalytics");
    e.exports = {
      init: function () {
        function t(t) {
          var i = new r({
            el: e.querySelector(".nl-video-player"),
            metadata: t
          });
          c(t), l(i.metadata);
          var d = s(i.metadata);
          e.querySelector(".info-panel-wrapper").appendChild(d), t.categories && t.categories.length && function (t, e) {
            a(t + "/api/categories/" + e.categories[0].slug, function (t) {
              var n = t.items;
              if (n && n.length) {
                n = n.filter(function (t) {
                  return t.id !== e.id
                });
                var i = new o({
                  payload: n,
                  pageSize: 6,
                  el: document.querySelector("#related-videos")
                });
                $(i.el).on("click", "li.video-tile", function () {
                  var t = $(this).data("config");
                  u.trackEvent({
                    gtm: {
                      event: "gaEvent",
                      gaCategory: "videos",
                      gaAction: "nestcam best clip related",
                      gaLabel: t.slug
                    }
                  })
                }), document.querySelector("#related-videos").classList.add("visible")
              }
            })
          }(n, i.metadata)
        }
        d();
        var e = document.querySelector("#nest-cam-clip"),
          n = "//" + e.getAttribute("data-api-endpoint");
        a(n + "/api/clips/" + i("/clip/")).then(t, t)
      }
    }
  }, {
    "../../analytics": 136,
    "../VideoGrid": 352,
    "../VideoPlayer": 353,
    "../utils/fetch": 359,
    "../utils/getSlug": 360,
    "../utils/globalAnalytics": 361,
    "../utils/makeBanner": 362,
    "../utils/makeInfoPanel": 364,
    "../utils/setDocumentMetadata": 366
  }],
  357: [function (t, e, n) {
    "use strict";

    function i() {
      var t = document.createElement("div");
      return t.classList.add("loading-indicator", "is-visible", "is-spinning"), t
    }
    var r = t("nl-event-emitter"),
      o = t("./SegmentedSwitch"),
      a = t("./PaginatedVideoGrid"),
      s = t("./EndlessVideoSlider"),
      l = t("./utils/makeInfoPanel"),
      c = t("./utils/fetch"),
      u = t("./utils/globalAnalytics"),
      d = t("../analytics"),
      h = t("./utils/makeBanner");
    e.exports = {
      init: function () {
        ! function () {
          var t = document.querySelector("#featured-video-slider"),
            e = t.getAttribute("data-api-endpoint");
          e = "//" + e + "/api/clips/?featured=true";
          var n = i();
          t.appendChild(n);
          var o = $.Deferred();
          c(e, function (e) {
            function i() {
              a()
            }

            function a() {
              var t = c.root.querySelector('.slide[data-activated="true"]').querySelector(".info-panel").offsetHeight;
              c.root.style.paddingBottom = t + "px"
            }
            t.removeChild(n);
            var c = new s({
              root: t,
              payload: e
            });
            c.slides.forEach(function (t, e) {
              var n = document.createElement("div");
              n.classList.add("info-panel-wrapper"), n.setAttribute("data-index", e), n.appendChild(l(t.videoPlayer.metadata)), t.el.appendChild(n)
            }), i(), r.on("windowResizeEnd", a), c.on("index-selected", i), c.videos[0].on("ready", function () {}), o.resolve()
          })
        }(),
        function () {
          var t = document.querySelector("#video-grid-chooser"),
            e = "//" + t.getAttribute("data-api-endpoint"),
            n = i();
          t.appendChild(n);
          var r = $.Deferred(),
            s = $.Deferred(),
            l = $.Deferred();
          $.when(s, l).done(function (e, i) {
            function s(e) {
              var n = t.querySelector(".resize-wrapper");
              if (e) n.style.height = e + "px";
              else {
                var i = t.querySelector(".paginated-video-grid.selected");
                i && (n.style.height = i.offsetHeight + "px")
              }
            }

            function l() {
              var t = $(this).data("config");
              d.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "nestcam best " + t.path,
                  gaLabel: t.slug
                }
              })
            }
            var c = new a({
                payload: e,
                el: document.querySelector("#video-grid-categories"),
                pageSize: 6
              }),
              u = new a({
                payload: i,
                el: document.querySelector("#video-grid-streams"),
                pageSize: 6
              });
            $(c.el).on("click", "li.video-tile", l), $(u.el).on("click", "li.video-tile", l);
            var h = function (e, n) {
              var i = [].slice.call(e);
              i = i.map(function (t) {
                return {
                  value: t.id,
                  label: t.getAttribute("data-label")
                }
              });
              var r = new o(i);
              return r.on("selected", n), t.insertBefore(r.el, t.querySelector(".resize-wrapper")), r
            }(t.querySelectorAll(".paginated-video-grid"), function (e) {
              var n = t.querySelector(".paginated-video-grid.selected");
              n && n.classList.remove("selected");
              var i = document.getElementById(e),
                r = i.offsetHeight;
              i.classList.add("selected"), s(r)
            });
            $(h.el).on("click", "li", function () {
              d.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "nestcam best categories",
                  gaLabel: this.textContent
                }
              })
            }), s(), h.selectIndex(0), t.removeChild(n), t.setAttribute("data-visible", !0), c.on("height-changed", s), u.on("height-changed", s), r.resolve()
          }), c(e + "/api/categories", s.resolve), c(e + "/api/live-streams", l.resolve)
        }(), h(), u()
      }
    }
  }, {
    "../analytics": 136,
    "./EndlessVideoSlider": 348,
    "./PaginatedVideoGrid": 350,
    "./SegmentedSwitch": 351,
    "./utils/fetch": 359,
    "./utils/globalAnalytics": 361,
    "./utils/makeBanner": 362,
    "./utils/makeInfoPanel": 364,
    "nl-event-emitter": 47
  }],
  358: [function (t, e, n) {
    "use strict";
    e.exports = {
      init: function () {
        function e(t) {
          var e = new i({
            el: l.querySelector(".nl-video-player"),
            metadata: t,
            vjsOpts: {
              autoplay: !0
            }
          });
          s(), e.canAutoplay() && e.play(), a(e.metadata);
          var n = o(e.metadata);
          l.querySelector(".info-panel-wrapper").appendChild(n)
        }
        var n = t("../utils/getSlug"),
          i = t("../VideoPlayer"),
          r = t("../utils/fetch"),
          o = t("../utils/makeInfoPanel"),
          a = t("../utils/setDocumentMetadata"),
          s = t("../utils/makeBanner");
        t("../utils/globalAnalytics")();
        var l = document.querySelector("#livestream");
        r("//" + l.getAttribute("data-api-endpoint") + "/api/live-streams/" + n("/live/")).then(e, e)
      }
    }
  }, {
    "../VideoPlayer": 353,
    "../utils/fetch": 359,
    "../utils/getSlug": 360,
    "../utils/globalAnalytics": 361,
    "../utils/makeBanner": 362,
    "../utils/makeInfoPanel": 364,
    "../utils/setDocumentMetadata": 366
  }],
  359: [function (t, e, n) {
    "use strict";
    e.exports = function (t, e) {
      var n = new XMLHttpRequest,
        i = $.Deferred();
      return i.then(e), n.onload = function () {
        this.status >= 200 && this.status < 400 ? i.resolve(JSON.parse(this.response)) : i.reject()
      }, n.onerror = function () {
        i.reject()
      }, n.open("GET", t), n.send(), i
    }
  }, {}],
  360: [function (t, e, n) {
    "use strict";
    e.exports = function (t) {
      var e = window.location.pathname.split(t)[1];
      return (e = e.split("/").filter(function (t) {
        return "" !== t
      }))[0]
    }
  }, {}],
  361: [function (t, e, n) {
    "use strict";
    e.exports = function () {
      var e = t("../../analytics"),
        n = document.querySelector(".global-header .back-link");
      n && n.addEventListener("click", function () {
          e.trackEvent({
            gtm: {
              event: "gaEvent",
              gaCategory: "videos",
              gaAction: "nestcam best clip link",
              gaLabel: "return to featured videos"
            }
          })
        }),
        function () {
          var t = document.querySelector(".video-not-an-advertisement-unit"),
            n = t.querySelector(".link-1 a");
          n && n.addEventListener("click", function () {
            e.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "videos",
                gaAction: "nestcam best banner",
                gaLabel: "get nestcam indoor"
              }
            })
          });
          var i = t.querySelector(".link-2 a");
          i && i.addEventListener("click", function () {
            e.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "videos",
                gaAction: "nestcam best banner",
                gaLabel: "get nestcam outdoor"
              }
            })
          });
          var r = t.querySelector("a.right-side");
          r && r.addEventListener("click", function () {
            e.trackEvent({
              gtm: {
                event: "gaEvent",
                gaCategory: "videos",
                gaAction: "nestcam best submit",
                gaLabel: "submit clip start"
              }
            })
          })
        }()
    }
  }, {
    "../../analytics": 136
  }],
  362: [function (t, e, n) {
    "use strict";

    function i() {
      var t = document.querySelector(".video-not-an-advertisement-unit");
      t && t.setAttribute("data-visible", !0)
    }
    var r = t("../../analytics");
    e.exports = function (t) {
      ! function (t, e) {
        return !(!e || !e.categories || !e.categories.filter(function (e) {
          return e.slug === t
        }).length)
      }("mystery-solved", t) ? i(): function () {
        var t = document.querySelector(".mystery-solved-banner");
        t ? (t.setAttribute("data-visible", !0), t.addEventListener("click", function () {
          r.trackEvent({
            gtm: {
              event: "gaEvent",
              gaCategory: "videos",
              gaAction: "nestcam mystery solved banner",
              gaLabel: "meet nest cam outdoor"
            }
          })
        }), document.body.classList.add("mystery-solved-page")) : i()
      }()
    }
  }, {
    "../../analytics": 136
  }],
  363: [function (t, e, n) {
    "use strict";
    var i = t("../utils/fetch"),
      r = t("./makeVideoURL");
    e.exports = function () {
      function t() {
        e.setAttribute("data-picker-open", !1), window.Modernizr.touchevents ? document.body.removeEventListener("touch", t) : document.body.removeEventListener("click", t), n = !1
      }
      var e = document.querySelector(".category-picker");
      if (e.style.display = "block", e) {
        var n = !1;
        i("//" + e.getAttribute("data-api-endpoint"), function (t) {
          t.forEach(function (t) {
            if ("mystery-solved" !== t.slug) {
              var n = e.querySelector("span.categories");
              n || ((n = document.createElement("span")).classList.add("categories"), e.insertBefore(n, e.querySelector("a.root")));
              var i = document.createElement("a");
              i.classList.add("category"), i.href = r(t), i.textContent = t.title, i.title = t.description, i.addEventListener("click", function (t) {
                t.stopPropagation()
              }), n.appendChild(i)
            }
          })
        }), e.addEventListener("click", function (i) {
          i.preventDefault(), i.stopPropagation(), n ? t() : (e.setAttribute("data-picker-open", !0), window.Modernizr.touchevents ? document.body.addEventListener("touch", t) : document.body.addEventListener("click", t), n = !0)
        })
      }
    }
  }, {
    "../utils/fetch": 359,
    "./makeVideoURL": 365
  }],
  364: [function (t, e, n) {
    "use strict";
    var i = t("./makeVideoURL"),
      r = t("../../analytics");
    e.exports = function (t) {
      var e = document.createElement("div");
      e.classList.add("info-panel");
      var n = document.createElement("h2");
      n.textContent = t.title, e.appendChild(n);
      var o = document.createElement("p");
      o.textContent = t.description, e.appendChild(o), e.appendChild(function (t) {
        var e = document.createElement("div");
        e.classList.add("share-container");
        var n = function (t) {
            function e(t) {
              t.preventDefault(), t.stopPropagation(), l.removeEventListener("click", e), document.body.removeEventListener("click", e), o.removeEventListener("click", e), s.setAttribute("data-visible", !1), o.setAttribute("data-pressed", !1)
            }

            function n() {
              o.removeEventListener("click", n), r.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "share nestcam best link",
                  gaLabel: t.title
                }
              })
            }
            var o = document.createElement("div");
            o.classList.add("permalink");
            var a = document.createElement("span");
            a.classList.add("text"), a.textContent = "Link", o.appendChild(a);
            var s = document.querySelector(".permalink-popover.template").cloneNode(!0);
            s.classList.remove("template"), s.querySelector("textarea").textContent = i(t), o.appendChild(s);
            var l = s.querySelector(".close-button");
            return o.addEventListener("click", function (t) {
              t.preventDefault(), t.stopPropagation(), s.setAttribute("data-visible", !0), o.setAttribute("data-pressed", !0), document.body.addEventListener("click", e), o.addEventListener("click", e), s.addEventListener("click", function (t) {
                t.stopPropagation()
              }), l.addEventListener("click", e)
            }), o.addEventListener("click", n), o
          }(t),
          o = function (t) {
            function e() {
              n.removeEventListener("click", e), r.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "share nestcam best twitter",
                  gaLabel: t.title
                }
              })
            }
            var n = document.createElement("div");
            n.classList.add("tweet");
            var o = document.createElement("span");
            return o.classList.add("text"), o.textContent = "Tweet", n.appendChild(o), n.addEventListener("click", function () {
              window.open("https://twitter.com/intent/tweet?text=" + i(t), void 0, "top=0,left=0,scrollbars,width=652,height=452")
            }), n.addEventListener("click", e), n
          }(t),
          a = function (t) {
            function e() {
              n.removeEventListener("click", e), r.trackEvent({
                gtm: {
                  event: "gaEvent",
                  gaCategory: "videos",
                  gaAction: "share nestcam best facebook",
                  gaLabel: t.title
                }
              })
            }
            var n = document.createElement("div");
            n.classList.add("share-fb");
            var o = document.createElement("span");
            return o.classList.add("text"), o.textContent = "Share", n.appendChild(o), n.addEventListener("click", function () {
              var e = window.encodeURI(i(t));
              window.open("https://www.facebook.com/sharer/sharer.php?u={escapedURL}".replace(/\{escapedURL\}/, e), void 0, "top=0,left=0,scrollbars,width=652,height=452")
            }), n.addEventListener("click", e), n
          }(t);
        return e.appendChild(n), e.appendChild(o), e.appendChild(a), e
      }(t));
      var a = function (t) {
        var e = window.parseInt(t.playCount, 10);
        if (e) {
          e = e.toLocaleString();
          var n = document.createElement("div");
          return n.classList.add("play-count"), n.textContent = e + " views", n
        }
      }(t);
      return a && e.appendChild(a), e
    }
  }, {
    "../../analytics": 136,
    "./makeVideoURL": 365
  }],
  365: [function (t, e, n) {
    "use strict";
    e.exports = function (t) {
      return window.location.protocol + "//" + window.location.host + window.encodeURI(["/video", function (t) {
        return "live-streams" === t ? t = "live" : "clips" === t ? t = "clip" : "categories" === t && (t = "category"), t
      }(t.path), t.slug, ""].join("/"))
    }
  }, {}],
  366: [function (t, e, n) {
    "use strict";
    e.exports = function (t) {
      document.title = t.title + " | " + document.title.split(" | ")[1], document.querySelector('meta[name="description"]').setAttribute("content", t.description)
    }
  }, {}],
  367: [function (t, e, n) {
    "use strict";

    function i() {
      return a.isMobile && window.matchMedia("(max-width: 767px)").matches
    }
    var r = t("../_modules/youtube_api"),
      o = t("nl-event-emitter"),
      a = t("nl-client"),
      s = !1,
      l = function (t) {
        var e, n, r, s = !1,
          l = !1,
          c = function () {
            (e = document.createElement("div")).classList.add("nl-lightbox-backdrop"), document.body.appendChild(e), e.addEventListener("click", function () {
              d()
            }.bind(this))
          }.bind(this),
          u = function (t) {
            l || (s = !0, l = !0, r = t, e || c(), window.setTimeout(function () {
              e.setAttribute("data-is-visible", !0), document.body.setAttribute("data-lightbox-is-open", !0), o.on("windowResizeEnd.lightbox", function () {
                t.zoomIn()
              }), t.on("zoomed", function () {
                t.off("zoomed"), l = !1
              }), t.activate()
            }, 20))
          },
          d = function (t) {
            function n(t) {
              "opacity" === t.propertyName && (e.removeEventListener("transitionend", n), s = !1, r = null, i.resolve())
            }
            if (!l) {
              var i = $.Deferred();
              return o.off("windowResizeEnd.lightbox"), r.on("zooming-out", function () {
                r.off("zooming-out"), document.body.setAttribute("data-lightbox-is-open", !1), e.addEventListener("transitionend", n), e.setAttribute("data-is-visible", !1)
              }), r.deactivate(), i
            }
          }.bind(this);
        ! function (t) {
          var e = t.querySelectorAll(".tile");
          n = [];
          for (var r = 0; r < e.length; r++) {
            var s = new function (t) {
              var n, s, l = e[r],
                c = function () {
                  this.el.setAttribute("data-activated", !0), this.playerFrame.addEventListener("click", x), u().then(function () {
                    if (this.trigger("zoomed"), k("zoomed"), s = !0, n) return p(), void this.player.playVideo();
                    h()
                  }.bind(this))
                }.bind(this);
              this.activate = c;
              var u = function () {
                var t = Math.max(document.documentElement.clientWidth, window.innerWidth || 0),
                  e = Math.max(document.documentElement.clientHeight, window.innerHeight || 0),
                  n = window.scrollY || document.documentElement.scrollTop,
                  i = $.Deferred(),
                  r = $.Deferred(),
                  o = $.Deferred(),
                  a = function () {
                    var n = this.closeButton.getBoundingClientRect().height + 40,
                      i = this.el.getBoundingClientRect(),
                      r = t - 60;
                    r > 960 && (r = 960);
                    var a = r / i.width,
                      s = i.height * a;
                    if (s + 2 * n > e && (a = (s = e - 2 * n) / i.height, r = i.width * a), a !== this.SCALAR) {
                      this.SCALAR = a;
                      var l = function (t) {
                        "transform" === t.propertyName && (this.playerFrame.removeEventListener("transitionend", l), o.resolve())
                      }.bind(this);
                      this.playerFrame.addEventListener("transitionend", l), this.playerFrame.style.transform = "translate(-50%, -50%) scale(" + a + ")"
                    } else o.resolve()
                  }.bind(this);
                return function () {
                  var i = this.el.getBoundingClientRect(),
                    o = t / 2 - i.width / 2;
                  o = Math.floor(o);
                  var a = n + e / 2 - i.height / 2;
                  a = Math.floor(a);
                  var s = o - i.left,
                    l = a - (n + i.top);
                  if (s !== this.deltaX || l !== this.deltaY) {
                    this.deltaX = s, this.deltay = l;
                    var c = function (t) {
                      "transform" === t.propertyName && (this.tileContent.removeEventListener("transitionend", c), r.resolve())
                    }.bind(this);
                    this.tileContent.addEventListener("transitionend", c), this.tileContent.style.transform = "translate(" + s + "px," + l + "px)"
                  } else r.resolve()
                }.bind(this)(), a(), $.when(r, o).then(function () {
                  d(), i.resolve()
                }), i
              }.bind(this);
              this.zoomIn = u;
              var d = function () {
                  var t = this.playerFrame.getBoundingClientRect();
                  this.endOverlay.style.width = t.width + 2 + "px", this.endOverlay.style.height = t.height + 2 + "px";
                  var e = this.el.querySelector(".yt-frame");
                  e && (e.width = t.width + "px", e.height = t.height + "px"), this.closeButton.style.transform = null;
                  var n = this.closeButton.getBoundingClientRect(),
                    i = Math.floor(t.right - n.right),
                    r = Math.floor(t.top - n.top - n.height - 20);
                  this.closeButton.style.transform = "translate(" + i + "px," + r + "px)"
                }.bind(this),
                h = function () {
                  var t = $.Deferred(),
                    e = !a.isMobile;
                  E();
                  var i = function (e) {
                      t.resolve(), e.target.playVideo()
                    }.bind(this),
                    r = function (t) {
                      switch (t.data) {
                        case 0:
                          g();
                          break;
                        case 1:
                          n = !0, p()
                      }
                    }.bind(this),
                    o = function () {
                      t.resolve(), p()
                    }.bind(this),
                    s = function (t) {
                      if ("true" === this.el.getAttribute("data-activated")) switch (t.data) {
                        case 0:
                          g();
                          break;
                        case 1:
                          n = !0, p()
                      }
                    }.bind(this),
                    l = document.createElement("div");
                  l.id = (new Date).getTime(), l.classList.add("yt-frame"), this.tileContent.appendChild(l), l.addEventListener("click", function (t) {
                    t.stopPropagation()
                  });
                  var c = {
                      mobile: {
                        onReady: o,
                        onStateChange: s
                      },
                      desktop: {
                        onReady: i,
                        onStateChange: r
                      }
                    },
                    u = this.playerFrame.getBoundingClientRect();
                  return this.player = new YT.Player(l.id, {
                    videoId: this.el.getAttribute("data-v") || "QH2-TGUlwu4",
                    height: u.height + "px",
                    width: u.width + "px",
                    events: e ? c.desktop : c.mobile,
                    playerVars: {
                      rel: 0,
                      autoplay: !!window.Modernizr.touchevents,
                      fs: a.isMobile ? 1 : 0,
                      modestbranding: 1,
                      vq: "hd1080",
                      showinfo: 0,
                      controls: 2
                    }
                  }), t
                }.bind(this),
                p = function () {
                  var t = $.Deferred();
                  if (this.player) {
                    C();
                    var e = function (n) {
                      "opacity" === n.propertyName && (this.poster.removeEventListener("transitionend", e), k("video-playing"), t.resolve())
                    }.bind(this);
                    this.poster.addEventListener("transitionend", e), this.poster.setAttribute("data-is-hidden", !0)
                  } else t.resolve();
                  return t
                }.bind(this),
                f = function () {
                  var t = $.Deferred();
                  this.off("replay");
                  var e = function (n) {
                    "opacity" === n.propertyName && (this.endOverlay.removeEventListener("transitionend", e), t.resolve())
                  }.bind(this);
                  return this.endOverlay.addEventListener("transitionend", e), this.endOverlay.setAttribute("data-is-visible", !1), t
                }.bind(this),
                m = function () {
                  "true" === this.el.getAttribute("data-activated") ? f().then(function () {
                    this.player.playVideo()
                  }.bind(this)) : f().then(function () {
                    this.trigger("activate-requested")
                  }.bind(this))
                }.bind(this),
                g = function () {
                  var t = $.Deferred();
                  return s = !1, b().then(function () {
                    d(), this.on("replay", m);
                    var e = function (n) {
                      "opacity" === n.propertyName && (this.endOverlay.removeEventListener("transitionend", e), k("zoomed"), s = !0, t.resolve())
                    }.bind(this);
                    this.endOverlay.addEventListener("transitionend", e), this.endOverlay.setAttribute("data-is-visible", !0)
                  }.bind(this)), t
                }.bind(this),
                v = function () {
                  if (s) {
                    this.playerFrame.removeEventListener("click", x);
                    var t, e = $.Deferred(),
                      n = function () {
                        this.el.setAttribute("data-activated", !1), this.el.setAttribute("data-state", null), e.resolve()
                      }.bind(this);
                    switch (this.player && this.player.getPlayerState && (t = this.player.getPlayerState()), t) {
                      case -1:
                      case 0:
                      case 2:
                        i() ? "true" === this.endOverlay.getAttribute("data-is-visible") ? w().then(n) : b().then(w).then(n) : "true" === this.endOverlay.getAttribute("data-is-visible") ? f().then(w).then(n) : b().then(w).then(n);
                        break;
                      case 1:
                      case 5:
                        b().then(w).then(n);
                        break;
                      default:
                        y(), w().then(n)
                    }
                    return e
                  }
                }.bind(this);
              this.deactivate = v;
              var y = function () {
                  C(), this.closeButton.style.transform = null, this.el.querySelector(".yt-frame") && this.player.destroy(), this.player = null
                }.bind(this),
                b = function () {
                  var t = $.Deferred(),
                    e = function (n) {
                      "opacity" === n.propertyName && (this.playerFrame.removeEventListener("click", x), this.poster.removeEventListener("transitionend", e), t.resolve())
                    }.bind(this);
                  return 1 === this.player.getPlayerState() && this.player.pauseVideo(), this.poster.addEventListener("transitionend", e), k("zoomed"), this.poster.setAttribute("data-is-hidden", !1), t
                }.bind(this),
                w = function () {
                  var t = $.Deferred();
                  k("zooming-out");
                  var e = function (n) {
                    "transform" === n.propertyName && (this.tileContent.removeEventListener("transitionend", e), this.SCALAR = null, t.resolve())
                  }.bind(this);
                  return this.tileContent.addEventListener("transitionend", e), this.tileContent.style.transform = "translate(0,0)", this.endOverlay.style.width = "100%", this.endOverlay.style.height = "100%", this.playerFrame.style.transform = "", t
                }.bind(this),
                _ = function () {
                  this.trigger("deactivate-requested")
                }.bind(this),
                k = function (t) {
                  this.el.setAttribute("data-state", t), this.trigger(t, this)
                }.bind(this),
                x = (function () {
                  this.playerFrame.addEventListener("click", x), this.endOverlay.addEventListener("click", x), this.loader.addEventListener("click", x)
                }.bind(this), function () {
                  this.playerFrame.removeEventListener("click", x), this.endOverlay.removeEventListener("click", x), this.loader.removeEventListener("click", x)
                }.bind(this), function (t) {
                  t.stopPropagation()
                }.bind(this)),
                E = function () {
                  this.loader.classList.add("is-visible", "is-spinning")
                }.bind(this),
                C = function () {
                  this.loader.classList.remove("is-visible", "is-spinning")
                }.bind(this);
              (function () {
                o.createEmitter(this), this.el = l, this.tileContent = this.el.querySelector(".tile-content"), this.playerFrame = this.tileContent.querySelector(".player-frame"), this.poster = this.tileContent.querySelector(".player-poster"), this.endOverlay = this.tileContent.querySelector(".end-overlay"), this.loader = document.createElement("div"), this.loader.classList.add("loading-indicator"), this.tileContent.appendChild(this.loader), this.closeButton = document.createElement("a"), this.closeButton.classList.add("close-button"), this.closeButton.href = "#", this.tileContent.appendChild(this.closeButton), this.closeButton.addEventListener("click", function (t) {
                  t.preventDefault()
                }), this.endOverlay.addEventListener("click", x), this.loader.addEventListener("click", x), this.endOverlay.querySelector(".replay-link").addEventListener("click", function (t) {
                  t.preventDefault(), this.trigger("replay")
                }.bind(this)), this.el.addEventListener("click", function () {
                  "true" === this.el.getAttribute("data-activated") ? _() : this.trigger("activate-requested")
                }.bind(this)), n = !1
              }).call(this)
            }(0);
            n.push(s), s.on("activate-requested", function () {
              u(this)
            }.bind(s)), s.on("deactivate-requested", function () {
              d()
            })
          }
        }(t)
      };
    e.exports = {
      init: function (t) {
        t = t || document.querySelector("section.we-heart-home"), r.init(function () {
          s = !0, window.YTConfig = {
            host: "https://www.youtube.com"
          }, new l(t)
        })
      }
    }
  }, {
    "../_modules/youtube_api": 118,
    "nl-client": 42,
    "nl-event-emitter": 47
  }],
  368: [function (t, e, n) {
    "use strict";
    t("nl-element-watcher");
    var i = t("../_modules/make-sections-visible");
    n.init = function () {
      $("body").on("click", "#built-by-nest a", function (t) {
        dataLayer.push({
          event: "gaEvent",
          gaCategory: "navigation",
          gaAction: "internal link",
          gaLabel: "learn more"
        })
      }), $("body").on("click", "#weave-in-action .nest_secure", function (t) {
        dataLayer.push({
          event: "gaEvent",
          gaCategory: "navigation",
          gaAction: "internal link",
          gaLabel: "nest secure"
        })
      }), $("body").on("click", "#product-driven .smoke_alarm", function (t) {
        dataLayer.push({
          event: "gaEvent",
          gaCategory: "navigation",
          gaAction: "internal link",
          gaLabel: "smoke and co alarm"
        })
      }), $("body").on("click", "#better-together .yale_lock", function (t) {
        dataLayer.push({
          event: "gaEvent",
          gaCategory: "navigation",
          gaAction: "internal link",
          gaLabel: "yale lock"
        })
      }), $("body").on("click", "#better-together .nest_secure", function (t) {
        dataLayer.push({
          event: "gaEvent",
          gaCategory: "navigation",
          gaAction: "internal link",
          gaLabel: "nest secure"
        })
      }), $("body").on("click", "#open-weave a", function (t) {
        dataLayer.push({
          event: "gaEvent",
          gaCategory: "navigation",
          gaAction: "internal link",
          gaLabel: "get code"
        })
      }), i()
    }
  }, {
    "../_modules/make-sections-visible": 82,
    "nl-element-watcher": 45
  }],
  369: [function (t, e, n) {
    "use strict";
    e.exports = {
      trackOutboundClicks: function () {
        $("body").on("click", ".retail-partner-list a", function () {
          dataLayer.push({
            event: "gaEvent",
            gaCategory: "Partners",
            gaAction: "Retail Outbound",
            gaLabel: $(this).attr("title")
          })
        })
      },
      filterPartnersByReferrer: function () {
        var t = Array.apply(void 0, function (t) {
            if (Array.isArray(t)) {
              for (var e = 0, n = Array(t.length); e < t.length; e++) n[e] = t[e];
              return n
            }
            return Array.from(t)
          }(document.querySelectorAll("[data-partner-products]"))),
          e = document.referrer,
          n = t.reduce(function (t, e) {
            return e.dataset.partnerProducts.length ? t.push(e) && t : t
          }, []),
          i = n.reduce(function (t, n) {
            var i = n.getAttribute("data-partner-products"),
              r = new RegExp(i);
            return e.match(r) || t.push(n), t
          }, []);
        i.length !== n.length && i.forEach(function (t) {
          return t.outerHTML = ""
        })
      },
      init: function () {
        this.trackOutboundClicks(), this.filterPartnersByReferrer()
      }
    }
  }, {}],
  370: [function (t, e, n) {
    "use strict";
    var i = {
      cleanPhoneNumbers: t("../phone_numbers").init
    };
    e.exports = {
      init: function () {
        window.__widget_object__ = i
      }
    }
  }, {
    "../phone_numbers": 248
  }],
  371: [function (t, e, n) {
    arguments[4][258][0].apply(n, arguments)
  }, {
    dup: 258
  }],
  372: [function (t, e, n) {
    "use strict";
    var i = t("./handlebars"),
      r = (t("underscore"), t("../../core_modules")),
      o = r.mailingList,
      a = r.analytics,
      s = r.geoip;
    n.init = function () {
      function t(t, i, o, s) {
        var l;
        p.removeClass("no-offers no-location is-filtered" + n), t && !i ? (l = "?country=" + (i = $("html").attr("lang").split("-")[1]) + "&postal_code=" + t, a.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "Partners",
            gaAction: "Incentive Zip Active",
            gaLabel: t
          }
        })) : t && i ? (l = "?country=" + i + "&postal_code=" + t, a.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "Partners",
            gaAction: "Incentive Zip Passive",
            gaLabel: t
          }
        })) : o && s ? (l = "?lat=" + o + "&lng=" + s, r && a.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "Partners",
            gaAction: "Incentive Zip Passive",
            gaLabel: r
          }
        })) : (p.addClass("no-location"), $(".incentives-inner-container").removeClass("is-loading"), $("spinner").removeClass("is-visible is-spinning"), $(".zip-form-input").addClass("needs-attention")), l && $.ajax({
          url: f + l + "&post_purchase=true",
          type: "GET",
          timeout: "5000",
          dataType: "json"
        }).done(function (t) {
          if ((d = t).incentives && d.incentives[0]) {
            for (var e, n, i = d.incentives, r = i.length; r--;)(n = (e = i[r]).devices.slice(0)).push(e.provides.toLowerCase()), i[r].filter = n.join("|");
            var o = g(d);
            $(".incentives-list").html(o), $(".incentives-inner-container").removeClass("is-loading"), $("spinner").removeClass("is-visible is-spinning"), $(".incentives-list .learn-more-link").each(function (t, e) {
              var n = $(e).attr("data-partner-name");
              a.trackEvent(e, "click", {
                gtm: {
                  event: "gaEvent",
                  gaCategory: "Partners",
                  gaAction: "Incentive Search Result",
                  gaLabel: n
                }
              })
            })
          } else p.addClass("no-offers"), $(".incentives-inner-container").removeClass("is-loading"), $("spinner").removeClass("is-visible is-spinning")
        }).fail(function () {
          e("failedAPI")
        })
      }

      function e(t) {
        var e;
        switch ($(".incentives-inner-container").removeClass("is-loading"), $("spinner").removeClass("is-visible is-spinning"), t) {
          case "failedAPI":
            p.addClass("no-location");
            break;
          case "zipError":
            $("#zip-form").addClass("has-zip-error"), e = $("#zip-form .error").data("zip-error"), $("#zip-form .error").text(e);
            break;
          case "noZip":
            $("#zip-form").addClass("has-zip-error"), e = $("#zip-form .error").data("no-zip-error"), $("#zip-form .error").text(e)
        }
      }
      var n, r, l, c, u, d, h, p = $("body"),
        f = $("#zip-form").attr("action"),
        m = $("#incentives-list-container").html(),
        g = i.compile(m),
        v = $("html").attr("lang");
      i.registerHelper("toLowerCase", function (t) {
        return t.toLowerCase()
      }), i.registerHelper("incentiveCountHelper", function (t) {
        var e = !t || t > 1 ? $("#incentives-container").attr("data-other") : $("#incentives-container").attr("data-one");
        return new i.SafeString(e.replace("{number}", t))
      }), r = s.postal_code, l = s.country_code, c = s.latitude, u = s.longitude, $("#incentives-dynamic").length && ($(".nl-checkbox").change(function (t) {
        var e = $(t.target).val();
        a.trackEvent({
          gtm: {
            event: "gaEvent",
            gaCategory: "Partners",
            gaAction: "Incentive Search Narrow",
            gaLabel: e
          }
        })
      }), $("#zip-form").on("submit", function (n) {
        n.preventDefault(), $(".zip-form-input").blur(),
          function () {
            var n = $(".zip-form-input").val().toUpperCase();
            $("#zip-form").removeClass("has-zip-error"), $(".incentives-inner-container").addClass("is-loading"), $("spinner").addClass("is-visible is-spinning"), h.test(n) ? t(n) : e("zipError")
          }()
      }), $(".zip-form-input").keydown(function (t) {
        $("#zip-form").removeClass("has-zip-error"), 13 === t.which && $("#zip-form").submit()
      }), $("#zip-form .zip-form-input").val(""), h = "en-CA" === v || "fr-CA" === v ? /(([A-Za-z]\d[A-Za-z])([\-\s])?(\d[A-Za-z]\d)?)$/ : /(^\d{5}$)|(^\d{5}-\d{4}$)/, t(r, l, c, u)), $("body").on("submit", "#incentives_with_partners-email-signup", function (t) {
        t.preventDefault(),
          function (t) {
            o.didPressSubmit({
              form: t,
              data: {
                type: "general",
                sub_type: "incentives",
                postal_code: r
              }
            })
          }($(this))
      }), $(".zip-form-input").on("input", function () {
        $(".zip-form-input").val($(this).val().replace(/\s/g, "").toUpperCase())
      })
    }
  }, {
    "../../core_modules": 194,
    "./handlebars": 371,
    underscore: 58
  }],
  373: [function (t, e, n) {
    "use strict";
    var i = t("../_modules/query_utils");
    e.exports = {
      handleLegacyEnrollment: function () {
        var t = window.location.search.substr(1);
        if (!t.match(/a7a9907b-e6a2-446d-b6f3-7d4a6f0aaf9d|c790c0a9-922a-4870-b11c-055ceaa67705|e090ef43-a4fb-49a9-a7db-5e16a87c289f/)) {
          var e = i.parseQuery(t),
            n = window.SITE_URLS.login_url.split("login")[0];
          window.location = [n, "energy-partner-enrollment?id=", e.id].join("")
        }
      },
      init: function () {
        this.handleLegacyEnrollment()
      }
    }
  }, {
    "../_modules/query_utils": 92
  }],
  374: [function (t, e, n) {
    "use strict";
    t("underscore");
    var i = t("../core_modules"),
      r = i.elementWatcher,
      o = i.wwn,
      a = i.analytics,
      s = (i.mailingList, t("../_modules/ui-controller")),
      l = t("../_modules/tabs");
    n.init = function () {
      ! function () {
        var t = $("#nest-home");
        s.init(), l.init(), r.add({
          element: t,
          callback: function () {
            t.addClass("is-visible")
          }
        })
      }(), $(".card-grid a").each(function (t, e) {
        var n = $(e).attr("id").split("partner-link-")[1];
        a.trackEvent(e, "click", {
          gtm: {
            event: "gaEvent",
            gaCategory: "Partners",
            gaAction: "Works With Nest Outbound",
            gaLabel: n
          }
        })
      }), a.trackEvent("#privacy-modal-toggle", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "Partners",
          gaAction: "View Privacy Policy"
        }
      }), a.trackEvent(".pre-footer .developer a", "click", {
        gtm: {
          event: "gaEvent",
          gaCategory: "Partners",
          gaAction: "Become a Developer"
        }
      }), o.init()
    }
  }, {
    "../_modules/tabs": 95,
    "../_modules/ui-controller": 100,
    "../core_modules": 194,
    underscore: 58
  }],
  375: [function (t, e, n) {
    "use strict";

    function i(t) {
      t.preventDefault(), t.stopPropagation(), r.toggleClass("modal-is-shown"), $("#privacy-modal").toggleClass("is-shown")
    }
    var r = $("body");
    n.init = function () {
      $("#privacy-modal-toggle").click(i), $(".close-modal").click(i), $(document).click(function () {
        r.hasClass("modal-is-shown") && (r.removeClass("modal-is-shown"), $("#privacy-modal").removeClass("is-shown"))
      }), $("#privacy-modal .container").click(function (t) {
        t.stopPropagation()
      }), $(".filter-option").click(function () {
        var t = $(this).text();
        ga("send", "event", "works with nest", "filtered", t)
      }), $(".card-grid-item a").click(function () {
        var t = $(this).attr("id");
        ga("send", "event", "works with nest", "partner", t)
      })
    }
  }, {}],
  376: [function (t, e, n) {
    "use strict";
    var i = t("nl-widget-launcher");
    i.activateHashListener(), i.activateClickHandler(), i.events.on("launchWidget", function (t) {
      var e = t[0],
        n = t[1],
        i = window.location.href.match("/support/") ? "support" : "marketing";
      "video" !== n.widgetType ? ("works" === n.name && dataLayer.push({
        gaCategory: "compatibility widget",
        gaAction: "opened from",
        gaLabel: i,
        event: "gaEvent"
      }), "pro" === n.name && (e.match("from-footer") && (i = "bottom"), dataLayer.push({
        gaCategory: "pro finder widget",
        gaAction: "opened from",
        gaLabel: i,
        event: "gaEvent"
      })), "troubleshooting" === n.name && dataLayer.push({
        gaCategory: "troubleshooting widget",
        gaAction: "opened from",
        gaLabel: i,
        event: "gaEvent"
      }), "in-your-home" === n.name && dataLayer.push({
        gaCategory: "in your home widget",
        gaAction: "opened from",
        gaLabel: i,
        event: "gaEvent"
      })) : dataLayer.push({
        gaCategory: "videos",
        gaAction: "start",
        gaLabel: n.name,
        event: "gaEvent"
      })
    })
  }, {
    "nl-widget-launcher": 54
  }]
}, {}, [237]);
