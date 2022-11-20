jQuery.fn.extend({
    parsvtcolorpicker: function (mode) {
        'use strict';
        var element = this;
        jQuery(element).attr("type", "color");
        if (mode !== 'Edit') {
            jQuery(element).prop('disabled', 'disabled');
            jQuery(element).attr('readonly', 'readonly');
        }
        jQuery(element).after("<div id='"+jQuery(element).attr('id')+"-color' class='text-info'></div>");
        this.parsvtsetcolor(element);
        $(document).on('change', element, function() {
            $(this).parsvtsetcolor(element);
        });

    },
    parsvtsetcolor: function (element) {
        var color = jQuery(element).val();
        if (/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i.test(color)) {
            var tiny = tinycolor(color);
            var output = [
                "<span>",
                "Hex:\t" + tiny.toHexString(),
                "Hex8:\t" + tiny.toHex8String(),
                "RGB:\t" + tiny.toRgbString(),
                "RGB (percent):\t" + tiny.toPercentageRgbString(),
                "HSL:\t" + tiny.toHslString(),
                "HSV:\t" + tiny.toHsvString(),
                "CMYK:\t" + tiny.toCMYKString(),
                //"Name:\t" + (tiny.toName() || "none"),
                "Name:\t" + (tiny.toColorNameString() || "none"),
                //"Format:\t" + (tiny.getFormat()),
                //"Format String:\t" + tiny.toString(),
                "</span>",
            ].join("<br />");
            $("#"+jQuery(element).attr('id')+"-color").html(output);
        }
    }
});
// TinyColor v1.4.1
// https://github.com/bgrins/TinyColor
// 2016-07-07, Brian Grinstead, MIT License
! function (a) {
    function b(a, d) {
        if (a = a ? a : "", d = d || {}, a instanceof b) return a;
        if (!(this instanceof b)) return new b(a, d);
        var e = c(a);
        this._originalInput = a, this._r = e.r, this._g = e.g, this._b = e.b, this._a = e.a, this._roundA = P(100 * this._a) / 100, this._format = d.format || e.format, this._gradientType = d.gradientType, this._r < 1 && (this._r = P(this._r)), this._g < 1 && (this._g = P(this._g)), this._b < 1 && (this._b = P(this._b)), this._ok = e.ok, this._tc_id = O++
    }

    function c(a) {
        var b = {
                r: 0,
                g: 0,
                b: 0
            },
            c = 1,
            e = null,
            g = null,
            i = null,
            j = !1,
            k = !1;
        return "string" == typeof a && (a = K(a)), "object" == typeof a && (J(a.r) && J(a.g) && J(a.b) ? (b = d(a.r, a.g, a.b), j = !0, k = "%" === String(a.r).substr(-1) ? "prgb" : "rgb") : J(a.h) && J(a.s) && J(a.v) ? (e = G(a.s), g = G(a.v), b = h(a.h, e, g), j = !0, k = "hsv") : J(a.h) && J(a.s) && J(a.l) && (e = G(a.s), i = G(a.l), b = f(a.h, e, i), j = !0, k = "hsl"), a.hasOwnProperty("a") && (c = a.a)), c = z(c), {
            ok: j,
            format: a.format || k,
            r: Q(255, R(b.r, 0)),
            g: Q(255, R(b.g, 0)),
            b: Q(255, R(b.b, 0)),
            a: c
        }
    }

    function d(a, b, c) {
        return {
            r: 255 * A(a, 255),
            g: 255 * A(b, 255),
            b: 255 * A(c, 255)
        }
    }

    function e(a, b, c) {
        a = A(a, 255), b = A(b, 255), c = A(c, 255);
        var d, e, f = R(a, b, c),
            g = Q(a, b, c),
            h = (f + g) / 2;
        if (f == g) d = e = 0;
        else {
            var i = f - g;
            switch (e = h > .5 ? i / (2 - f - g) : i / (f + g), f) {
                case a:
                    d = (b - c) / i + (c > b ? 6 : 0);
                    break;
                case b:
                    d = (c - a) / i + 2;
                    break;
                case c:
                    d = (a - b) / i + 4
            }
            d /= 6
        }
        return {
            h: d,
            s: e,
            l: h
        }
    }

    function f(a, b, c) {
        function d(a, b, c) {
            return 0 > c && (c += 1), c > 1 && (c -= 1), 1 / 6 > c ? a + 6 * (b - a) * c : .5 > c ? b : 2 / 3 > c ? a + 6 * (b - a) * (2 / 3 - c) : a
        }
        var e, f, g;
        if (a = A(a, 360), b = A(b, 100), c = A(c, 100), 0 === b) e = f = g = c;
        else {
            var h = .5 > c ? c * (1 + b) : c + b - c * b,
                i = 2 * c - h;
            e = d(i, h, a + 1 / 3), f = d(i, h, a), g = d(i, h, a - 1 / 3)
        }
        return {
            r: 255 * e,
            g: 255 * f,
            b: 255 * g
        }
    }

    function g(a, b, c) {
        a = A(a, 255), b = A(b, 255), c = A(c, 255);
        var d, e, f = R(a, b, c),
            g = Q(a, b, c),
            h = f,
            i = f - g;
        if (e = 0 === f ? 0 : i / f, f == g) d = 0;
        else {
            switch (f) {
                case a:
                    d = (b - c) / i + (c > b ? 6 : 0);
                    break;
                case b:
                    d = (c - a) / i + 2;
                    break;
                case c:
                    d = (a - b) / i + 4
            }
            d /= 6
        }
        return {
            h: d,
            s: e,
            v: h
        }
    }

    function h(b, c, d) {
        b = 6 * A(b, 360), c = A(c, 100), d = A(d, 100);
        var e = a.floor(b),
            f = b - e,
            g = d * (1 - c),
            h = d * (1 - f * c),
            i = d * (1 - (1 - f) * c),
            j = e % 6,
            k = [d, h, g, g, i, d][j],
            l = [i, d, d, h, g, g][j],
            m = [g, g, i, d, d, h][j];
        return {
            r: 255 * k,
            g: 255 * l,
            b: 255 * m
        }
    }

    function i(a, b, c, d) {
        var e = [F(P(a).toString(16)), F(P(b).toString(16)), F(P(c).toString(16))];
        return d && e[0].charAt(0) == e[0].charAt(1) && e[1].charAt(0) == e[1].charAt(1) && e[2].charAt(0) == e[2].charAt(1) ? e[0].charAt(0) + e[1].charAt(0) + e[2].charAt(0) : e.join("")
    }

    function j(a, b, c, d, e) {
        var f = [F(P(a).toString(16)), F(P(b).toString(16)), F(P(c).toString(16)), F(H(d))];
        return e && f[0].charAt(0) == f[0].charAt(1) && f[1].charAt(0) == f[1].charAt(1) && f[2].charAt(0) == f[2].charAt(1) && f[3].charAt(0) == f[3].charAt(1) ? f[0].charAt(0) + f[1].charAt(0) + f[2].charAt(0) + f[3].charAt(0) : f.join("")
    }

    function k(a, b, c, d) {
        var e = [F(H(d)), F(P(a).toString(16)), F(P(b).toString(16)), F(P(c).toString(16))];
        return e.join("")
    }

    function l(a, c) {
        c = 0 === c ? 0 : c || 10;
        var d = b(a).toHsl();
        return d.s -= c / 100, d.s = B(d.s), b(d)
    }

    function m(a, c) {
        c = 0 === c ? 0 : c || 10;
        var d = b(a).toHsl();
        return d.s += c / 100, d.s = B(d.s), b(d)
    }

    function n(a) {
        return b(a).desaturate(100)
    }

    function o(a, c) {
        c = 0 === c ? 0 : c || 10;
        var d = b(a).toHsl();
        return d.l += c / 100, d.l = B(d.l), b(d)
    }

    function p(a, c) {
        c = 0 === c ? 0 : c || 10;
        var d = b(a).toRgb();
        return d.r = R(0, Q(255, d.r - P(255 * -(c / 100)))), d.g = R(0, Q(255, d.g - P(255 * -(c / 100)))), d.b = R(0, Q(255, d.b - P(255 * -(c / 100)))), b(d)
    }

    function q(a, c) {
        c = 0 === c ? 0 : c || 10;
        var d = b(a).toHsl();
        return d.l -= c / 100, d.l = B(d.l), b(d)
    }

    function r(a, c) {
        var d = b(a).toHsl(),
            e = (d.h + c) % 360;
        return d.h = 0 > e ? 360 + e : e, b(d)
    }

    function s(a) {
        var c = b(a).toHsl();
        return c.h = (c.h + 180) % 360, b(c)
    }

    function t(a) {
        var c = b(a).toHsl(),
            d = c.h;
        return [b(a), b({
            h: (d + 120) % 360,
            s: c.s,
            l: c.l
        }), b({
            h: (d + 240) % 360,
            s: c.s,
            l: c.l
        })]
    }

    function u(a) {
        var c = b(a).toHsl(),
            d = c.h;
        return [b(a), b({
            h: (d + 90) % 360,
            s: c.s,
            l: c.l
        }), b({
            h: (d + 180) % 360,
            s: c.s,
            l: c.l
        }), b({
            h: (d + 270) % 360,
            s: c.s,
            l: c.l
        })]
    }

    function v(a) {
        var c = b(a).toHsl(),
            d = c.h;
        return [b(a), b({
            h: (d + 72) % 360,
            s: c.s,
            l: c.l
        }), b({
            h: (d + 216) % 360,
            s: c.s,
            l: c.l
        })]
    }

    function w(a, c, d) {
        c = c || 6, d = d || 30;
        var e = b(a).toHsl(),
            f = 360 / d,
            g = [b(a)];
        for (e.h = (e.h - (f * c >> 1) + 720) % 360; --c;) e.h = (e.h + f) % 360, g.push(b(e));
        return g
    }

    function x(a, c) {
        c = c || 6;
        for (var d = b(a).toHsv(), e = d.h, f = d.s, g = d.v, h = [], i = 1 / c; c--;) h.push(b({
            h: e,
            s: f,
            v: g
        })), g = (g + i) % 1;
        return h
    }

    function y(a) {
        var b = {};
        for (var c in a) a.hasOwnProperty(c) && (b[a[c]] = c);
        return b
    }

    function z(a) {
        return a = parseFloat(a), (isNaN(a) || 0 > a || a > 1) && (a = 1), a
    }

    function A(b, c) {
        D(b) && (b = "100%");
        var d = E(b);
        return b = Q(c, R(0, parseFloat(b))), d && (b = parseInt(b * c, 10) / 100), a.abs(b - c) < 1e-6 ? 1 : b % c / parseFloat(c)
    }

    function B(a) {
        return Q(1, R(0, a))
    }

    function C(a) {
        return parseInt(a, 16)
    }

    function D(a) {
        return "string" == typeof a && -1 != a.indexOf(".") && 1 === parseFloat(a)
    }

    function E(a) {
        return "string" == typeof a && -1 != a.indexOf("%")
    }

    function F(a) {
        return 1 == a.length ? "0" + a : "" + a
    }

    function G(a) {
        return 1 >= a && (a = 100 * a + "%"), a
    }

    function H(b) {
        return a.round(255 * parseFloat(b)).toString(16)
    }

    function I(a) {
        return C(a) / 255
    }

    function J(a) {
        return !!V.CSS_UNIT.exec(a)
    }

    function K(a) {
        a = a.replace(M, "").replace(N, "").toLowerCase();
        var b = !1;
        if (T[a]) a = T[a], b = !0;
        else if ("transparent" == a) return {
            r: 0,
            g: 0,
            b: 0,
            a: 0,
            format: "name"
        };
        var c;
        return (c = V.rgb.exec(a)) ? {
            r: c[1],
            g: c[2],
            b: c[3]
        } : (c = V.rgba.exec(a)) ? {
            r: c[1],
            g: c[2],
            b: c[3],
            a: c[4]
        } : (c = V.hsl.exec(a)) ? {
            h: c[1],
            s: c[2],
            l: c[3]
        } : (c = V.hsla.exec(a)) ? {
            h: c[1],
            s: c[2],
            l: c[3],
            a: c[4]
        } : (c = V.hsv.exec(a)) ? {
            h: c[1],
            s: c[2],
            v: c[3]
        } : (c = V.hsva.exec(a)) ? {
            h: c[1],
            s: c[2],
            v: c[3],
            a: c[4]
        } : (c = V.hex8.exec(a)) ? {
            r: C(c[1]),
            g: C(c[2]),
            b: C(c[3]),
            a: I(c[4]),
            format: b ? "name" : "hex8"
        } : (c = V.hex6.exec(a)) ? {
            r: C(c[1]),
            g: C(c[2]),
            b: C(c[3]),
            format: b ? "name" : "hex"
        } : (c = V.hex4.exec(a)) ? {
            r: C(c[1] + "" + c[1]),
            g: C(c[2] + "" + c[2]),
            b: C(c[3] + "" + c[3]),
            a: I(c[4] + "" + c[4]),
            format: b ? "name" : "hex8"
        } : (c = V.hex3.exec(a)) ? {
            r: C(c[1] + "" + c[1]),
            g: C(c[2] + "" + c[2]),
            b: C(c[3] + "" + c[3]),
            format: b ? "name" : "hex"
        } : !1
    }

    function L(a) {
        var b, c;
        return a = a || {
            level: "AA",
            size: "small"
        }, b = (a.level || "AA").toUpperCase(), c = (a.size || "small").toLowerCase(), "AA" !== b && "AAA" !== b && (b = "AA"), "small" !== c && "large" !== c && (c = "small"), {
            level: b,
            size: c
        }
    }
    var M = /^\s+/,
        N = /\s+$/,
        O = 0,
        P = a.round,
        Q = a.min,
        R = a.max,
        S = a.random;
    b.prototype = {
        isDark: function () {
            return this.getBrightness() < 128
        },
        isLight: function () {
            return !this.isDark()
        },
        isValid: function () {
            return this._ok
        },
        getOriginalInput: function () {
            return this._originalInput
        },
        getFormat: function () {
            return this._format
        },
        getAlpha: function () {
            return this._a
        },
        getBrightness: function () {
            var a = this.toRgb();
            return (299 * a.r + 587 * a.g + 114 * a.b) / 1e3
        },
        getLuminance: function () {
            var b, c, d, e, f, g, h = this.toRgb();
            return b = h.r / 255, c = h.g / 255, d = h.b / 255, e = .03928 >= b ? b / 12.92 : a.pow((b + .055) / 1.055, 2.4), f = .03928 >= c ? c / 12.92 : a.pow((c + .055) / 1.055, 2.4), g = .03928 >= d ? d / 12.92 : a.pow((d + .055) / 1.055, 2.4), .2126 * e + .7152 * f + .0722 * g
        },
        setAlpha: function (a) {
            return this._a = z(a), this._roundA = P(100 * this._a) / 100, this
        },
        toHsv: function () {
            var a = g(this._r, this._g, this._b);
            return {
                h: 360 * a.h,
                s: a.s,
                v: a.v,
                a: this._a
            }
        },
        toHsvString: function () {
            var a = g(this._r, this._g, this._b),
                b = P(360 * a.h),
                c = P(100 * a.s),
                d = P(100 * a.v);
            return 1 == this._a ? "hsv(" + b + ", " + c + "%, " + d + "%)" : "hsva(" + b + ", " + c + "%, " + d + "%, " + this._roundA + ")"
        },
        toHsl: function () {
            var a = e(this._r, this._g, this._b);
            return {
                h: 360 * a.h,
                s: a.s,
                l: a.l,
                a: this._a
            }
        },
        toHslString: function () {
            var a = e(this._r, this._g, this._b),
                b = P(360 * a.h),
                c = P(100 * a.s),
                d = P(100 * a.l);
            return 1 == this._a ? "hsl(" + b + ", " + c + "%, " + d + "%)" : "hsla(" + b + ", " + c + "%, " + d + "%, " + this._roundA + ")"
        },
        toFloatString: function () {
            var r = (this._r / 255).toFixed(2),
                g = (this._g / 255).toFixed(2),
                b = (this._b / 255).toFixed(2),
                a = (this._a / 255).toFixed(2);
            return 1 == this._a ? "3f(" + r + ", " + g + ", " + b + ")" : "4f(" + r + ", " + g + ", " + b + ", " + a + ")"
        },
        toHex: function (a) {
            return i(this._r, this._g, this._b, a)
        },
        toHexString: function (a) {
            return "#" + this.toHex(a)
        },
        toHex8: function (a) {
            return j(this._r, this._g, this._b, this._a, a)
        },
        toHex8String: function (a) {
            return "#" + this.toHex8(a)
        },
        toColorNameString: function (a) {
            var colornames = {
                "000000": "Black",
                "000080": "Navy Blue",
                "0000c8": "Dark Blue",
                "0000ff": "Blue",
                "000741": "Stratos",
                "001b1c": "Swamp",
                "002387": "Resolution Blue",
                "002900": "Deep Fir",
                "002e20": "Burnham",
                "002fa7": "International Klein Blue",
                "003153": "Prussian Blue",
                "003366": "Midnight Blue",
                "003399": "Smalt",
                "003532": "Deep Teal",
                "003e40": "Cyprus",
                "004620": "Kaitoke Green",
                "0047ab": "Cobalt",
                "004816": "Crusoe",
                "004950": "Sherpa Blue",
                "0056a7": "Endeavour",
                "00581a": "Camarone",
                "0066cc": "Science Blue",
                "0066ff": "Blue Ribbon",
                "00755e": "Tropical Rain Forest",
                "0076a3": "Allports",
                "007ba7": "Deep Cerulean",
                "007ec7": "Lochmara",
                "007fff": "Azure Radiance",
                "008080": "Teal",
                "0095b6": "Bondi Blue",
                "009dc4": "Pacific Blue",
                "00a693": "Persian Green",
                "00a86b": "Jade",
                "00cc99": "Caribbean Green",
                "00cccc": "Robin's Egg Blue",
                "00ff00": "Green",
                "00ff7f": "Spring Green",
                "00ffff": "Cyan / Aqua",
                "010d1a": "Blue Charcoal",
                "011635": "Midnight",
                "011d13": "Holly",
                "012731": "Daintree",
                "01361c": "Cardin Green",
                "01371a": "County Green",
                "013e62": "Astronaut Blue",
                "013f6a": "Regal Blue",
                "014b43": "Aqua Deep",
                "015e85": "Orient",
                "016162": "Blue Stone",
                "016d39": "Fun Green",
                "01796f": "Pine Green",
                "017987": "Blue Lagoon",
                "01826b": "Deep Sea",
                "01a368": "Green Haze",
                "022d15": "English Holly",
                "02402c": "Sherwood Green",
                "02478e": "Congress Blue",
                "024e46": "Evening Sea",
                "026395": "Bahama Blue",
                "02866f": "Observatory",
                "02a4d3": "Cerulean",
                "03163c": "Tangaroa",
                "032b52": "Green Vogue",
                "036a6e": "Mosque",
                "041004": "Midnight Moss",
                "041322": "Black Pearl",
                "042e4c": "Blue Whale",
                "044022": "Zuccini",
                "044259": "Teal Blue",
                "051040": "Deep Cove",
                "051657": "Gulf Blue",
                "055989": "Venice Blue",
                "056f57": "Watercourse",
                "062a78": "Catalina Blue",
                "063537": "Tiber",
                "069b81": "Gossamer",
                "06a189": "Niagara",
                "073a50": "Tarawera",
                "080110": "Jaguar",
                "081910": "Black Bean",
                "082567": "Deep Sapphire",
                "088370": "Elf Green",
                "08e8de": "Bright Turquoise",
                "092256": "Downriver",
                "09230f": "Palm Green",
                "09255d": "Madison",
                "093624": "Bottle Green",
                "095859": "Deep Sea Green",
                "097f4b": "Salem",
                "0a001c": "Black Russian",
                "0a480d": "Dark Fern",
                "0a6906": "Japanese Laurel",
                "0a6f75": "Atoll",
                "0b0b0b": "Cod Gray",
                "0b0f08": "Marshland",
                "0b1107": "Gordons Green",
                "0b1304": "Black Forest",
                "0b6207": "San Felix",
                "0bda51": "Malachite",
                "0c0b1d": "Ebony",
                "0c0d0f": "Woodsmoke",
                "0c1911": "Racing Green",
                "0c7a79": "Surfie Green",
                "0c8990": "Blue Chill",
                "0d0332": "Black Rock",
                "0d1117": "Bunker",
                "0d1c19": "Aztec",
                "0d2e1c": "Bush",
                "0e0e18": "Cinder",
                "0e2a30": "Firefly",
                "0f2d9e": "Torea Bay",
                "10121d": "Vulcan",
                "101405": "Green Waterloo",
                "105852": "Eden",
                "110c6c": "Arapawa",
                "120a8f": "Ultramarine",
                "123447": "Elephant",
                "126b40": "Jewel",
                "130000": "Diesel",
                "130a06": "Asphalt",
                "13264d": "Blue Zodiac",
                "134f19": "Parsley",
                "140600": "Nero",
                "1450aa": "Tory Blue",
                "151f4c": "Bunting",
                "1560bd": "Denim",
                "15736b": "Genoa",
                "161928": "Mirage",
                "161d10": "Hunter Green",
                "162a40": "Big Stone",
                "163222": "Celtic",
                "16322c": "Timber Green",
                "163531": "Gable Green",
                "171f04": "Pine Tree",
                "175579": "Chathams Blue",
                "182d09": "Deep Forest Green",
                "18587a": "Blumine",
                "19330e": "Palm Leaf",
                "193751": "Nile Blue",
                "1959a8": "Fun Blue",
                "1a1a68": "Lucky Point",
                "1ab385": "Mountain Meadow",
                "1b0245": "Tolopea",
                "1b1035": "Haiti",
                "1b127b": "Deep Koamaru",
                "1b1404": "Acadia",
                "1b2f11": "Seaweed",
                "1b3162": "Biscay",
                "1b659d": "Matisse",
                "1c1208": "Crowshead",
                "1c1e13": "Rangoon Green",
                "1c39bb": "Persian Blue",
                "1c402e": "Everglade",
                "1c7c7d": "Elm",
                "1d6142": "Green Pea",
                "1e0f04": "Creole",
                "1e1609": "Karaka",
                "1e1708": "El Paso",
                "1e385b": "Cello",
                "1e433c": "Te Papa Green",
                "1e90ff": "Dodger Blue",
                "1e9ab0": "Eastern Blue",
                "1f120f": "Night Rider",
                "1fc2c2": "Java",
                "20208d": "Jacksons Purple",
                "202e54": "Cloud Burst",
                "204852": "Blue Dianne",
                "211a0e": "Eternity",
                "220878": "Deep Blue",
                "228b22": "Forest Green",
                "233418": "Mallard",
                "240a40": "Violet",
                "240c02": "Kilamanjaro",
                "242a1d": "Log Cabin",
                "242e16": "Black Olive",
                "24500f": "Green House",
                "251607": "Graphite",
                "251706": "Cannon Black",
                "251f4f": "Port Gore",
                "25272c": "Shark",
                "25311c": "Green Kelp",
                "2596d1": "Curious Blue",
                "260368": "Paua",
                "26056a": "Paris M",
                "261105": "Wood Bark",
                "261414": "Gondola",
                "262335": "Steel Gray",
                "26283b": "Ebony Clay",
                "273a81": "Bay of Many",
                "27504b": "Plantation",
                "278a5b": "Eucalyptus",
                "281e15": "Oil",
                "283a77": "Astronaut",
                "286acd": "Mariner",
                "290c5e": "Violent Violet",
                "292130": "Bastille",
                "292319": "Zeus",
                "292937": "Charade",
                "297b9a": "Jelly Bean",
                "29ab87": "Jungle Green",
                "2a0359": "Cherry Pie",
                "2a140e": "Coffee Bean",
                "2a2630": "Baltic Sea",
                "2a380b": "Turtle Green",
                "2a52be": "Cerulean Blue",
                "2b0202": "Sepia Black",
                "2b194f": "Valhalla",
                "2b3228": "Heavy Metal",
                "2c0e8c": "Blue Gem",
                "2c1632": "Revolver",
                "2c2133": "Bleached Cedar",
                "2c8c84": "Lochinvar",
                "2d2510": "Mikado",
                "2d383a": "Outer Space",
                "2d569b": "St Tropaz",
                "2e0329": "Jacaranda",
                "2e1905": "Jacko Bean",
                "2e3222": "Rangitoto",
                "2e3f62": "Rhino",
                "2e8b57": "Sea Green",
                "2ebfd4": "Scooter",
                "2f270e": "Onion",
                "2f3cb3": "Governor Bay",
                "2f519e": "Sapphire",
                "2f5a57": "Spectra",
                "2f6168": "Casal",
                "300529": "Melanzane",
                "301f1e": "Cocoa Brown",
                "302a0f": "Woodrush",
                "304b6a": "San Juan",
                "30d5c8": "Turquoise",
                "311c17": "Eclipse",
                "314459": "Pickled Bluewood",
                "315ba1": "Azure",
                "31728d": "Calypso",
                "317d82": "Paradiso",
                "32127a": "Persian Indigo",
                "32293a": "Blackcurrant",
                "323232": "Mine Shaft",
                "325d52": "Stromboli",
                "327c14": "Bilbao",
                "327da0": "Astral",
                "33036b": "Christalle",
                "33292f": "Thunder",
                "33cc99": "Shamrock",
                "341515": "Tamarind",
                "350036": "Mardi Gras",
                "350e42": "Valentino",
                "350e57": "Jagger",
                "353542": "Tuna",
                "354e8c": "Chambray",
                "363050": "Martinique",
                "363534": "Tuatara",
                "363c0d": "Waiouru",
                "36747d": "Ming",
                "368716": "La Palma",
                "370202": "Chocolate",
                "371d09": "Clinker",
                "37290e": "Brown Tumbleweed",
                "373021": "Birch",
                "377475": "Oracle",
                "380474": "Blue Diamond",
                "381a51": "Grape",
                "383533": "Dune",
                "384555": "Oxford Blue",
                "384910": "Clover",
                "394851": "Limed Spruce",
                "396413": "Dell",
                "3a0020": "Toledo",
                "3a2010": "Sambuca",
                "3a2a6a": "Jacarta",
                "3a686c": "William",
                "3a6a47": "Killarney",
                "3ab09e": "Keppel",
                "3b000b": "Temptress",
                "3b0910": "Aubergine",
                "3b1f1f": "Jon",
                "3b2820": "Treehouse",
                "3b7a57": "Amazon",
                "3b91b4": "Boston Blue",
                "3c0878": "Windsor",
                "3c1206": "Rebel",
                "3c1f76": "Meteorite",
                "3c2005": "Dark Ebony",
                "3c3910": "Camouflage",
                "3c4151": "Bright Gray",
                "3c4443": "Cape Cod",
                "3c493a": "Lunar Green",
                "3d0c02": "Bean ",
                "3d2b1f": "Bistre",
                "3d7d52": "Goblin",
                "3e0480": "Kingfisher Daisy",
                "3e1c14": "Cedar",
                "3e2b23": "English Walnut",
                "3e2c1c": "Black Marlin",
                "3e3a44": "Ship Gray",
                "3eabbf": "Pelorous",
                "3f2109": "Bronze",
                "3f2500": "Cola",
                "3f3002": "Madras",
                "3f307f": "Minsk",
                "3f4c3a": "Cabbage Pont",
                "3f583b": "Tom Thumb",
                "3f5d53": "Mineral Green",
                "3fc1aa": "Puerto Rico",
                "3fff00": "Harlequin",
                "401801": "Brown Pod",
                "40291d": "Cork",
                "403b38": "Masala",
                "403d19": "Thatch Green",
                "405169": "Fiord",
                "40826d": "Viridian",
                "40a860": "Chateau Green",
                "410056": "Ripe Plum",
                "411f10": "Paco",
                "412010": "Deep Oak",
                "413c37": "Merlin",
                "414257": "Gun Powder",
                "414c7d": "East Bay",
                "4169e1": "Royal Blue",
                "41aa78": "Ocean Green",
                "420303": "Burnt Maroon",
                "423921": "Lisbon Brown",
                "427977": "Faded Jade",
                "431560": "Scarlet Gum",
                "433120": "Iroko",
                "433e37": "Armadillo",
                "434c59": "River Bed",
                "436a0d": "Green Leaf",
                "44012d": "Barossa",
                "441d00": "Morocco Brown",
                "444954": "Mako",
                "454936": "Kelp",
                "456cac": "San Marino",
                "45b1e8": "Picton Blue",
                "460b41": "Loulou",
                "462425": "Crater Brown",
                "465945": "Gray Asparagus",
                "4682b4": "Steel Blue",
                "480404": "Rustic Red",
                "480607": "Bulgarian Rose",
                "480656": "Clairvoyant",
                "481c1c": "Cocoa Bean",
                "483131": "Woody Brown",
                "483c32": "Taupe",
                "49170c": "Van Cleef",
                "492615": "Brown Derby",
                "49371b": "Metallic Bronze",
                "495400": "Verdun Green",
                "496679": "Blue Bayoux",
                "497183": "Bismark",
                "4a2a04": "Bracken",
                "4a3004": "Deep Bronze",
                "4a3c30": "Mondo",
                "4a4244": "Tundora",
                "4a444b": "Gravel",
                "4a4e5a": "Trout",
                "4b0082": "Pigment Indigo",
                "4b5d52": "Nandor",
                "4c3024": "Saddle",
                "4c4f56": "Abbey",
                "4d0135": "Blackberry",
                "4d0a18": "Cab Sav",
                "4d1e01": "Indian Tan",
                "4d282d": "Cowboy",
                "4d282e": "Livid Brown",
                "4d3833": "Rock",
                "4d3d14": "Punga",
                "4d400f": "Bronzetone",
                "4d5328": "Woodland",
                "4e0606": "Mahogany",
                "4e2a5a": "Bossanova",
                "4e3b41": "Matterhorn",
                "4e420c": "Bronze Olive",
                "4e4562": "Mulled Wine",
                "4e6649": "Axolotl",
                "4e7f9e": "Wedgewood",
                "4eabd1": "Shakespeare",
                "4f1c70": "Honey Flower",
                "4f2398": "Daisy Bush",
                "4f69c6": "Indigo",
                "4f7942": "Fern Green",
                "4f9d5d": "Fruit Salad",
                "4fa83d": "Apple",
                "504351": "Mortar",
                "507096": "Kashmir Blue",
                "507672": "Cutty Sark",
                "50c878": "Emerald",
                "514649": "Emperor",
                "516e3d": "Chalet Green",
                "517c66": "Como",
                "51808f": "Smalt Blue",
                "52001f": "Castro",
                "520c17": "Maroon Oak",
                "523c94": "Gigas",
                "533455": "Voodoo",
                "534491": "Victoria",
                "53824b": "Hippie Green",
                "541012": "Heath",
                "544333": "Judge Gray",
                "54534d": "Fuscous Gray",
                "549019": "Vida Loca",
                "55280c": "Cioccolato",
                "555b10": "Saratoga",
                "556d56": "Finlandia",
                "5590d9": "Havelock Blue",
                "56b4be": "Fountain Blue",
                "578363": "Spring Leaves",
                "583401": "Saddle Brown",
                "585562": "Scarpa Flow",
                "587156": "Cactus",
                "589aaf": "Hippie Blue",
                "591d35": "Wine Berry",
                "592804": "Brown Bramble",
                "593737": "Congo Brown",
                "594433": "Millbrook",
                "5a6e9c": "Waikawa Gray",
                "5a87a0": "Horizon",
                "5b3013": "Jambalaya",
                "5c0120": "Bordeaux",
                "5c0536": "Mulberry Wood",
                "5c2e01": "Carnaby Tan",
                "5c5d75": "Comet",
                "5d1e0f": "Redwood",
                "5d4c51": "Don Juan",
                "5d5c58": "Chicago",
                "5d5e37": "Verdigris",
                "5d7747": "Dingley",
                "5da19f": "Breaker Bay",
                "5e483e": "Kabul",
                "5e5d3b": "Hemlock",
                "5f3d26": "Irish Coffee",
                "5f5f6e": "Mid Gray",
                "5f6672": "Shuttle Gray",
                "5fa777": "Aqua Forest",
                "5fb3ac": "Tradewind",
                "604913": "Horses Neck",
                "605b73": "Smoky",
                "606e68": "Corduroy",
                "6093d1": "Danube",
                "612718": "Espresso",
                "614051": "Eggplant",
                "615d30": "Costa Del Sol",
                "61845f": "Glade Green",
                "622f30": "Buccaneer",
                "623f2d": "Quincy",
                "624e9a": "Butterfly Bush",
                "625119": "West Coast",
                "626649": "Finch",
                "639a8f": "Patina",
                "63b76c": "Fern",
                "6456b7": "Blue Violet",
                "646077": "Dolphin",
                "646463": "Storm Dust",
                "646a54": "Siam",
                "646e75": "Nevada",
                "6495ed": "Cornflower Blue",
                "64ccdb": "Viking",
                "65000b": "Rosewood",
                "651a14": "Cherrywood",
                "652dc1": "Purple Heart",
                "657220": "Fern Frond",
                "65745d": "Willow Grove",
                "65869f": "Hoki",
                "660045": "Pompadour",
                "660099": "Purple",
                "66023c": "Tyrian Purple",
                "661010": "Dark Tan",
                "66b58f": "Silver Tree",
                "66ff00": "Bright Green",
                "66ff66": "Screamin' Green",
                "67032d": "Black Rose",
                "675fa6": "Scampi",
                "676662": "Ironside Gray",
                "678975": "Viridian Green",
                "67a712": "Christi",
                "683600": "Nutmeg Wood Finish",
                "685558": "Zambezi",
                "685e6e": "Salt Box",
                "692545": "Tawny Port",
                "692d54": "Finn",
                "695f62": "Scorpion",
                "697e9a": "Lynch",
                "6a442e": "Spice",
                "6a5d1b": "Himalaya",
                "6a6051": "Soya Bean",
                "6b2a14": "Hairy Heath",
                "6b3fa0": "Royal Purple",
                "6b4e31": "Shingle Fawn",
                "6b5755": "Dorado",
                "6b8ba2": "Bermuda Gray",
                "6b8e23": "Olive Drab",
                "6c3082": "Eminence",
                "6cdae7": "Turquoise Blue",
                "6d0101": "Lonestar",
                "6d5e54": "Pine Cone",
                "6d6c6c": "Dove Gray",
                "6d9292": "Juniper",
                "6d92a1": "Gothic",
                "6e0902": "Red Oxide",
                "6e1d14": "Moccaccino",
                "6e4826": "Pickled Bean",
                "6e4b26": "Dallas",
                "6e6d57": "Kokoda",
                "6e7783": "Pale Sky",
                "6f440c": "Cafe Royale",
                "6f6a61": "Flint",
                "6f8e63": "Highland",
                "6f9d02": "Limeade",
                "6fd0c5": "Downy",
                "701c1c": "Persian Plum",
                "704214": "Sepia",
                "704a07": "Antique Bronze",
                "704f50": "Ferra",
                "706555": "Coffee",
                "708090": "Slate Gray",
                "711a00": "Cedar Wood Finish",
                "71291d": "Metallic Copper",
                "714693": "Affair",
                "714ab2": "Studio",
                "715d47": "Tobacco Brown",
                "716338": "Yellow Metal",
                "716b56": "Peat",
                "716e10": "Olivetone",
                "717486": "Storm Gray",
                "718080": "Sirocco",
                "71d9e2": "Aquamarine Blue",
                "72010f": "Venetian Red",
                "724a2f": "Old Copper",
                "726d4e": "Go Ben",
                "727b89": "Raven",
                "731e8f": "Seance",
                "734a12": "Raw Umber",
                "736c9f": "Kimberly",
                "736d58": "Crocodile",
                "737829": "Crete",
                "738678": "Xanadu",
                "74640d": "Spicy Mustard",
                "747d63": "Limed Ash",
                "747d83": "Rolling Stone",
                "748881": "Blue Smoke",
                "749378": "Laurel",
                "74c365": "Mantis",
                "755a57": "Russett",
                "7563a8": "Deluge",
                "76395d": "Cosmic",
                "7666c6": "Blue Marguerite",
                "76bd17": "Lima",
                "76d7ea": "Sky Blue",
                "770f05": "Dark Burgundy",
                "771f1f": "Crown of Thorns",
                "773f1a": "Walnut",
                "776f61": "Pablo",
                "778120": "Pacifika",
                "779e86": "Oxley",
                "77dd77": "Pastel Green",
                "780109": "Japanese Maple",
                "782d19": "Mocha",
                "782f16": "Peanut",
                "78866b": "Camouflage Green",
                "788a25": "Wasabi",
                "788bba": "Ship Cove",
                "78a39c": "Sea Nymph",
                "795d4c": "Roman Coffee",
                "796878": "Old Lavender",
                "796989": "Rum",
                "796a78": "Fedora",
                "796d62": "Sandstone",
                "79deec": "Spray",
                "7a013a": "Siren",
                "7a58c1": "Fuchsia Blue",
                "7a7a7a": "Boulder",
                "7a89b8": "Wild Blue Yonder",
                "7ac488": "De York",
                "7b3801": "Red Beech",
                "7b3f00": "Cinnamon",
                "7b6608": "Yukon Gold",
                "7b7874": "Tapa",
                "7b7c94": "Waterloo ",
                "7b8265": "Flax Smoke",
                "7b9f80": "Amulet",
                "7ba05b": "Asparagus",
                "7c1c05": "Kenyan Copper",
                "7c7631": "Pesto",
                "7c778a": "Topaz",
                "7c7b7a": "Concord",
                "7c7b82": "Jumbo",
                "7c881a": "Trendy Green",
                "7ca1a6": "Gumbo",
                "7cb0a1": "Acapulco",
                "7cb7bb": "Neptune",
                "7d2c14": "Pueblo",
                "7da98d": "Bay Leaf",
                "7dc8f7": "Malibu",
                "7dd8c6": "Bermuda",
                "7e3a15": "Copper Canyon",
                "7f1734": "Claret",
                "7f3a02": "Peru Tan",
                "7f626d": "Falcon",
                "7f7589": "Mobster",
                "7f76d3": "Moody Blue",
                "7fff00": "Chartreuse",
                "7fffd4": "Aquamarine",
                "800000": "Maroon",
                "800b47": "Rose Bud Cherry",
                "801818": "Falu Red",
                "80341f": "Red Robin",
                "803790": "Vivid Violet",
                "80461b": "Russet",
                "807e79": "Friar Gray",
                "808000": "Olive",
                "808080": "Gray",
                "80b3ae": "Gulf Stream",
                "80b3c4": "Glacier",
                "80ccea": "Seagull",
                "81422c": "Nutmeg",
                "816e71": "Spicy Pink",
                "817377": "Empress",
                "819885": "Spanish Green",
                "826f65": "Sand Dune",
                "828685": "Gunsmoke",
                "828f72": "Battleship Gray",
                "831923": "Merlot",
                "837050": "Shadow",
                "83aa5d": "Chelsea Cucumber",
                "83d0c6": "Monte Carlo",
                "843179": "Plum",
                "84a0a0": "Granny Smith",
                "8581d9": "Chetwode Blue",
                "858470": "Bandicoot",
                "859faf": "Bali Hai",
                "85c4cc": "Half Baked",
                "860111": "Red Devil",
                "863c3c": "Lotus",
                "86483c": "Ironstone",
                "864d1e": "Bull Shot",
                "86560a": "Rusty Nail",
                "868974": "Bitter",
                "86949f": "Regent Gray",
                "871550": "Disco",
                "87756e": "Americano",
                "877c7b": "Hurricane",
                "878d91": "Oslo Gray",
                "87ab39": "Sushi",
                "885342": "Spicy Mix",
                "886221": "Kumera",
                "888387": "Suva Gray",
                "888d65": "Avocado",
                "893456": "Camelot",
                "893843": "Solid Pink",
                "894367": "Cannon Pink",
                "897d6d": "Makara",
                "8a3324": "Burnt Umber",
                "8a73d6": "True V",
                "8a8360": "Clay Creek",
                "8a8389": "Monsoon",
                "8a8f8a": "Stack",
                "8ab9f1": "Jordy Blue",
                "8b00ff": "Electric Violet",
                "8b0723": "Monarch",
                "8b6b0b": "Corn Harvest",
                "8b8470": "Olive Haze",
                "8b847e": "Schooner",
                "8b8680": "Natural Gray",
                "8b9c90": "Mantle",
                "8b9fee": "Portage",
                "8ba690": "Envy",
                "8ba9a5": "Cascade",
                "8be6d8": "Riptide",
                "8c055e": "Cardinal Pink",
                "8c472f": "Mule Fawn",
                "8c5738": "Potters Clay",
                "8c6495": "Trendy Pink",
                "8d0226": "Paprika",
                "8d3d38": "Sanguine Brown",
                "8d3f3f": "Tosca",
                "8d7662": "Cement",
                "8d8974": "Granite Green",
                "8d90a1": "Manatee",
                "8da8cc": "Polo Blue",
                "8e0000": "Red Berry",
                "8e4d1e": "Rope",
                "8e6f70": "Opium",
                "8e775e": "Domino",
                "8e8190": "Mamba",
                "8eabc1": "Nepal",
                "8f021c": "Pohutukawa",
                "8f3e33": "El Salva",
                "8f4b0e": "Korma",
                "8f8176": "Squirrel",
                "8fd6b4": "Vista Blue",
                "900020": "Burgundy",
                "901e1e": "Old Brick",
                "907874": "Hemp",
                "907b71": "Almond Frost",
                "908d39": "Sycamore",
                "92000a": "Sangria",
                "924321": "Cumin",
                "926f5b": "Beaver",
                "928573": "Stonewall",
                "928590": "Venus",
                "9370db": "Medium Purple",
                "93ccea": "Cornflower",
                "93dfb8": "Algae Green",
                "944747": "Copper Rust",
                "948771": "Arrowtown",
                "950015": "Scarlett",
                "956387": "Strikemaster",
                "959396": "Mountain Mist",
                "960018": "Carmine",
                "964b00": "Brown",
                "967059": "Leather",
                "9678b6": "Purple Mountain's Majesty",
                "967bb6": "Lavender Purple",
                "96a8a1": "Pewter",
                "96bbab": "Summer Green",
                "97605d": "Au Chico",
                "9771b5": "Wisteria",
                "97cd2d": "Atlantis",
                "983d61": "Vin Rouge",
                "9874d3": "Lilac Bush",
                "98777b": "Bazaar",
                "98811b": "Hacienda",
                "988d77": "Pale Oyster",
                "98ff98": "Mint Green",
                "990066": "Fresh Eggplant",
                "991199": "Violet Eggplant",
                "991613": "Tamarillo",
                "991b07": "Totem Pole",
                "996666": "Copper Rose",
                "9966cc": "Amethyst",
                "997a8d": "Mountbatten Pink",
                "9999cc": "Blue Bell",
                "9a3820": "Prairie Sand",
                "9a6e61": "Toast",
                "9a9577": "Gurkha",
                "9ab973": "Olivine",
                "9ac2b8": "Shadow Green",
                "9b4703": "Oregon",
                "9b9e8f": "Lemon Grass",
                "9c3336": "Stiletto",
                "9d5616": "Hawaiian Tan",
                "9dacb7": "Gull Gray",
                "9dc209": "Pistachio",
                "9de093": "Granny Smith Apple",
                "9de5ff": "Anakiwa",
                "9e5302": "Chelsea Gem",
                "9e5b40": "Sepia Skin",
                "9ea587": "Sage",
                "9ea91f": "Citron",
                "9eb1cd": "Rock Blue",
                "9edee0": "Morning Glory",
                "9f381d": "Cognac",
                "9f821c": "Reef Gold",
                "9f9f9c": "Star Dust",
                "9fa0b1": "Santas Gray",
                "9fd7d3": "Sinbad",
                "9fdd8c": "Feijoa",
                "a02712": "Tabasco",
                "a1750d": "Buttered Rum",
                "a1adb5": "Hit Gray",
                "a1c50a": "Citrus",
                "a1dad7": "Aqua Island",
                "a1e9de": "Water Leaf",
                "a2006d": "Flirt",
                "a23b6c": "Rouge",
                "a26645": "Cape Palliser",
                "a2aab3": "Gray Chateau",
                "a2aeab": "Edward",
                "a3807b": "Pharlap",
                "a397b4": "Amethyst Smoke",
                "a3e3ed": "Blizzard Blue",
                "a4a49d": "Delta",
                "a4a6d3": "Wistful",
                "a4af6e": "Green Smoke",
                "a50b5e": "Jazzberry Jam",
                "a59b91": "Zorba",
                "a5cb0c": "Bahia",
                "a62f20": "Roof Terracotta",
                "a65529": "Paarl",
                "a68b5b": "Barley Corn",
                "a69279": "Donkey Brown",
                "a6a29a": "Dawn",
                "a72525": "Mexican Red",
                "a7882c": "Luxor Gold",
                "a85307": "Rich Gold",
                "a86515": "Reno Sand",
                "a86b6b": "Coral Tree",
                "a8989b": "Dusty Gray",
                "a899e6": "Dull Lavender",
                "a8a589": "Tallow",
                "a8ae9c": "Bud",
                "a8af8e": "Locust",
                "a8bd9f": "Norway",
                "a8e3bd": "Chinook",
                "a9a491": "Gray Olive",
                "a9acb6": "Aluminium",
                "a9b2c3": "Cadet Blue",
                "a9b497": "Schist",
                "a9bdbf": "Tower Gray",
                "a9bef2": "Perano",
                "a9c6c2": "Opal",
                "aa375a": "Night Shadz",
                "aa4203": "Fire",
                "aa8b5b": "Muesli",
                "aa8d6f": "Sandal",
                "aaa5a9": "Shady Lady",
                "aaa9cd": "Logan",
                "aaabb7": "Spun Pearl",
                "aad6e6": "Regent St Blue",
                "aaf0d1": "Magic Mint",
                "ab0563": "Lipstick",
                "ab3472": "Royal Heath",
                "ab917a": "Sandrift",
                "aba0d9": "Cold Purple",
                "aba196": "Bronco",
                "ac8a56": "Limed Oak",
                "ac91ce": "East Side",
                "ac9e22": "Lemon Ginger",
                "aca494": "Napa",
                "aca586": "Hillary",
                "aca59f": "Cloudy",
                "acacac": "Silver Chalice",
                "acb78e": "Swamp Green",
                "accbb1": "Spring Rain",
                "acdd4d": "Conifer",
                "ace1af": "Celadon",
                "ad781b": "Mandalay",
                "adbed1": "Casper",
                "addfad": "Moss Green",
                "ade6c4": "Padua",
                "adff2f": "Green Yellow",
                "ae4560": "Hippie Pink",
                "ae6020": "Desert",
                "ae809e": "Bouquet",
                "af4035": "Medium Carmine",
                "af4d43": "Apple Blossom",
                "af593e": "Brown Rust",
                "af8751": "Driftwood",
                "af8f2c": "Alpine",
                "af9f1c": "Lucky",
                "afa09e": "Martini",
                "afb1b8": "Bombay",
                "afbdd9": "Pigeon Post",
                "b04c6a": "Cadillac",
                "b05d54": "Matrix",
                "b05e81": "Tapestry",
                "b06608": "Mai Tai",
                "b09a95": "Del Rio",
                "b0e0e6": "Powder Blue",
                "b0e313": "Inch Worm",
                "b10000": "Bright Red",
                "b14a0b": "Vesuvius",
                "b1610b": "Pumpkin Skin",
                "b16d52": "Santa Fe",
                "b19461": "Teak",
                "b1e2c1": "Fringy Flower",
                "b1f4e7": "Ice Cold",
                "b20931": "Shiraz",
                "b2a1ea": "Biloba Flower",
                "b32d29": "Tall Poppy",
                "b35213": "Fiery Orange",
                "b38007": "Hot Toddy",
                "b3af95": "Taupe Gray",
                "b3c110": "La Rioja",
                "b43332": "Well Read",
                "b44668": "Blush",
                "b4cfd3": "Jungle Mist",
                "b57281": "Turkish Rose",
                "b57edc": "Lavender",
                "b5a27f": "Mongoose",
                "b5b35c": "Olive Green",
                "b5d2ce": "Jet Stream",
                "b5ecdf": "Cruise",
                "b6316c": "Hibiscus",
                "b69d98": "Thatch",
                "b6b095": "Heathered Gray",
                "b6baa4": "Eagle",
                "b6d1ea": "Spindle",
                "b6d3bf": "Gum Leaf",
                "b7410e": "Rust",
                "b78e5c": "Muddy Waters",
                "b7a214": "Sahara",
                "b7a458": "Husk",
                "b7b1b1": "Nobel",
                "b7c3d0": "Heather",
                "b7f0be": "Madang",
                "b81104": "Milano Red",
                "b87333": "Copper",
                "b8b56a": "Gimblet",
                "b8c1b1": "Green Spring",
                "b8c25d": "Celery",
                "b8e0f9": "Sail",
                "b94e48": "Chestnut",
                "b95140": "Crail",
                "b98d28": "Marigold",
                "b9c46a": "Wild Willow",
                "b9c8ac": "Rainee",
                "ba0101": "Guardsman Red",
                "ba450c": "Rock Spray",
                "ba6f1e": "Bourbon",
                "ba7f03": "Pirate Gold",
                "bab1a2": "Nomad",
                "bac7c9": "Submarine",
                "baeef9": "Charlotte",
                "bb3385": "Medium Red Violet",
                "bb8983": "Brandy Rose",
                "bbd009": "Rio Grande",
                "bbd7c1": "Surf",
                "bcc9c2": "Powder Ash",
                "bd5e2e": "Tuscany",
                "bd978e": "Quicksand",
                "bdb1a8": "Silk",
                "bdb2a1": "Malta",
                "bdb3c7": "Chatelle",
                "bdbbd7": "Lavender Gray",
                "bdbdc6": "French Gray",
                "bdc8b3": "Clay Ash",
                "bdc9ce": "Loblolly",
                "bdedfd": "French Pass",
                "bea6c3": "London Hue",
                "beb5b7": "Pink Swan",
                "bede0d": "Fuego",
                "bf5500": "Rose of Sharon",
                "bfb8b0": "Tide",
                "bfbed8": "Blue Haze",
                "bfc1c2": "Silver Sand",
                "bfc921": "Key Lime Pie",
                "bfdbe2": "Ziggurat",
                "bfff00": "Lime",
                "c02b18": "Thunderbird",
                "c04737": "Mojo",
                "c08081": "Old Rose",
                "c0c0c0": "Silver",
                "c0d3b9": "Pale Leaf",
                "c0d8b6": "Pixie Green",
                "c1440e": "Tia Maria",
                "c154c1": "Fuchsia Pink",
                "c1a004": "Buddha Gold",
                "c1b7a4": "Bison Hide",
                "c1bab0": "Tea",
                "c1becd": "Gray Suit",
                "c1d7b0": "Sprout",
                "c1f07c": "Sulu",
                "c26b03": "Indochine",
                "c2955d": "Twine",
                "c2bdb6": "Cotton Seed",
                "c2cac4": "Pumice",
                "c2e8e5": "Jagged Ice",
                "c32148": "Maroon Flush",
                "c3b091": "Indian Khaki",
                "c3bfc1": "Pale Slate",
                "c3c3bd": "Gray Nickel",
                "c3cde6": "Periwinkle Gray",
                "c3d1d1": "Tiara",
                "c3ddf9": "Tropical Blue",
                "c41e3a": "Cardinal",
                "c45655": "Fuzzy Wuzzy Brown",
                "c45719": "Orange Roughy",
                "c4c4bc": "Mist Gray",
                "c4d0b0": "Coriander",
                "c4f4eb": "Mint Tulip",
                "c54b8c": "Mulberry",
                "c59922": "Nugget",
                "c5994b": "Tussock",
                "c5dbca": "Sea Mist",
                "c5e17a": "Yellow Green",
                "c62d42": "Brick Red",
                "c6726b": "Contessa",
                "c69191": "Oriental Pink",
                "c6a84b": "Roti",
                "c6c3b5": "Ash",
                "c6c8bd": "Kangaroo",
                "c6e610": "Las Palmas",
                "c7031e": "Monza",
                "c71585": "Red Violet",
                "c7bca2": "Coral Reef",
                "c7c1ff": "Melrose",
                "c7c4bf": "Cloud",
                "c7c9d5": "Ghost",
                "c7cd90": "Pine Glade",
                "c7dde5": "Botticelli",
                "c88a65": "Antique Brass",
                "c8a2c8": "Lilac",
                "c8a528": "Hokey Pokey",
                "c8aabf": "Lily",
                "c8b568": "Laser",
                "c8e3d7": "Edgewater",
                "c96323": "Piper",
                "c99415": "Pizza",
                "c9a0dc": "Light Wisteria",
                "c9b29b": "Rodeo Dust",
                "c9b35b": "Sundance",
                "c9b93b": "Earls Green",
                "c9c0bb": "Silver Rust",
                "c9d9d2": "Conch",
                "c9ffa2": "Reef",
                "c9ffe5": "Aero Blue",
                "ca3435": "Flush Mahogany",
                "cabb48": "Turmeric",
                "cadcd4": "Paris White",
                "cae00d": "Bitter Lemon",
                "cae6da": "Skeptic",
                "cb8fa9": "Viola",
                "cbcab6": "Foggy Gray",
                "cbd3b0": "Green Mist",
                "cbdbd6": "Nebula",
                "cc3333": "Persian Red",
                "cc5500": "Burnt Orange",
                "cc7722": "Ochre",
                "cc8899": "Puce",
                "cccaa8": "Thistle Green",
                "ccccff": "Periwinkle",
                "ccff00": "Electric Lime",
                "cd5700": "Tenn",
                "cd5c5c": "Chestnut Rose",
                "cd8429": "Brandy Punch",
                "cdf4ff": "Onahau",
                "ceb98f": "Sorrell Brown",
                "cebaba": "Cold Turkey",
                "cec291": "Yuma",
                "cec7a7": "Chino",
                "cfa39d": "Eunry",
                "cfb53b": "Old Gold",
                "cfdccf": "Tasman",
                "cfe5d2": "Surf Crest",
                "cff9f3": "Humming Bird",
                "cffaf4": "Scandal",
                "d05f04": "Red Stage",
                "d06da1": "Hopbush",
                "d07d12": "Meteor",
                "d0bef8": "Perfume",
                "d0c0e5": "Prelude",
                "d0f0c0": "Tea Green",
                "d18f1b": "Geebung",
                "d1bea8": "Vanilla",
                "d1c6b4": "Soft Amber",
                "d1d2ca": "Celeste",
                "d1d2dd": "Mischka",
                "d1e231": "Pear",
                "d2691e": "Hot Cinnamon",
                "d27d46": "Raw Sienna",
                "d29eaa": "Careys Pink",
                "d2b48c": "Tan",
                "d2da97": "Deco",
                "d2f6de": "Blue Romance",
                "d2f8b0": "Gossip",
                "d3cbba": "Sisal",
                "d3cdc5": "Swirl",
                "d47494": "Charm",
                "d4b6af": "Clam Shell",
                "d4bf8d": "Straw",
                "d4c4a8": "Akaroa",
                "d4cd16": "Bird Flower",
                "d4d7d9": "Iron",
                "d4dfe2": "Geyser",
                "d4e2fc": "Hawkes Blue",
                "d54600": "Grenadier",
                "d591a4": "Can Can",
                "d59a6f": "Whiskey",
                "d5d195": "Winter Hazel",
                "d5f6e3": "Granny Apple",
                "d69188": "My Pink",
                "d6c562": "Tacha",
                "d6cef6": "Moon Raker",
                "d6d6d1": "Quill Gray",
                "d6ffdb": "Snowy Mint",
                "d7837f": "New York Pink",
                "d7c498": "Pavlova",
                "d7d0ff": "Fog",
                "d84437": "Valencia",
                "d87c63": "Japonica",
                "d8bfd8": "Thistle",
                "d8c2d5": "Maverick",
                "d8fcfa": "Foam",
                "d94972": "Cabaret",
                "d99376": "Burning Sand",
                "d9b99b": "Cameo",
                "d9d6cf": "Timberwolf",
                "d9dcc1": "Tana",
                "d9e4f5": "Link Water",
                "d9f7ff": "Mabel",
                "da3287": "Cerise",
                "da5b38": "Flame Pea",
                "da6304": "Bamboo",
                "da6a41": "Red Damask",
                "da70d6": "Orchid",
                "da8a67": "Copperfield",
                "daa520": "Golden Grass",
                "daecd6": "Zanah",
                "daf4f0": "Iceberg",
                "dafaff": "Oyster Bay",
                "db5079": "Cranberry",
                "db9690": "Petite Orchid",
                "db995e": "Di Serria",
                "dbdbdb": "Alto",
                "dbfff8": "Frosted Mint",
                "dc143c": "Crimson",
                "dc4333": "Punch",
                "dcb20c": "Galliano",
                "dcb4bc": "Blossom",
                "dcd747": "Wattle",
                "dcd9d2": "Westar",
                "dcddcc": "Moon Mist",
                "dcedb4": "Caper",
                "dcf0ea": "Swans Down",
                "ddd6d5": "Swiss Coffee",
                "ddf9f1": "White Ice",
                "de3163": "Cerise Red",
                "de6360": "Roman",
                "dea681": "Tumbleweed",
                "deba13": "Gold Tips",
                "dec196": "Brandy",
                "decbc6": "Wafer",
                "ded4a4": "Sapling",
                "ded717": "Barberry",
                "dee5c0": "Beryl Green",
                "def5ff": "Pattens Blue",
                "df73ff": "Heliotrope",
                "dfbe6f": "Apache",
                "dfcd6f": "Chenin",
                "dfcfdb": "Lola",
                "dfecda": "Willow Brook",
                "dfff00": "Chartreuse Yellow",
                "e0b0ff": "Mauve",
                "e0b646": "Anzac",
                "e0b974": "Harvest Gold",
                "e0c095": "Calico",
                "e0ffff": "Baby Blue",
                "e16865": "Sunglo",
                "e1bc64": "Equator",
                "e1c0c8": "Pink Flare",
                "e1e6d6": "Periglacial Blue",
                "e1ead4": "Kidnapper",
                "e1f6e8": "Tara",
                "e25465": "Mandy",
                "e2725b": "Terracotta",
                "e28913": "Golden Bell",
                "e292c0": "Shocking",
                "e29418": "Dixie",
                "e29cd2": "Light Orchid",
                "e2d8ed": "Snuff",
                "e2ebed": "Mystic",
                "e2f3ec": "Apple Green",
                "e30b5c": "Razzmatazz",
                "e32636": "Alizarin Crimson",
                "e34234": "Cinnabar",
                "e3bebe": "Cavern Pink",
                "e3f5e1": "Peppermint",
                "e3f988": "Mindaro",
                "e47698": "Deep Blush",
                "e49b0f": "Gamboge",
                "e4c2d5": "Melanie",
                "e4cfde": "Twilight",
                "e4d1c0": "Bone",
                "e4d422": "Sunflower",
                "e4d5b7": "Grain Brown",
                "e4d69b": "Zombie",
                "e4f6e7": "Frostee",
                "e4ffd1": "Snow Flurry",
                "e52b50": "Amaranth",
                "e5841b": "Zest",
                "e5ccc9": "Dust Storm",
                "e5d7bd": "Stark White",
                "e5d8af": "Hampton",
                "e5e0e1": "Bon Jour",
                "e5e5e5": "Mercury",
                "e5f9f6": "Polar",
                "e64e03": "Trinidad",
                "e6be8a": "Gold Sand",
                "e6bea5": "Cashmere",
                "e6d7b9": "Double Spanish White",
                "e6e4d4": "Satin Linen",
                "e6f2ea": "Harp",
                "e6f8f3": "Off Green",
                "e6ffe9": "Hint of Green",
                "e6ffff": "Tranquil",
                "e77200": "Mango Tango",
                "e7730a": "Christine",
                "e79f8c": "Tonys Pink",
                "e79fc4": "Kobi",
                "e7bcb4": "Rose Fog",
                "e7bf05": "Corn",
                "e7cd8c": "Putty",
                "e7ece6": "Gray Nurse",
                "e7f8ff": "Lily White",
                "e7feff": "Bubbles",
                "e89928": "Fire Bush",
                "e8b9b3": "Shilo",
                "e8e0d5": "Pearl Bush",
                "e8ebe0": "Green White",
                "e8f1d4": "Chrome White",
                "e8f2eb": "Gin",
                "e8f5f2": "Aqua Squeeze",
                "e96e00": "Clementine",
                "e97451": "Burnt Sienna",
                "e97c07": "Tahiti Gold",
                "e9cecd": "Oyster Pink",
                "e9d75a": "Confetti",
                "e9e3e3": "Ebb",
                "e9f8ed": "Ottoman",
                "e9fffd": "Clear Day",
                "ea88a8": "Carissma",
                "eaae69": "Porsche",
                "eab33b": "Tulip Tree",
                "eac674": "Rob Roy",
                "eadab8": "Raffia",
                "eae8d4": "White Rock",
                "eaf6ee": "Panache",
                "eaf6ff": "Solitude",
                "eaf9f5": "Aqua Spring",
                "eafffe": "Dew",
                "eb9373": "Apricot",
                "ebc2af": "Zinnwaldite",
                "eca927": "Fuel Yellow",
                "ecc54e": "Ronchi",
                "ecc7ee": "French Lilac",
                "eccdb9": "Just Right",
                "ece090": "Wild Rice",
                "ecebbd": "Fall Green",
                "ecebce": "Aths Special",
                "ecf245": "Starship",
                "ed0a3f": "Red Ribbon",
                "ed7a1c": "Tango",
                "ed9121": "Carrot Orange",
                "ed989e": "Sea Pink",
                "edb381": "Tacao",
                "edc9af": "Desert Sand",
                "edcdab": "Pancho",
                "eddcb1": "Chamois",
                "edea99": "Primrose",
                "edf5dd": "Frost",
                "edf5f5": "Aqua Haze",
                "edf6ff": "Zumthor",
                "edf9f1": "Narvik",
                "edfc84": "Honeysuckle",
                "ee82ee": "Lavender Magenta",
                "eec1be": "Beauty Bush",
                "eed794": "Chalky",
                "eed9c4": "Almond",
                "eedc82": "Flax",
                "eededa": "Bizarre",
                "eee3ad": "Double Colonial White",
                "eeeee8": "Cararra",
                "eeef78": "Manz",
                "eef0c8": "Tahuna Sands",
                "eef0f3": "Athens Gray",
                "eef3c3": "Tusk",
                "eef4de": "Loafer",
                "eef6f7": "Catskill White",
                "eefdff": "Twilight Blue",
                "eeff9a": "Jonquil",
                "eeffe2": "Rice Flower",
                "ef863f": "Jaffa",
                "efefef": "Gallery",
                "eff2f3": "Porcelain",
                "f091a9": "Mauvelous",
                "f0d52d": "Golden Dream",
                "f0db7d": "Golden Sand",
                "f0dc82": "Buff",
                "f0e2ec": "Prim",
                "f0e68c": "Khaki",
                "f0eefd": "Selago",
                "f0eeff": "Titan White",
                "f0f8ff": "Alice Blue",
                "f0fcea": "Feta",
                "f18200": "Gold Drop",
                "f19bab": "Wewak",
                "f1e788": "Sahara Sand",
                "f1e9d2": "Parchment",
                "f1e9ff": "Blue Chalk",
                "f1eec1": "Mint Julep",
                "f1f1f1": "Seashell",
                "f1f7f2": "Saltpan",
                "f1ffad": "Tidal",
                "f1ffc8": "Chiffon",
                "f2552a": "Flamingo",
                "f28500": "Tangerine",
                "f2c3b2": "Mandys Pink",
                "f2f2f2": "Concrete",
                "f2fafa": "Black Squeeze",
                "f34723": "Pomegranate",
                "f3ad16": "Buttercup",
                "f3d69d": "New Orleans",
                "f3d9df": "Vanilla Ice",
                "f3e7bb": "Sidecar",
                "f3e9e5": "Dawn Pink",
                "f3edcf": "Wheatfield",
                "f3fb62": "Canary",
                "f3fbd4": "Orinoco",
                "f3ffd8": "Carla",
                "f400a1": "Hollywood Cerise",
                "f4a460": "Sandy brown",
                "f4c430": "Saffron",
                "f4d81c": "Ripe Lemon",
                "f4ebd3": "Janna",
                "f4f2ee": "Pampas",
                "f4f4f4": "Wild Sand",
                "f4f8ff": "Zircon",
                "f57584": "Froly",
                "f5c85c": "Cream Can",
                "f5c999": "Manhattan",
                "f5d5a0": "Maize",
                "f5deb3": "Wheat",
                "f5e7a2": "Sandwisp",
                "f5e7e2": "Pot Pourri",
                "f5e9d3": "Albescent White",
                "f5edef": "Soft Peach",
                "f5f3e5": "Ecru White",
                "f5f5dc": "Beige",
                "f5fb3d": "Golden Fizz",
                "f5ffbe": "Australian Mint",
                "f64a8a": "French Rose",
                "f653a6": "Brilliant Rose",
                "f6a4c9": "Illusion",
                "f6f0e6": "Merino",
                "f6f7f7": "Black Haze",
                "f6ffdc": "Spring Sun",
                "f7468a": "Violet Red",
                "f77703": "Chilean Fire",
                "f77fbe": "Persian Pink",
                "f7b668": "Rajah",
                "f7c8da": "Azalea",
                "f7dbe6": "We Peep",
                "f7f2e1": "Quarter Spanish White",
                "f7f5fa": "Whisper",
                "f7faf7": "Snow Drift",
                "f8b853": "Casablanca",
                "f8c3df": "Chantilly",
                "f8d9e9": "Cherub",
                "f8db9d": "Marzipan",
                "f8dd5c": "Energy Yellow",
                "f8e4bf": "Givry",
                "f8f0e8": "White Linen",
                "f8f4ff": "Magnolia",
                "f8f6f1": "Spring Wood",
                "f8f7dc": "Coconut Cream",
                "f8f7fc": "White Lilac",
                "f8f8f7": "Desert Storm",
                "f8f99c": "Texas",
                "f8facd": "Corn Field",
                "f8fdd3": "Mimosa",
                "f95a61": "Carnation",
                "f9bf58": "Saffron Mango",
                "f9e0ed": "Carousel Pink",
                "f9e4bc": "Dairy Cream",
                "f9e663": "Portica",
                "f9eaf3": "Amour",
                "f9f8e4": "Rum Swizzle",
                "f9ff8b": "Dolly",
                "f9fff6": "Sugar Cane",
                "fa7814": "Ecstasy",
                "fa9d5a": "Tan Hide",
                "fad3a2": "Corvette",
                "fadfad": "Peach Yellow",
                "fae600": "Turbo",
                "faeab9": "Astra",
                "faeccc": "Champagne",
                "faf0e6": "Linen",
                "faf3f0": "Fantasy",
                "faf7d6": "Citrine White",
                "fafafa": "Alabaster",
                "fafde4": "Hint of Yellow",
                "faffa4": "Milan",
                "fb607f": "Brink Pink",
                "fb8989": "Geraldine",
                "fba0e3": "Lavender Rose",
                "fba129": "Sea Buckthorn",
                "fbac13": "Sun",
                "fbaed2": "Lavender Pink",
                "fbb2a3": "Rose Bud",
                "fbbeda": "Cupid",
                "fbcce7": "Classic Rose",
                "fbceb1": "Apricot Peach",
                "fbe7b2": "Banana Mania",
                "fbe870": "Marigold Yellow",
                "fbe96c": "Festival",
                "fbea8c": "Sweet Corn",
                "fbec5d": "Candy Corn",
                "fbf9f9": "Hint of Red",
                "fbffba": "Shalimar",
                "fc0fc0": "Shocking Pink",
                "fc80a5": "Tickle Me Pink",
                "fc9c1d": "Tree Poppy",
                "fcc01e": "Lightning Yellow",
                "fcd667": "Goldenrod",
                "fcd917": "Candlelight",
                "fcda98": "Cherokee",
                "fcf4d0": "Double Pearl Lusta",
                "fcf4dc": "Pearl Lusta",
                "fcf8f7": "Vista White",
                "fcfbf3": "Bianca",
                "fcfeda": "Moon Glow",
                "fcffe7": "China Ivory",
                "fcfff9": "Ceramic",
                "fd0e35": "Torch Red",
                "fd5b78": "Wild Watermelon",
                "fd7b33": "Crusta",
                "fd7c07": "Sorbus",
                "fd9fa2": "Sweet Pink",
                "fdd5b1": "Light Apricot",
                "fdd7e4": "Pig Pink",
                "fde1dc": "Cinderella",
                "fde295": "Golden Glow",
                "fde910": "Lemon",
                "fdf5e6": "Old Lace",
                "fdf6d3": "Half Colonial White",
                "fdf7ad": "Drover",
                "fdfeb8": "Pale Prim",
                "fdffd5": "Cumulus",
                "fe28a2": "Persian Rose",
                "fe4c40": "Sunset Orange",
                "fe6f5e": "Bittersweet",
                "fe9d04": "California",
                "fea904": "Yellow Sea",
                "febaad": "Melon",
                "fed33c": "Bright Sun",
                "fed85d": "Dandelion",
                "fedb8d": "Salomie",
                "fee5ac": "Cape Honey",
                "feebf3": "Remy",
                "feefce": "Oasis",
                "fef0ec": "Bridesmaid",
                "fef2c7": "Beeswax",
                "fef3d8": "Bleach White",
                "fef4cc": "Pipi",
                "fef4db": "Half Spanish White",
                "fef4f8": "Wisp Pink",
                "fef5f1": "Provincial Pink",
                "fef7de": "Half Dutch White",
                "fef8e2": "Solitaire",
                "fef8ff": "White Pointer",
                "fef9e3": "Off Yellow",
                "fefced": "Orange White",
                "ff0000": "Red",
                "ff007f": "Rose",
                "ff00cc": "Purple Pizzazz",
                "ff00ff": "Magenta / Fuchsia",
                "ff2400": "Scarlet",
                "ff3399": "Wild Strawberry",
                "ff33cc": "Razzle Dazzle Rose",
                "ff355e": "Radical Red",
                "ff3f34": "Red Orange",
                "ff4040": "Coral Red",
                "ff4d00": "Vermilion",
                "ff4f00": "International Orange",
                "ff6037": "Outrageous Orange",
                "ff6600": "Blaze Orange",
                "ff66ff": "Pink Flamingo",
                "ff681f": "Orange",
                "ff69b4": "Hot Pink",
                "ff6b53": "Persimmon",
                "ff6fff": "Blush Pink",
                "ff7034": "Burning Orange",
                "ff7518": "Pumpkin",
                "ff7d07": "Flamenco",
                "ff7f00": "Flush Orange",
                "ff7f50": "Coral",
                "ff8c69": "Salmon",
                "ff9000": "Pizazz",
                "ff910f": "West Side",
                "ff91a4": "Pink Salmon",
                "ff9933": "Neon Carrot",
                "ff9966": "Atomic Tangerine",
                "ff9980": "Vivid Tangerine",
                "ff9e2c": "Sunshade",
                "ffa000": "Orange Peel",
                "ffa194": "Mona Lisa",
                "ffa500": "Web Orange",
                "ffa6c9": "Carnation Pink",
                "ffab81": "Hit Pink",
                "ffae42": "Yellow Orange",
                "ffb0ac": "Cornflower Lilac",
                "ffb1b3": "Sundown",
                "ffb31f": "My Sin",
                "ffb555": "Texas Rose",
                "ffb7d5": "Cotton Candy",
                "ffb97b": "Macaroni and Cheese",
                "ffba00": "Selective Yellow",
                "ffbd5f": "Koromiko",
                "ffbf00": "Amber",
                "ffc0a8": "Wax Flower",
                "ffc0cb": "Pink",
                "ffc3c0": "Your Pink",
                "ffc901": "Supernova",
                "ffcba4": "Flesh",
                "ffcc33": "Sunglow",
                "ffcc5c": "Golden Tainoi",
                "ffcc99": "Peach Orange",
                "ffcd8c": "Chardonnay",
                "ffd1dc": "Pastel Pink",
                "ffd2b7": "Romantic",
                "ffd38c": "Grandis",
                "ffd700": "Gold",
                "ffd800": "School bus Yellow",
                "ffd8d9": "Cosmos",
                "ffdb58": "Mustard",
                "ffdcd6": "Peach Schnapps",
                "ffddaf": "Caramel",
                "ffddcd": "Tuft Bush",
                "ffddcf": "Watusi",
                "ffddf4": "Pink Lace",
                "ffdead": "Navajo White",
                "ffdeb3": "Frangipani",
                "ffe1df": "Pippin",
                "ffe1f2": "Pale Rose",
                "ffe2c5": "Negroni",
                "ffe5a0": "Cream Brulee",
                "ffe5b4": "Peach",
                "ffe6c7": "Tequila",
                "ffe772": "Kournikova",
                "ffeac8": "Sandy Beach",
                "ffead4": "Karry",
                "ffec13": "Broom",
                "ffedbc": "Colonial White",
                "ffeed8": "Derby",
                "ffefa1": "Vis Vis",
                "ffefc1": "Egg White",
                "ffefd5": "Papaya Whip",
                "ffefec": "Fair Pink",
                "fff0db": "Peach Cream",
                "fff0f5": "Lavender blush",
                "fff14f": "Gorse",
                "fff1b5": "Buttermilk",
                "fff1d8": "Pink Lady",
                "fff1ee": "Forget Me Not",
                "fff1f9": "Tutu",
                "fff39d": "Picasso",
                "fff3f1": "Chardon",
                "fff46e": "Paris Daisy",
                "fff4ce": "Barley White",
                "fff4dd": "Egg Sour",
                "fff4e0": "Sazerac",
                "fff4e8": "Serenade",
                "fff4f3": "Chablis",
                "fff5ee": "Seashell Peach",
                "fff5f3": "Sauvignon",
                "fff6d4": "Milk Punch",
                "fff6df": "Varden",
                "fff6f5": "Rose White",
                "fff8d1": "Baja White",
                "fff9e2": "Gin Fizz",
                "fff9e6": "Early Dawn",
                "fffacd": "Lemon Chiffon",
                "fffaf4": "Bridal Heath",
                "fffbdc": "Scotch Mist",
                "fffbf9": "Soapstone",
                "fffc99": "Witch Haze",
                "fffcea": "Buttery White",
                "fffcee": "Island Spice",
                "fffdd0": "Cream",
                "fffde6": "Chilean Heath",
                "fffde8": "Travertine",
                "fffdf3": "Orchid White",
                "fffdf4": "Quarter Pearl Lusta",
                "fffee1": "Half and Half",
                "fffeec": "Apricot White",
                "fffef0": "Rice Cake",
                "fffef6": "Black White",
                "fffefd": "Romance",
                "ffff00": "Yellow",
                "ffff66": "Laser Lemon",
                "ffff99": "Pale Canary",
                "ffffb4": "Portafino",
                "fffff0": "Ivory",
                "ffffff": "White",
            };
            return (typeof colornames[this.toHex(a)] !== 'undefined' ? colornames[this.toHex(a)] : false);
        },
        toCMYKString: function (a) {
            var hex = this.toHex(a);
            var computedC = 0;
            var computedM = 0;
            var computedY = 0;
            var computedK = 0;

            hex = (hex.charAt(0)=="#") ? hex.substring(1,7) : hex;

            if (hex.length != 6) {
                return '';
            }
            if (/[0-9a-f]{6}/i.test(hex) != true) {
                return '';
            }

            var r = parseInt(hex.substring(0,2),16);
            var g = parseInt(hex.substring(2,4),16);
            var b = parseInt(hex.substring(4,6),16);

            // BLACK
            if (r==0 && g==0 && b==0) {
                computedK = 1;
                return [0,0,0,1];
            }

            computedC = 1 - (r/255);
            computedM = 1 - (g/255);
            computedY = 1 - (b/255);

            var minCMY = Math.min(computedC,Math.min(computedM,computedY));

            computedC = (computedC - minCMY) / (1 - minCMY) ;
            computedM = (computedM - minCMY) / (1 - minCMY) ;
            computedY = (computedY - minCMY) / (1 - minCMY) ;
            computedK = minCMY;

            return "cmyk("+computedC.toFixed(2)+' , '+computedM.toFixed(2)+' , '+computedY.toFixed(2)+' , '+computedK.toFixed(2)+")";
            //return [computedC,computedM,computedY,computedK];
        },
        toRgb: function () {
            return {
                r: P(this._r),
                g: P(this._g),
                b: P(this._b),
                a: this._a
            }
        },
        toRgbString: function () {
            return 1 == this._a ? "rgb(" + P(this._r) + ", " + P(this._g) + ", " + P(this._b) + ")" : "rgba(" + P(this._r) + ", " + P(this._g) + ", " + P(this._b) + ", " + this._roundA + ")"
        },
        toPercentageRgb: function () {
            return {
                r: P(100 * A(this._r, 255)) + "%",
                g: P(100 * A(this._g, 255)) + "%",
                b: P(100 * A(this._b, 255)) + "%",
                a: this._a
            }
        },
        toPercentageRgbString: function () {
            return 1 == this._a ? "rgb(" + P(100 * A(this._r, 255)) + "%, " + P(100 * A(this._g, 255)) + "%, " + P(100 * A(this._b, 255)) + "%)" : "rgba(" + P(100 * A(this._r, 255)) + "%, " + P(100 * A(this._g, 255)) + "%, " + P(100 * A(this._b, 255)) + "%, " + this._roundA + ")"
        },
        toName: function () {
            return 0 === this._a ? "transparent" : this._a < 1 ? !1 : U[i(this._r, this._g, this._b, !0)] || !1
        },
        toFilter: function (a) {
            var c = "#" + k(this._r, this._g, this._b, this._a),
                d = c,
                e = this._gradientType ? "GradientType = 1, " : "";
            if (a) {
                var f = b(a);
                d = "#" + k(f._r, f._g, f._b, f._a)
            }
            return "progid:DXImageTransform.Microsoft.gradient(" + e + "startColorstr=" + c + ",endColorstr=" + d + ")"
        },
        toString: function (a) {
            var b = !!a;
            a = a || this._format;
            var c = !1,
                d = this._a < 1 && this._a >= 0,
                e = !b && d && ("hex" === a || "hex6" === a || "hex3" === a || "hex4" === a || "hex8" === a || "name" === a);
            return e ? "name" === a && 0 === this._a ? this.toName() : this.toRgbString() : ("rgb" === a && (c = this.toRgbString()), "prgb" === a && (c = this.toPercentageRgbString()), ("hex" === a || "hex6" === a) && (c = this.toHexString()), "hex3" === a && (c = this.toHexString(!0)), "hex4" === a && (c = this.toHex8String(!0)), "hex8" === a && (c = this.toHex8String()), "name" === a && (c = this.toName()), "hsl" === a && (c = this.toHslString()), "hsv" === a && (c = this.toHsvString()), c || this.toHexString())
        },
        clone: function () {
            return b(this.toString())
        },
        _applyModification: function (a, b) {
            var c = a.apply(null, [this].concat([].slice.call(b)));
            return this._r = c._r, this._g = c._g, this._b = c._b, this.setAlpha(c._a), this
        },
        lighten: function () {
            return this._applyModification(o, arguments)
        },
        brighten: function () {
            return this._applyModification(p, arguments)
        },
        darken: function () {
            return this._applyModification(q, arguments)
        },
        desaturate: function () {
            return this._applyModification(l, arguments)
        },
        saturate: function () {
            return this._applyModification(m, arguments)
        },
        greyscale: function () {
            return this._applyModification(n, arguments)
        },
        spin: function () {
            return this._applyModification(r, arguments)
        },
        _applyCombination: function (a, b) {
            return a.apply(null, [this].concat([].slice.call(b)))
        },
        analogous: function () {
            return this._applyCombination(w, arguments)
        },
        complement: function () {
            return this._applyCombination(s, arguments)
        },
        monochromatic: function () {
            return this._applyCombination(x, arguments)
        },
        splitcomplement: function () {
            return this._applyCombination(v, arguments)
        },
        triad: function () {
            return this._applyCombination(t, arguments)
        },
        tetrad: function () {
            return this._applyCombination(u, arguments)
        }
    }, b.fromRatio = function (a, c) {
        if ("object" == typeof a) {
            var d = {};
            for (var e in a) a.hasOwnProperty(e) && (d[e] = "a" === e ? a[e] : G(a[e]));
            a = d
        }
        return b(a, c)
    }, b.equals = function (a, c) {
        return a && c ? b(a).toRgbString() == b(c).toRgbString() : !1
    }, b.random = function () {
        return b.fromRatio({
            r: S(),
            g: S(),
            b: S()
        })
    }, b.mix = function (a, c, d) {
        d = 0 === d ? 0 : d || 50;
        var e = b(a).toRgb(),
            f = b(c).toRgb(),
            g = d / 100,
            h = {
                r: (f.r - e.r) * g + e.r,
                g: (f.g - e.g) * g + e.g,
                b: (f.b - e.b) * g + e.b,
                a: (f.a - e.a) * g + e.a
            };
        return b(h)
    }, b.readability = function (c, d) {
        var e = b(c),
            f = b(d);
        return (a.max(e.getLuminance(), f.getLuminance()) + .05) / (a.min(e.getLuminance(), f.getLuminance()) + .05)
    }, b.isReadable = function (a, c, d) {
        var e, f, g = b.readability(a, c);
        switch (f = !1, e = L(d), e.level + e.size) {
            case "AAsmall":
            case "AAAlarge":
                f = g >= 4.5;
                break;
            case "AAlarge":
                f = g >= 3;
                break;
            case "AAAsmall":
                f = g >= 7
        }
        return f
    }, b.mostReadable = function (a, c, d) {
        var e, f, g, h, i = null,
            j = 0;
        d = d || {}, f = d.includeFallbackColors, g = d.level, h = d.size;
        for (var k = 0; k < c.length; k++) e = b.readability(a, c[k]), e > j && (j = e, i = b(c[k]));
        return b.isReadable(a, i, {
            level: g,
            size: h
        }) || !f ? i : (d.includeFallbackColors = !1, b.mostReadable(a, ["#fff", "#000"], d))
    };
    var T = b.names = {
            aliceblue: "f0f8ff",
            antiquewhite: "faebd7",
            aqua: "0ff",
            aquamarine: "7fffd4",
            azure: "f0ffff",
            beige: "f5f5dc",
            bisque: "ffe4c4",
            black: "000",
            blanchedalmond: "ffebcd",
            blue: "00f",
            blueviolet: "8a2be2",
            brown: "a52a2a",
            burlywood: "deb887",
            burntsienna: "ea7e5d",
            cadetblue: "5f9ea0",
            chartreuse: "7fff00",
            chocolate: "d2691e",
            coral: "ff7f50",
            cornflowerblue: "6495ed",
            cornsilk: "fff8dc",
            crimson: "dc143c",
            cyan: "0ff",
            darkblue: "00008b",
            darkcyan: "008b8b",
            darkgoldenrod: "b8860b",
            darkgray: "a9a9a9",
            darkgreen: "006400",
            darkgrey: "a9a9a9",
            darkkhaki: "bdb76b",
            darkmagenta: "8b008b",
            darkolivegreen: "556b2f",
            darkorange: "ff8c00",
            darkorchid: "9932cc",
            darkred: "8b0000",
            darksalmon: "e9967a",
            darkseagreen: "8fbc8f",
            darkslateblue: "483d8b",
            darkslategray: "2f4f4f",
            darkslategrey: "2f4f4f",
            darkturquoise: "00ced1",
            darkviolet: "9400d3",
            deeppink: "ff1493",
            deepskyblue: "00bfff",
            dimgray: "696969",
            dimgrey: "696969",
            dodgerblue: "1e90ff",
            firebrick: "b22222",
            floralwhite: "fffaf0",
            forestgreen: "228b22",
            fuchsia: "f0f",
            gainsboro: "dcdcdc",
            ghostwhite: "f8f8ff",
            gold: "ffd700",
            goldenrod: "daa520",
            gray: "808080",
            green: "008000",
            greenyellow: "adff2f",
            grey: "808080",
            honeydew: "f0fff0",
            hotpink: "ff69b4",
            indianred: "cd5c5c",
            indigo: "4b0082",
            ivory: "fffff0",
            khaki: "f0e68c",
            lavender: "e6e6fa",
            lavenderblush: "fff0f5",
            lawngreen: "7cfc00",
            lemonchiffon: "fffacd",
            lightblue: "add8e6",
            lightcoral: "f08080",
            lightcyan: "e0ffff",
            lightgoldenrodyellow: "fafad2",
            lightgray: "d3d3d3",
            lightgreen: "90ee90",
            lightgrey: "d3d3d3",
            lightpink: "ffb6c1",
            lightsalmon: "ffa07a",
            lightseagreen: "20b2aa",
            lightskyblue: "87cefa",
            lightslategray: "789",
            lightslategrey: "789",
            lightsteelblue: "b0c4de",
            lightyellow: "ffffe0",
            lime: "0f0",
            limegreen: "32cd32",
            linen: "faf0e6",
            magenta: "f0f",
            maroon: "800000",
            mediumaquamarine: "66cdaa",
            mediumblue: "0000cd",
            mediumorchid: "ba55d3",
            mediumpurple: "9370db",
            mediumseagreen: "3cb371",
            mediumslateblue: "7b68ee",
            mediumspringgreen: "00fa9a",
            mediumturquoise: "48d1cc",
            mediumvioletred: "c71585",
            midnightblue: "191970",
            mintcream: "f5fffa",
            mistyrose: "ffe4e1",
            moccasin: "ffe4b5",
            navajowhite: "ffdead",
            navy: "000080",
            oldlace: "fdf5e6",
            olive: "808000",
            olivedrab: "6b8e23",
            orange: "ffa500",
            orangered: "ff4500",
            orchid: "da70d6",
            palegoldenrod: "eee8aa",
            palegreen: "98fb98",
            paleturquoise: "afeeee",
            palevioletred: "db7093",
            papayawhip: "ffefd5",
            peachpuff: "ffdab9",
            peru: "cd853f",
            pink: "ffc0cb",
            plum: "dda0dd",
            powderblue: "b0e0e6",
            purple: "800080",
            rebeccapurple: "663399",
            red: "f00",
            rosybrown: "bc8f8f",
            royalblue: "4169e1",
            saddlebrown: "8b4513",
            salmon: "fa8072",
            sandybrown: "f4a460",
            seagreen: "2e8b57",
            seashell: "fff5ee",
            sienna: "a0522d",
            silver: "c0c0c0",
            skyblue: "87ceeb",
            slateblue: "6a5acd",
            slategray: "708090",
            slategrey: "708090",
            snow: "fffafa",
            springgreen: "00ff7f",
            steelblue: "4682b4",
            tan: "d2b48c",
            teal: "008080",
            thistle: "d8bfd8",
            tomato: "ff6347",
            turquoise: "40e0d0",
            violet: "ee82ee",
            wheat: "f5deb3",
            white: "fff",
            whitesmoke: "f5f5f5",
            yellow: "ff0",
            yellowgreen: "9acd32"
        },
        U = b.hexNames = y(T),
        V = function () {
            var a = "[-\\+]?\\d+%?",
                b = "[-\\+]?\\d*\\.\\d+%?",
                c = "(?:" + b + ")|(?:" + a + ")",
                d = "[\\s|\\(]+(" + c + ")[,|\\s]+(" + c + ")[,|\\s]+(" + c + ")\\s*\\)?",
                e = "[\\s|\\(]+(" + c + ")[,|\\s]+(" + c + ")[,|\\s]+(" + c + ")[,|\\s]+(" + c + ")\\s*\\)?";
            return {
                CSS_UNIT: new RegExp(c),
                rgb: new RegExp("rgb" + d),
                rgba: new RegExp("rgba" + e),
                hsl: new RegExp("hsl" + d),
                hsla: new RegExp("hsla" + e),
                hsv: new RegExp("hsv" + d),
                hsva: new RegExp("hsva" + e),
                hex3: /^#?([0-9a-fA-F]{1})([0-9a-fA-F]{1})([0-9a-fA-F]{1})$/,
                hex6: /^#?([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$/,
                hex4: /^#?([0-9a-fA-F]{1})([0-9a-fA-F]{1})([0-9a-fA-F]{1})([0-9a-fA-F]{1})$/,
                hex8: /^#?([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$/
            }
        }();
    "undefined" != typeof module && module.exports ? module.exports = b : "function" == typeof define && define.amd ? define(function () {
        return b
    }) : window.tinycolor = b
}(Math);