const __vite__fileDeps = [
        "assets/chunks/VPLocalSearchBox.CBNRattA.js",
        "assets/chunks/framework.rhG1036Q.js",
    ],
    __vite__mapDeps = (i) => i.map((i) => __vite__fileDeps[i]);
import {
    d as _,
    o as a,
    c,
    r as l,
    n as N,
    a as F,
    t as w,
    b as $,
    w as d,
    T as ve,
    e as f,
    _ as b,
    u as ye,
    i as Ge,
    f as je,
    g as pe,
    h as g,
    j as I,
    k as q,
    l as v,
    m as i,
    p as B,
    q as H,
    s as z,
    v as ie,
    x as j,
    y as J,
    z as he,
    A as Pe,
    B as ze,
    C as qe,
    D as K,
    F as M,
    E,
    G as Le,
    H as ee,
    I as m,
    J as W,
    K as Ve,
    L as te,
    M as X,
    N as oe,
    O as Ke,
    P as Se,
    Q as le,
    R as Re,
    S as Te,
    U as Y,
    V as We,
    W as Je,
    X as Ye,
    Y as we,
    Z as Ie,
    $ as Qe,
    a0 as Xe,
    a1 as Ze,
    a2 as xe,
} from "./framework.rhG1036Q.js";
const et = _({
        __name: "VPBadge",
        props: { text: {}, type: { default: "tip" } },
        setup(o) {
            return (e, t) => (
                a(),
                c(
                    "span",
                    { class: N(["VPBadge", e.type]) },
                    [l(e.$slots, "default", {}, () => [F(w(e.text), 1)])],
                    2,
                )
            );
        },
    }),
    tt = { key: 0, class: "VPBackdrop" },
    ot = _({
        __name: "VPBackdrop",
        props: { show: { type: Boolean } },
        setup(o) {
            return (e, t) => (
                a(),
                $(
                    ve,
                    { name: "fade" },
                    {
                        default: d(() => [
                            e.show ? (a(), c("div", tt)) : f("", !0),
                        ]),
                        _: 1,
                    },
                )
            );
        },
    }),
    st = b(ot, [["__scopeId", "data-v-c79a1216"]]),
    L = ye;
function nt(o, e) {
    let t,
        s = !1;
    return () => {
        t && clearTimeout(t),
            s
                ? (t = setTimeout(o, e))
                : (o(), (s = !0) && setTimeout(() => (s = !1), e));
    };
}
function ce(o) {
    return /^\//.test(o) ? o : `/${o}`;
}
function fe(o) {
    const {
        pathname: e,
        search: t,
        hash: s,
        protocol: n,
    } = new URL(o, "http://a.com");
    if (Ge(o) || o.startsWith("#") || !n.startsWith("http") || !je(e)) return o;
    const { site: r } = L(),
        u =
            e.endsWith("/") || e.endsWith(".html")
                ? o
                : o.replace(
                      /(?:(^\.+)\/)?.*$/,
                      `$1${e.replace(/(\.md)?$/, r.value.cleanUrls ? "" : ".html")}${t}${s}`,
                  );
    return pe(u);
}
function Q({ removeCurrent: o = !0, correspondingLink: e = !1 } = {}) {
    const { site: t, localeIndex: s, page: n, theme: r, hash: u } = L(),
        h = g(() => {
            var y, P;
            return {
                index: s.value,
                label:
                    (y = t.value.locales[s.value]) == null ? void 0 : y.label,
                link:
                    ((P = t.value.locales[s.value]) == null
                        ? void 0
                        : P.link) ||
                    (s.value === "root" ? "/" : `/${s.value}/`),
            };
        });
    return {
        localeLinks: g(() =>
            Object.entries(t.value.locales).flatMap(([y, P]) =>
                o && h.value.label === P.label
                    ? []
                    : {
                          index: y,
                          text: P.label,
                          link:
                              at(
                                  P.link || (y === "root" ? "/" : `/${y}/`),
                                  r.value.i18nRouting !== !1 && e,
                                  n.value.relativePath.slice(
                                      h.value.link.length - 1,
                                  ),
                                  !t.value.cleanUrls,
                              ) + u.value,
                      },
            ),
        ),
        currentLang: h,
    };
}
function at(o, e, t, s) {
    return e
        ? o.replace(/\/$/, "") +
              ce(
                  t
                      .replace(/(^|\/)index\.md$/, "$1")
                      .replace(/\.md$/, s ? ".html" : ""),
              )
        : o;
}
const rt = (o) => (B("data-v-4f08a194"), (o = o()), H(), o),
    it = { class: "NotFound" },
    lt = { class: "code" },
    ct = { class: "title" },
    ut = rt(() => v("div", { class: "divider" }, null, -1)),
    dt = { class: "quote" },
    vt = { class: "action" },
    pt = ["href", "aria-label"],
    ht = _({
        __name: "NotFound",
        setup(o) {
            const { site: e } = L(),
                { localeLinks: t } = Q({ removeCurrent: !1 }),
                s = I({ link: "/", index: "root" });
            q(() => {
                const r = window.location.pathname
                    .replace(e.value.base, "")
                    .replace(/(^.*?\/).*$/, "/$1");
                t.value.length &&
                    (s.value =
                        t.value.find(({ link: u }) => u.startsWith(r)) ||
                        t.value[0]);
            });
            const n = g(() => {
                var r, u, h, p;
                return {
                    code: 404,
                    title: "PAGE NOT FOUND",
                    quote: "But if you don't change your direction, and if you keep looking, you may end up where you are heading.",
                    linkLabel: "go to home",
                    linkText: "Take me home",
                    ...(s.value.index === "root"
                        ? (r = e.value.themeConfig) == null
                            ? void 0
                            : r.notFound
                        : (p =
                                (h =
                                    (u = e.value.locales) == null
                                        ? void 0
                                        : u[s.value.index]) == null
                                    ? void 0
                                    : h.themeConfig) == null
                          ? void 0
                          : p.notFound),
                };
            });
            return (r, u) => (
                a(),
                c("div", it, [
                    v("p", lt, w(n.value.code), 1),
                    v("h1", ct, w(n.value.title), 1),
                    ut,
                    v("blockquote", dt, w(n.value.quote), 1),
                    v("div", vt, [
                        v(
                            "a",
                            {
                                class: "link",
                                href: i(pe)(s.value.link),
                                "aria-label": n.value.linkLabel,
                            },
                            w(n.value.linkText),
                            9,
                            pt,
                        ),
                    ]),
                ])
            );
        },
    }),
    ft = b(ht, [["__scopeId", "data-v-4f08a194"]]);
function Ne(o, e) {
    if (Array.isArray(o)) return Z(o);
    if (o == null) return [];
    e = ce(e);
    const t = Object.keys(o)
            .sort((n, r) => r.split("/").length - n.split("/").length)
            .find((n) => e.startsWith(ce(n))),
        s = t ? o[t] : [];
    return Array.isArray(s) ? Z(s) : Z(s.items, s.base);
}
function _t(o) {
    const e = [];
    let t = 0;
    for (const s in o) {
        const n = o[s];
        if (n.items) {
            t = e.push(n);
            continue;
        }
        e[t] || e.push({ items: [] }), e[t].items.push(n);
    }
    return e;
}
function mt(o) {
    const e = [];
    function t(s) {
        for (const n of s)
            n.text &&
                n.link &&
                e.push({
                    text: n.text,
                    link: n.link,
                    docFooterText: n.docFooterText,
                }),
                n.items && t(n.items);
    }
    return t(o), e;
}
function ue(o, e) {
    return Array.isArray(e)
        ? e.some((t) => ue(o, t))
        : z(o, e.link)
          ? !0
          : e.items
            ? ue(o, e.items)
            : !1;
}
function Z(o, e) {
    return [...o].map((t) => {
        const s = { ...t },
            n = s.base || e;
        return (
            n && s.link && (s.link = n + s.link),
            s.items && (s.items = Z(s.items, n)),
            s
        );
    });
}
function O() {
    const { frontmatter: o, page: e, theme: t } = L(),
        s = ie("(min-width: 960px)"),
        n = I(!1),
        r = g(() => {
            const C = t.value.sidebar,
                S = e.value.relativePath;
            return C ? Ne(C, S) : [];
        }),
        u = I(r.value);
    j(r, (C, S) => {
        JSON.stringify(C) !== JSON.stringify(S) && (u.value = r.value);
    });
    const h = g(
            () =>
                o.value.sidebar !== !1 &&
                u.value.length > 0 &&
                o.value.layout !== "home",
        ),
        p = g(() =>
            y
                ? o.value.aside == null
                    ? t.value.aside === "left"
                    : o.value.aside === "left"
                : !1,
        ),
        y = g(() =>
            o.value.layout === "home"
                ? !1
                : o.value.aside != null
                  ? !!o.value.aside
                  : t.value.aside !== !1,
        ),
        P = g(() => h.value && s.value),
        k = g(() => (h.value ? _t(u.value) : []));
    function V() {
        n.value = !0;
    }
    function T() {
        n.value = !1;
    }
    function A() {
        n.value ? T() : V();
    }
    return {
        isOpen: n,
        sidebar: u,
        sidebarGroups: k,
        hasSidebar: h,
        hasAside: y,
        leftAside: p,
        isSidebarEnabled: P,
        open: V,
        close: T,
        toggle: A,
    };
}
function kt(o, e) {
    let t;
    J(() => {
        t = o.value ? document.activeElement : void 0;
    }),
        q(() => {
            window.addEventListener("keyup", s);
        }),
        he(() => {
            window.removeEventListener("keyup", s);
        });
    function s(n) {
        n.key === "Escape" && o.value && (e(), t == null || t.focus());
    }
}
function bt(o) {
    const { page: e, hash: t } = L(),
        s = I(!1),
        n = g(() => o.value.collapsed != null),
        r = g(() => !!o.value.link),
        u = I(!1),
        h = () => {
            u.value = z(e.value.relativePath, o.value.link);
        };
    j([e, o, t], h), q(h);
    const p = g(() =>
            u.value
                ? !0
                : o.value.items
                  ? ue(e.value.relativePath, o.value.items)
                  : !1,
        ),
        y = g(() => !!(o.value.items && o.value.items.length));
    J(() => {
        s.value = !!(n.value && o.value.collapsed);
    }),
        Pe(() => {
            (u.value || p.value) && (s.value = !1);
        });
    function P() {
        n.value && (s.value = !s.value);
    }
    return {
        collapsed: s,
        collapsible: n,
        isLink: r,
        isActiveLink: u,
        hasActiveLink: p,
        hasChildren: y,
        toggle: P,
    };
}
function $t() {
    const { hasSidebar: o } = O(),
        e = ie("(min-width: 960px)"),
        t = ie("(min-width: 1280px)");
    return {
        isAsideEnabled: g(() =>
            !t.value && !e.value ? !1 : o.value ? t.value : e.value,
        ),
    };
}
const de = [];
function Me(o) {
    return (
        (typeof o.outline == "object" &&
            !Array.isArray(o.outline) &&
            o.outline.label) ||
        o.outlineTitle ||
        "On this page"
    );
}
function _e(o) {
    const e = [...document.querySelectorAll(".VPDoc :where(h1,h2,h3,h4,h5,h6)")]
        .filter((t) => t.id && t.hasChildNodes())
        .map((t) => {
            const s = Number(t.tagName[1]);
            return { element: t, title: gt(t), link: "#" + t.id, level: s };
        });
    return yt(e, o);
}
function gt(o) {
    let e = "";
    for (const t of o.childNodes)
        if (t.nodeType === 1) {
            if (
                t.classList.contains("VPBadge") ||
                t.classList.contains("header-anchor") ||
                t.classList.contains("ignore-header")
            )
                continue;
            e += t.textContent;
        } else t.nodeType === 3 && (e += t.textContent);
    return e.trim();
}
function yt(o, e) {
    if (e === !1) return [];
    const t = (typeof e == "object" && !Array.isArray(e) ? e.level : e) || 2,
        [s, n] = typeof t == "number" ? [t, t] : t === "deep" ? [2, 6] : t;
    (o = o.filter((u) => u.level >= s && u.level <= n)), (de.length = 0);
    for (const { element: u, link: h } of o) de.push({ element: u, link: h });
    const r = [];
    e: for (let u = 0; u < o.length; u++) {
        const h = o[u];
        if (u === 0) r.push(h);
        else {
            for (let p = u - 1; p >= 0; p--) {
                const y = o[p];
                if (y.level < h.level) {
                    (y.children || (y.children = [])).push(h);
                    continue e;
                }
            }
            r.push(h);
        }
    }
    return r;
}
function Pt(o, e) {
    const { isAsideEnabled: t } = $t(),
        s = nt(r, 100);
    let n = null;
    q(() => {
        requestAnimationFrame(r), window.addEventListener("scroll", s);
    }),
        ze(() => {
            u(location.hash);
        }),
        he(() => {
            window.removeEventListener("scroll", s);
        });
    function r() {
        if (!t.value) return;
        const h = window.scrollY,
            p = window.innerHeight,
            y = document.body.offsetHeight,
            P = Math.abs(h + p - y) < 1,
            k = de
                .map(({ element: T, link: A }) => ({ link: A, top: Lt(T) }))
                .filter(({ top: T }) => !Number.isNaN(T))
                .sort((T, A) => T.top - A.top);
        if (!k.length) {
            u(null);
            return;
        }
        if (h < 1) {
            u(null);
            return;
        }
        if (P) {
            u(k[k.length - 1].link);
            return;
        }
        let V = null;
        for (const { link: T, top: A } of k) {
            if (A > h + qe() + 4) break;
            V = T;
        }
        u(V);
    }
    function u(h) {
        n && n.classList.remove("active"),
            h == null
                ? (n = null)
                : (n = o.value.querySelector(
                      `a[href="${decodeURIComponent(h)}"]`,
                  ));
        const p = n;
        p
            ? (p.classList.add("active"),
              (e.value.style.top = p.offsetTop + 39 + "px"),
              (e.value.style.opacity = "1"))
            : ((e.value.style.top = "33px"), (e.value.style.opacity = "0"));
    }
}
function Lt(o) {
    let e = 0;
    for (; o !== document.body; ) {
        if (o === null) return NaN;
        (e += o.offsetTop), (o = o.offsetParent);
    }
    return e;
}
const Vt = ["href", "title"],
    St = _({
        __name: "VPDocOutlineItem",
        props: { headers: {}, root: { type: Boolean } },
        setup(o) {
            function e({ target: t }) {
                const s = t.href.split("#")[1],
                    n = document.getElementById(decodeURIComponent(s));
                n == null || n.focus({ preventScroll: !0 });
            }
            return (t, s) => {
                const n = K("VPDocOutlineItem", !0);
                return (
                    a(),
                    c(
                        "ul",
                        {
                            class: N([
                                "VPDocOutlineItem",
                                t.root ? "root" : "nested",
                            ]),
                        },
                        [
                            (a(!0),
                            c(
                                M,
                                null,
                                E(
                                    t.headers,
                                    ({ children: r, link: u, title: h }) => (
                                        a(),
                                        c("li", null, [
                                            v(
                                                "a",
                                                {
                                                    class: "outline-link",
                                                    href: u,
                                                    onClick: e,
                                                    title: h,
                                                },
                                                w(h),
                                                9,
                                                Vt,
                                            ),
                                            r != null && r.length
                                                ? (a(),
                                                  $(
                                                      n,
                                                      { key: 0, headers: r },
                                                      null,
                                                      8,
                                                      ["headers"],
                                                  ))
                                                : f("", !0),
                                        ])
                                    ),
                                ),
                                256,
                            )),
                        ],
                        2,
                    )
                );
            };
        },
    }),
    Ae = b(St, [["__scopeId", "data-v-b933a997"]]),
    Tt = { class: "content" },
    wt = {
        "aria-level": "2",
        class: "outline-title",
        id: "doc-outline-aria-label",
        role: "heading",
    },
    It = _({
        __name: "VPDocAsideOutline",
        setup(o) {
            const { frontmatter: e, theme: t } = L(),
                s = Le([]);
            ee(() => {
                s.value = _e(e.value.outline ?? t.value.outline);
            });
            const n = I(),
                r = I();
            return (
                Pt(n, r),
                (u, h) => (
                    a(),
                    c(
                        "nav",
                        {
                            "aria-labelledby": "doc-outline-aria-label",
                            class: N([
                                "VPDocAsideOutline",
                                { "has-outline": s.value.length > 0 },
                            ]),
                            ref_key: "container",
                            ref: n,
                            role: "navigation",
                        },
                        [
                            v("div", Tt, [
                                v(
                                    "div",
                                    {
                                        class: "outline-marker",
                                        ref_key: "marker",
                                        ref: r,
                                    },
                                    null,
                                    512,
                                ),
                                v("div", wt, w(i(Me)(i(t))), 1),
                                m(Ae, { headers: s.value, root: !0 }, null, 8, [
                                    "headers",
                                ]),
                            ]),
                        ],
                        2,
                    )
                )
            );
        },
    }),
    Nt = b(It, [["__scopeId", "data-v-269c27a6"]]),
    Mt = { class: "VPDocAsideCarbonAds" },
    At = _({
        __name: "VPDocAsideCarbonAds",
        props: { carbonAds: {} },
        setup(o) {
            const e = () => null;
            return (t, s) => (
                a(),
                c("div", Mt, [
                    m(i(e), { "carbon-ads": t.carbonAds }, null, 8, [
                        "carbon-ads",
                    ]),
                ])
            );
        },
    }),
    Ct = (o) => (B("data-v-3f215769"), (o = o()), H(), o),
    Bt = { class: "VPDocAside" },
    Ht = Ct(() => v("div", { class: "spacer" }, null, -1)),
    Et = _({
        __name: "VPDocAside",
        setup(o) {
            const { theme: e } = L();
            return (t, s) => (
                a(),
                c("div", Bt, [
                    l(t.$slots, "aside-top", {}, void 0, !0),
                    l(t.$slots, "aside-outline-before", {}, void 0, !0),
                    m(Nt),
                    l(t.$slots, "aside-outline-after", {}, void 0, !0),
                    Ht,
                    l(t.$slots, "aside-ads-before", {}, void 0, !0),
                    i(e).carbonAds
                        ? (a(),
                          $(
                              At,
                              { key: 0, "carbon-ads": i(e).carbonAds },
                              null,
                              8,
                              ["carbon-ads"],
                          ))
                        : f("", !0),
                    l(t.$slots, "aside-ads-after", {}, void 0, !0),
                    l(t.$slots, "aside-bottom", {}, void 0, !0),
                ])
            );
        },
    }),
    Dt = b(Et, [["__scopeId", "data-v-3f215769"]]);
function Ft() {
    const { theme: o, page: e } = L();
    return g(() => {
        const { text: t = "Edit this page", pattern: s = "" } =
            o.value.editLink || {};
        let n;
        return (
            typeof s == "function"
                ? (n = s(e.value))
                : (n = s.replace(/:path/g, e.value.filePath)),
            { url: n, text: t }
        );
    });
}
function Ot() {
    const { page: o, theme: e, frontmatter: t } = L();
    return g(() => {
        var y, P, k, V, T, A, C, S;
        const s = Ne(e.value.sidebar, o.value.relativePath),
            n = mt(s),
            r = Ut(n, (U) => U.link.replace(/[?#].*$/, "")),
            u = r.findIndex((U) => z(o.value.relativePath, U.link)),
            h =
                (((y = e.value.docFooter) == null ? void 0 : y.prev) === !1 &&
                    !t.value.prev) ||
                t.value.prev === !1,
            p =
                (((P = e.value.docFooter) == null ? void 0 : P.next) === !1 &&
                    !t.value.next) ||
                t.value.next === !1;
        return {
            prev: h
                ? void 0
                : {
                      text:
                          (typeof t.value.prev == "string"
                              ? t.value.prev
                              : typeof t.value.prev == "object"
                                ? t.value.prev.text
                                : void 0) ??
                          ((k = r[u - 1]) == null ? void 0 : k.docFooterText) ??
                          ((V = r[u - 1]) == null ? void 0 : V.text),
                      link:
                          (typeof t.value.prev == "object"
                              ? t.value.prev.link
                              : void 0) ??
                          ((T = r[u - 1]) == null ? void 0 : T.link),
                  },
            next: p
                ? void 0
                : {
                      text:
                          (typeof t.value.next == "string"
                              ? t.value.next
                              : typeof t.value.next == "object"
                                ? t.value.next.text
                                : void 0) ??
                          ((A = r[u + 1]) == null ? void 0 : A.docFooterText) ??
                          ((C = r[u + 1]) == null ? void 0 : C.text),
                      link:
                          (typeof t.value.next == "object"
                              ? t.value.next.link
                              : void 0) ??
                          ((S = r[u + 1]) == null ? void 0 : S.link),
                  },
        };
    });
}
function Ut(o, e) {
    const t = new Set();
    return o.filter((s) => {
        const n = e(s);
        return t.has(n) ? !1 : t.add(n);
    });
}
const D = _({
        __name: "VPLink",
        props: {
            tag: {},
            href: {},
            noIcon: { type: Boolean },
            target: {},
            rel: {},
        },
        setup(o) {
            const e = o,
                t = g(() => e.tag ?? (e.href ? "a" : "span")),
                s = g(() => e.href && Ve.test(e.href));
            return (n, r) => (
                a(),
                $(
                    W(t.value),
                    {
                        class: N([
                            "VPLink",
                            {
                                link: n.href,
                                "vp-external-link-icon": s.value,
                                "no-icon": n.noIcon,
                            },
                        ]),
                        href: n.href ? i(fe)(n.href) : void 0,
                        target: n.target ?? (s.value ? "_blank" : void 0),
                        rel: n.rel ?? (s.value ? "noreferrer" : void 0),
                    },
                    { default: d(() => [l(n.$slots, "default")]), _: 3 },
                    8,
                    ["class", "href", "target", "rel"],
                )
            );
        },
    }),
    Gt = { class: "VPLastUpdated" },
    jt = ["datetime"],
    zt = _({
        __name: "VPDocFooterLastUpdated",
        setup(o) {
            const { theme: e, page: t, frontmatter: s, lang: n } = L(),
                r = g(
                    () => new Date(s.value.lastUpdated ?? t.value.lastUpdated),
                ),
                u = g(() => r.value.toISOString()),
                h = I("");
            return (
                q(() => {
                    J(() => {
                        var p, y, P;
                        h.value = new Intl.DateTimeFormat(
                            (y =
                                (p = e.value.lastUpdated) == null
                                    ? void 0
                                    : p.formatOptions) != null && y.forceLocale
                                ? n.value
                                : void 0,
                            ((P = e.value.lastUpdated) == null
                                ? void 0
                                : P.formatOptions) ?? {
                                dateStyle: "short",
                                timeStyle: "short",
                            },
                        ).format(r.value);
                    });
                }),
                (p, y) => {
                    var P;
                    return (
                        a(),
                        c("p", Gt, [
                            F(
                                w(
                                    ((P = i(e).lastUpdated) == null
                                        ? void 0
                                        : P.text) ||
                                        i(e).lastUpdatedText ||
                                        "Last updated",
                                ) + ": ",
                                1,
                            ),
                            v("time", { datetime: u.value }, w(h.value), 9, jt),
                        ])
                    );
                }
            );
        },
    }),
    qt = b(zt, [["__scopeId", "data-v-7e05ebdb"]]),
    Ce = (o) => (B("data-v-d4a0bba5"), (o = o()), H(), o),
    Kt = { key: 0, class: "VPDocFooter" },
    Rt = { key: 0, class: "edit-info" },
    Wt = { key: 0, class: "edit-link" },
    Jt = Ce(() =>
        v("span", { class: "vpi-square-pen edit-link-icon" }, null, -1),
    ),
    Yt = { key: 1, class: "last-updated" },
    Qt = {
        key: 1,
        class: "prev-next",
        "aria-labelledby": "doc-footer-aria-label",
    },
    Xt = Ce(() =>
        v(
            "span",
            { class: "visually-hidden", id: "doc-footer-aria-label" },
            "Pager",
            -1,
        ),
    ),
    Zt = { class: "pager" },
    xt = ["innerHTML"],
    eo = ["innerHTML"],
    to = { class: "pager" },
    oo = ["innerHTML"],
    so = ["innerHTML"],
    no = _({
        __name: "VPDocFooter",
        setup(o) {
            const { theme: e, page: t, frontmatter: s } = L(),
                n = Ft(),
                r = Ot(),
                u = g(() => e.value.editLink && s.value.editLink !== !1),
                h = g(() => t.value.lastUpdated && s.value.lastUpdated !== !1),
                p = g(() => u.value || h.value || r.value.prev || r.value.next);
            return (y, P) => {
                var k, V, T, A;
                return p.value
                    ? (a(),
                      c("footer", Kt, [
                          l(y.$slots, "doc-footer-before", {}, void 0, !0),
                          u.value || h.value
                              ? (a(),
                                c("div", Rt, [
                                    u.value
                                        ? (a(),
                                          c("div", Wt, [
                                              m(
                                                  D,
                                                  {
                                                      class: "edit-link-button",
                                                      href: i(n).url,
                                                      "no-icon": !0,
                                                  },
                                                  {
                                                      default: d(() => [
                                                          Jt,
                                                          F(
                                                              " " +
                                                                  w(i(n).text),
                                                              1,
                                                          ),
                                                      ]),
                                                      _: 1,
                                                  },
                                                  8,
                                                  ["href"],
                                              ),
                                          ]))
                                        : f("", !0),
                                    h.value
                                        ? (a(), c("div", Yt, [m(qt)]))
                                        : f("", !0),
                                ]))
                              : f("", !0),
                          ((k = i(r).prev) != null && k.link) ||
                          ((V = i(r).next) != null && V.link)
                              ? (a(),
                                c("nav", Qt, [
                                    Xt,
                                    v("div", Zt, [
                                        (T = i(r).prev) != null && T.link
                                            ? (a(),
                                              $(
                                                  D,
                                                  {
                                                      key: 0,
                                                      class: "pager-link prev",
                                                      href: i(r).prev.link,
                                                  },
                                                  {
                                                      default: d(() => {
                                                          var C;
                                                          return [
                                                              v(
                                                                  "span",
                                                                  {
                                                                      class: "desc",
                                                                      innerHTML:
                                                                          ((C =
                                                                              i(
                                                                                  e,
                                                                              ).docFooter) ==
                                                                          null
                                                                              ? void 0
                                                                              : C.prev) ||
                                                                          "Previous page",
                                                                  },
                                                                  null,
                                                                  8,
                                                                  xt,
                                                              ),
                                                              v(
                                                                  "span",
                                                                  {
                                                                      class: "title",
                                                                      innerHTML:
                                                                          i(r)
                                                                              .prev
                                                                              .text,
                                                                  },
                                                                  null,
                                                                  8,
                                                                  eo,
                                                              ),
                                                          ];
                                                      }),
                                                      _: 1,
                                                  },
                                                  8,
                                                  ["href"],
                                              ))
                                            : f("", !0),
                                    ]),
                                    v("div", to, [
                                        (A = i(r).next) != null && A.link
                                            ? (a(),
                                              $(
                                                  D,
                                                  {
                                                      key: 0,
                                                      class: "pager-link next",
                                                      href: i(r).next.link,
                                                  },
                                                  {
                                                      default: d(() => {
                                                          var C;
                                                          return [
                                                              v(
                                                                  "span",
                                                                  {
                                                                      class: "desc",
                                                                      innerHTML:
                                                                          ((C =
                                                                              i(
                                                                                  e,
                                                                              ).docFooter) ==
                                                                          null
                                                                              ? void 0
                                                                              : C.next) ||
                                                                          "Next page",
                                                                  },
                                                                  null,
                                                                  8,
                                                                  oo,
                                                              ),
                                                              v(
                                                                  "span",
                                                                  {
                                                                      class: "title",
                                                                      innerHTML:
                                                                          i(r)
                                                                              .next
                                                                              .text,
                                                                  },
                                                                  null,
                                                                  8,
                                                                  so,
                                                              ),
                                                          ];
                                                      }),
                                                      _: 1,
                                                  },
                                                  8,
                                                  ["href"],
                                              ))
                                            : f("", !0),
                                    ]),
                                ]))
                              : f("", !0),
                      ]))
                    : f("", !0);
            };
        },
    }),
    ao = b(no, [["__scopeId", "data-v-d4a0bba5"]]),
    ro = (o) => (B("data-v-39a288b8"), (o = o()), H(), o),
    io = { class: "container" },
    lo = ro(() => v("div", { class: "aside-curtain" }, null, -1)),
    co = { class: "aside-container" },
    uo = { class: "aside-content" },
    vo = { class: "content" },
    po = { class: "content-container" },
    ho = { class: "main" },
    fo = _({
        __name: "VPDoc",
        setup(o) {
            const { theme: e } = L(),
                t = te(),
                { hasSidebar: s, hasAside: n, leftAside: r } = O(),
                u = g(() =>
                    t.path.replace(/[./]+/g, "_").replace(/_html$/, ""),
                );
            return (h, p) => {
                const y = K("Content");
                return (
                    a(),
                    c(
                        "div",
                        {
                            class: N([
                                "VPDoc",
                                { "has-sidebar": i(s), "has-aside": i(n) },
                            ]),
                        },
                        [
                            l(h.$slots, "doc-top", {}, void 0, !0),
                            v("div", io, [
                                i(n)
                                    ? (a(),
                                      c(
                                          "div",
                                          {
                                              key: 0,
                                              class: N([
                                                  "aside",
                                                  { "left-aside": i(r) },
                                              ]),
                                          },
                                          [
                                              lo,
                                              v("div", co, [
                                                  v("div", uo, [
                                                      m(Dt, null, {
                                                          "aside-top": d(() => [
                                                              l(
                                                                  h.$slots,
                                                                  "aside-top",
                                                                  {},
                                                                  void 0,
                                                                  !0,
                                                              ),
                                                          ]),
                                                          "aside-bottom": d(
                                                              () => [
                                                                  l(
                                                                      h.$slots,
                                                                      "aside-bottom",
                                                                      {},
                                                                      void 0,
                                                                      !0,
                                                                  ),
                                                              ],
                                                          ),
                                                          "aside-outline-before":
                                                              d(() => [
                                                                  l(
                                                                      h.$slots,
                                                                      "aside-outline-before",
                                                                      {},
                                                                      void 0,
                                                                      !0,
                                                                  ),
                                                              ]),
                                                          "aside-outline-after":
                                                              d(() => [
                                                                  l(
                                                                      h.$slots,
                                                                      "aside-outline-after",
                                                                      {},
                                                                      void 0,
                                                                      !0,
                                                                  ),
                                                              ]),
                                                          "aside-ads-before": d(
                                                              () => [
                                                                  l(
                                                                      h.$slots,
                                                                      "aside-ads-before",
                                                                      {},
                                                                      void 0,
                                                                      !0,
                                                                  ),
                                                              ],
                                                          ),
                                                          "aside-ads-after": d(
                                                              () => [
                                                                  l(
                                                                      h.$slots,
                                                                      "aside-ads-after",
                                                                      {},
                                                                      void 0,
                                                                      !0,
                                                                  ),
                                                              ],
                                                          ),
                                                          _: 3,
                                                      }),
                                                  ]),
                                              ]),
                                          ],
                                          2,
                                      ))
                                    : f("", !0),
                                v("div", vo, [
                                    v("div", po, [
                                        l(
                                            h.$slots,
                                            "doc-before",
                                            {},
                                            void 0,
                                            !0,
                                        ),
                                        v("main", ho, [
                                            m(
                                                y,
                                                {
                                                    class: N([
                                                        "vp-doc",
                                                        [
                                                            u.value,
                                                            i(e)
                                                                .externalLinkIcon &&
                                                                "external-link-icon-enabled",
                                                        ],
                                                    ]),
                                                },
                                                null,
                                                8,
                                                ["class"],
                                            ),
                                        ]),
                                        m(ao, null, {
                                            "doc-footer-before": d(() => [
                                                l(
                                                    h.$slots,
                                                    "doc-footer-before",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            _: 3,
                                        }),
                                        l(
                                            h.$slots,
                                            "doc-after",
                                            {},
                                            void 0,
                                            !0,
                                        ),
                                    ]),
                                ]),
                            ]),
                            l(h.$slots, "doc-bottom", {}, void 0, !0),
                        ],
                        2,
                    )
                );
            };
        },
    }),
    _o = b(fo, [["__scopeId", "data-v-39a288b8"]]),
    mo = _({
        __name: "VPButton",
        props: {
            tag: {},
            size: { default: "medium" },
            theme: { default: "brand" },
            text: {},
            href: {},
            target: {},
            rel: {},
        },
        setup(o) {
            const e = o,
                t = g(() => e.href && Ve.test(e.href)),
                s = g(() => (e.tag || e.href ? "a" : "button"));
            return (n, r) => (
                a(),
                $(
                    W(s.value),
                    {
                        class: N(["VPButton", [n.size, n.theme]]),
                        href: n.href ? i(fe)(n.href) : void 0,
                        target: e.target ?? (t.value ? "_blank" : void 0),
                        rel: e.rel ?? (t.value ? "noreferrer" : void 0),
                    },
                    { default: d(() => [F(w(n.text), 1)]), _: 1 },
                    8,
                    ["class", "href", "target", "rel"],
                )
            );
        },
    }),
    ko = b(mo, [["__scopeId", "data-v-cad61b99"]]),
    bo = ["src", "alt"],
    $o = _({
        inheritAttrs: !1,
        __name: "VPImage",
        props: { image: {}, alt: {} },
        setup(o) {
            return (e, t) => {
                const s = K("VPImage", !0);
                return e.image
                    ? (a(),
                      c(
                          M,
                          { key: 0 },
                          [
                              typeof e.image == "string" || "src" in e.image
                                  ? (a(),
                                    c(
                                        "img",
                                        X(
                                            { key: 0, class: "VPImage" },
                                            typeof e.image == "string"
                                                ? e.$attrs
                                                : { ...e.image, ...e.$attrs },
                                            {
                                                src: i(pe)(
                                                    typeof e.image == "string"
                                                        ? e.image
                                                        : e.image.src,
                                                ),
                                                alt:
                                                    e.alt ??
                                                    (typeof e.image == "string"
                                                        ? ""
                                                        : e.image.alt || ""),
                                            },
                                        ),
                                        null,
                                        16,
                                        bo,
                                    ))
                                  : (a(),
                                    c(
                                        M,
                                        { key: 1 },
                                        [
                                            m(
                                                s,
                                                X(
                                                    {
                                                        class: "dark",
                                                        image: e.image.dark,
                                                        alt: e.image.alt,
                                                    },
                                                    e.$attrs,
                                                ),
                                                null,
                                                16,
                                                ["image", "alt"],
                                            ),
                                            m(
                                                s,
                                                X(
                                                    {
                                                        class: "light",
                                                        image: e.image.light,
                                                        alt: e.image.alt,
                                                    },
                                                    e.$attrs,
                                                ),
                                                null,
                                                16,
                                                ["image", "alt"],
                                            ),
                                        ],
                                        64,
                                    )),
                          ],
                          64,
                      ))
                    : f("", !0);
            };
        },
    }),
    x = b($o, [["__scopeId", "data-v-8426fc1a"]]),
    go = (o) => (B("data-v-303bb580"), (o = o()), H(), o),
    yo = { class: "container" },
    Po = { class: "main" },
    Lo = { key: 0, class: "name" },
    Vo = ["innerHTML"],
    So = ["innerHTML"],
    To = ["innerHTML"],
    wo = { key: 0, class: "actions" },
    Io = { key: 0, class: "image" },
    No = { class: "image-container" },
    Mo = go(() => v("div", { class: "image-bg" }, null, -1)),
    Ao = _({
        __name: "VPHero",
        props: { name: {}, text: {}, tagline: {}, image: {}, actions: {} },
        setup(o) {
            const e = oe("hero-image-slot-exists");
            return (t, s) => (
                a(),
                c(
                    "div",
                    { class: N(["VPHero", { "has-image": t.image || i(e) }]) },
                    [
                        v("div", yo, [
                            v("div", Po, [
                                l(
                                    t.$slots,
                                    "home-hero-info-before",
                                    {},
                                    void 0,
                                    !0,
                                ),
                                l(
                                    t.$slots,
                                    "home-hero-info",
                                    {},
                                    () => [
                                        t.name
                                            ? (a(),
                                              c("h1", Lo, [
                                                  v(
                                                      "span",
                                                      {
                                                          innerHTML: t.name,
                                                          class: "clip",
                                                      },
                                                      null,
                                                      8,
                                                      Vo,
                                                  ),
                                              ]))
                                            : f("", !0),
                                        t.text
                                            ? (a(),
                                              c(
                                                  "p",
                                                  {
                                                      key: 1,
                                                      innerHTML: t.text,
                                                      class: "text",
                                                  },
                                                  null,
                                                  8,
                                                  So,
                                              ))
                                            : f("", !0),
                                        t.tagline
                                            ? (a(),
                                              c(
                                                  "p",
                                                  {
                                                      key: 2,
                                                      innerHTML: t.tagline,
                                                      class: "tagline",
                                                  },
                                                  null,
                                                  8,
                                                  To,
                                              ))
                                            : f("", !0),
                                    ],
                                    !0,
                                ),
                                l(
                                    t.$slots,
                                    "home-hero-info-after",
                                    {},
                                    void 0,
                                    !0,
                                ),
                                t.actions
                                    ? (a(),
                                      c("div", wo, [
                                          (a(!0),
                                          c(
                                              M,
                                              null,
                                              E(
                                                  t.actions,
                                                  (n) => (
                                                      a(),
                                                      c(
                                                          "div",
                                                          {
                                                              key: n.link,
                                                              class: "action",
                                                          },
                                                          [
                                                              m(
                                                                  ko,
                                                                  {
                                                                      tag: "a",
                                                                      size: "medium",
                                                                      theme: n.theme,
                                                                      text: n.text,
                                                                      href: n.link,
                                                                      target: n.target,
                                                                      rel: n.rel,
                                                                  },
                                                                  null,
                                                                  8,
                                                                  [
                                                                      "theme",
                                                                      "text",
                                                                      "href",
                                                                      "target",
                                                                      "rel",
                                                                  ],
                                                              ),
                                                          ],
                                                      )
                                                  ),
                                              ),
                                              128,
                                          )),
                                      ]))
                                    : f("", !0),
                                l(
                                    t.$slots,
                                    "home-hero-actions-after",
                                    {},
                                    void 0,
                                    !0,
                                ),
                            ]),
                            t.image || i(e)
                                ? (a(),
                                  c("div", Io, [
                                      v("div", No, [
                                          Mo,
                                          l(
                                              t.$slots,
                                              "home-hero-image",
                                              {},
                                              () => [
                                                  t.image
                                                      ? (a(),
                                                        $(
                                                            x,
                                                            {
                                                                key: 0,
                                                                class: "image-src",
                                                                image: t.image,
                                                            },
                                                            null,
                                                            8,
                                                            ["image"],
                                                        ))
                                                      : f("", !0),
                                              ],
                                              !0,
                                          ),
                                      ]),
                                  ]))
                                : f("", !0),
                        ]),
                    ],
                    2,
                )
            );
        },
    }),
    Co = b(Ao, [["__scopeId", "data-v-303bb580"]]),
    Bo = _({
        __name: "VPHomeHero",
        setup(o) {
            const { frontmatter: e } = L();
            return (t, s) =>
                i(e).hero
                    ? (a(),
                      $(
                          Co,
                          {
                              key: 0,
                              class: "VPHomeHero",
                              name: i(e).hero.name,
                              text: i(e).hero.text,
                              tagline: i(e).hero.tagline,
                              image: i(e).hero.image,
                              actions: i(e).hero.actions,
                          },
                          {
                              "home-hero-info-before": d(() => [
                                  l(t.$slots, "home-hero-info-before"),
                              ]),
                              "home-hero-info": d(() => [
                                  l(t.$slots, "home-hero-info"),
                              ]),
                              "home-hero-info-after": d(() => [
                                  l(t.$slots, "home-hero-info-after"),
                              ]),
                              "home-hero-actions-after": d(() => [
                                  l(t.$slots, "home-hero-actions-after"),
                              ]),
                              "home-hero-image": d(() => [
                                  l(t.$slots, "home-hero-image"),
                              ]),
                              _: 3,
                          },
                          8,
                          ["name", "text", "tagline", "image", "actions"],
                      ))
                    : f("", !0);
        },
    }),
    Ho = (o) => (B("data-v-a3976bdc"), (o = o()), H(), o),
    Eo = { class: "box" },
    Do = { key: 0, class: "icon" },
    Fo = ["innerHTML"],
    Oo = ["innerHTML"],
    Uo = ["innerHTML"],
    Go = { key: 4, class: "link-text" },
    jo = { class: "link-text-value" },
    zo = Ho(() =>
        v("span", { class: "vpi-arrow-right link-text-icon" }, null, -1),
    ),
    qo = _({
        __name: "VPFeature",
        props: {
            icon: {},
            title: {},
            details: {},
            link: {},
            linkText: {},
            rel: {},
            target: {},
        },
        setup(o) {
            return (e, t) => (
                a(),
                $(
                    D,
                    {
                        class: "VPFeature",
                        href: e.link,
                        rel: e.rel,
                        target: e.target,
                        "no-icon": !0,
                        tag: e.link ? "a" : "div",
                    },
                    {
                        default: d(() => [
                            v("article", Eo, [
                                typeof e.icon == "object" && e.icon.wrap
                                    ? (a(),
                                      c("div", Do, [
                                          m(
                                              x,
                                              {
                                                  image: e.icon,
                                                  alt: e.icon.alt,
                                                  height: e.icon.height || 48,
                                                  width: e.icon.width || 48,
                                              },
                                              null,
                                              8,
                                              [
                                                  "image",
                                                  "alt",
                                                  "height",
                                                  "width",
                                              ],
                                          ),
                                      ]))
                                    : typeof e.icon == "object"
                                      ? (a(),
                                        $(
                                            x,
                                            {
                                                key: 1,
                                                image: e.icon,
                                                alt: e.icon.alt,
                                                height: e.icon.height || 48,
                                                width: e.icon.width || 48,
                                            },
                                            null,
                                            8,
                                            ["image", "alt", "height", "width"],
                                        ))
                                      : e.icon
                                        ? (a(),
                                          c(
                                              "div",
                                              {
                                                  key: 2,
                                                  class: "icon",
                                                  innerHTML: e.icon,
                                              },
                                              null,
                                              8,
                                              Fo,
                                          ))
                                        : f("", !0),
                                v(
                                    "h2",
                                    { class: "title", innerHTML: e.title },
                                    null,
                                    8,
                                    Oo,
                                ),
                                e.details
                                    ? (a(),
                                      c(
                                          "p",
                                          {
                                              key: 3,
                                              class: "details",
                                              innerHTML: e.details,
                                          },
                                          null,
                                          8,
                                          Uo,
                                      ))
                                    : f("", !0),
                                e.linkText
                                    ? (a(),
                                      c("div", Go, [
                                          v("p", jo, [
                                              F(w(e.linkText) + " ", 1),
                                              zo,
                                          ]),
                                      ]))
                                    : f("", !0),
                            ]),
                        ]),
                        _: 1,
                    },
                    8,
                    ["href", "rel", "target", "tag"],
                )
            );
        },
    }),
    Ko = b(qo, [["__scopeId", "data-v-a3976bdc"]]),
    Ro = { key: 0, class: "VPFeatures" },
    Wo = { class: "container" },
    Jo = { class: "items" },
    Yo = _({
        __name: "VPFeatures",
        props: { features: {} },
        setup(o) {
            const e = o,
                t = g(() => {
                    const s = e.features.length;
                    if (s) {
                        if (s === 2) return "grid-2";
                        if (s === 3) return "grid-3";
                        if (s % 3 === 0) return "grid-6";
                        if (s > 3) return "grid-4";
                    } else return;
                });
            return (s, n) =>
                s.features
                    ? (a(),
                      c("div", Ro, [
                          v("div", Wo, [
                              v("div", Jo, [
                                  (a(!0),
                                  c(
                                      M,
                                      null,
                                      E(
                                          s.features,
                                          (r) => (
                                              a(),
                                              c(
                                                  "div",
                                                  {
                                                      key: r.title,
                                                      class: N([
                                                          "item",
                                                          [t.value],
                                                      ]),
                                                  },
                                                  [
                                                      m(
                                                          Ko,
                                                          {
                                                              icon: r.icon,
                                                              title: r.title,
                                                              details:
                                                                  r.details,
                                                              link: r.link,
                                                              "link-text":
                                                                  r.linkText,
                                                              rel: r.rel,
                                                              target: r.target,
                                                          },
                                                          null,
                                                          8,
                                                          [
                                                              "icon",
                                                              "title",
                                                              "details",
                                                              "link",
                                                              "link-text",
                                                              "rel",
                                                              "target",
                                                          ],
                                                      ),
                                                  ],
                                                  2,
                                              )
                                          ),
                                      ),
                                      128,
                                  )),
                              ]),
                          ]),
                      ]))
                    : f("", !0);
        },
    }),
    Qo = b(Yo, [["__scopeId", "data-v-a6181336"]]),
    Xo = _({
        __name: "VPHomeFeatures",
        setup(o) {
            const { frontmatter: e } = L();
            return (t, s) =>
                i(e).features
                    ? (a(),
                      $(
                          Qo,
                          {
                              key: 0,
                              class: "VPHomeFeatures",
                              features: i(e).features,
                          },
                          null,
                          8,
                          ["features"],
                      ))
                    : f("", !0);
        },
    }),
    Zo = _({
        __name: "VPHomeContent",
        setup(o) {
            const { width: e } = Ke({ includeScrollbar: !1 });
            return (t, s) => (
                a(),
                c(
                    "div",
                    {
                        class: "vp-doc container",
                        style: Se(
                            i(e)
                                ? { "--vp-offset": `calc(50% - ${i(e) / 2}px)` }
                                : {},
                        ),
                    },
                    [l(t.$slots, "default", {}, void 0, !0)],
                    4,
                )
            );
        },
    }),
    xo = b(Zo, [["__scopeId", "data-v-82d4af08"]]),
    es = { class: "VPHome" },
    ts = _({
        __name: "VPHome",
        setup(o) {
            const { frontmatter: e } = L();
            return (t, s) => {
                const n = K("Content");
                return (
                    a(),
                    c("div", es, [
                        l(t.$slots, "home-hero-before", {}, void 0, !0),
                        m(Bo, null, {
                            "home-hero-info-before": d(() => [
                                l(
                                    t.$slots,
                                    "home-hero-info-before",
                                    {},
                                    void 0,
                                    !0,
                                ),
                            ]),
                            "home-hero-info": d(() => [
                                l(t.$slots, "home-hero-info", {}, void 0, !0),
                            ]),
                            "home-hero-info-after": d(() => [
                                l(
                                    t.$slots,
                                    "home-hero-info-after",
                                    {},
                                    void 0,
                                    !0,
                                ),
                            ]),
                            "home-hero-actions-after": d(() => [
                                l(
                                    t.$slots,
                                    "home-hero-actions-after",
                                    {},
                                    void 0,
                                    !0,
                                ),
                            ]),
                            "home-hero-image": d(() => [
                                l(t.$slots, "home-hero-image", {}, void 0, !0),
                            ]),
                            _: 3,
                        }),
                        l(t.$slots, "home-hero-after", {}, void 0, !0),
                        l(t.$slots, "home-features-before", {}, void 0, !0),
                        m(Xo),
                        l(t.$slots, "home-features-after", {}, void 0, !0),
                        i(e).markdownStyles !== !1
                            ? (a(),
                              $(
                                  xo,
                                  { key: 0 },
                                  { default: d(() => [m(n)]), _: 1 },
                              ))
                            : (a(), $(n, { key: 1 })),
                    ])
                );
            };
        },
    }),
    os = b(ts, [["__scopeId", "data-v-686f80a6"]]),
    ss = {},
    ns = { class: "VPPage" };
function as(o, e) {
    const t = K("Content");
    return (
        a(),
        c("div", ns, [
            l(o.$slots, "page-top"),
            m(t),
            l(o.$slots, "page-bottom"),
        ])
    );
}
const rs = b(ss, [["render", as]]),
    is = _({
        __name: "VPContent",
        setup(o) {
            const { page: e, frontmatter: t } = L(),
                { hasSidebar: s } = O();
            return (n, r) => (
                a(),
                c(
                    "div",
                    {
                        class: N([
                            "VPContent",
                            {
                                "has-sidebar": i(s),
                                "is-home": i(t).layout === "home",
                            },
                        ]),
                        id: "VPContent",
                    },
                    [
                        i(e).isNotFound
                            ? l(
                                  n.$slots,
                                  "not-found",
                                  { key: 0 },
                                  () => [m(ft)],
                                  !0,
                              )
                            : i(t).layout === "page"
                              ? (a(),
                                $(
                                    rs,
                                    { key: 1 },
                                    {
                                        "page-top": d(() => [
                                            l(
                                                n.$slots,
                                                "page-top",
                                                {},
                                                void 0,
                                                !0,
                                            ),
                                        ]),
                                        "page-bottom": d(() => [
                                            l(
                                                n.$slots,
                                                "page-bottom",
                                                {},
                                                void 0,
                                                !0,
                                            ),
                                        ]),
                                        _: 3,
                                    },
                                ))
                              : i(t).layout === "home"
                                ? (a(),
                                  $(
                                      os,
                                      { key: 2 },
                                      {
                                          "home-hero-before": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-hero-before",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "home-hero-info-before": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-hero-info-before",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "home-hero-info": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-hero-info",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "home-hero-info-after": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-hero-info-after",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "home-hero-actions-after": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-hero-actions-after",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "home-hero-image": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-hero-image",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "home-hero-after": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-hero-after",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "home-features-before": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-features-before",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "home-features-after": d(() => [
                                              l(
                                                  n.$slots,
                                                  "home-features-after",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          _: 3,
                                      },
                                  ))
                                : i(t).layout && i(t).layout !== "doc"
                                  ? (a(), $(W(i(t).layout), { key: 3 }))
                                  : (a(),
                                    $(
                                        _o,
                                        { key: 4 },
                                        {
                                            "doc-top": d(() => [
                                                l(
                                                    n.$slots,
                                                    "doc-top",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "doc-bottom": d(() => [
                                                l(
                                                    n.$slots,
                                                    "doc-bottom",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "doc-footer-before": d(() => [
                                                l(
                                                    n.$slots,
                                                    "doc-footer-before",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "doc-before": d(() => [
                                                l(
                                                    n.$slots,
                                                    "doc-before",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "doc-after": d(() => [
                                                l(
                                                    n.$slots,
                                                    "doc-after",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "aside-top": d(() => [
                                                l(
                                                    n.$slots,
                                                    "aside-top",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "aside-outline-before": d(() => [
                                                l(
                                                    n.$slots,
                                                    "aside-outline-before",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "aside-outline-after": d(() => [
                                                l(
                                                    n.$slots,
                                                    "aside-outline-after",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "aside-ads-before": d(() => [
                                                l(
                                                    n.$slots,
                                                    "aside-ads-before",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "aside-ads-after": d(() => [
                                                l(
                                                    n.$slots,
                                                    "aside-ads-after",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "aside-bottom": d(() => [
                                                l(
                                                    n.$slots,
                                                    "aside-bottom",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            _: 3,
                                        },
                                    )),
                    ],
                    2,
                )
            );
        },
    }),
    ls = b(is, [["__scopeId", "data-v-1428d186"]]),
    cs = { class: "container" },
    us = ["innerHTML"],
    ds = ["innerHTML"],
    vs = _({
        __name: "VPFooter",
        setup(o) {
            const { theme: e, frontmatter: t } = L(),
                { hasSidebar: s } = O();
            return (n, r) =>
                i(e).footer && i(t).footer !== !1
                    ? (a(),
                      c(
                          "footer",
                          {
                              key: 0,
                              class: N(["VPFooter", { "has-sidebar": i(s) }]),
                          },
                          [
                              v("div", cs, [
                                  i(e).footer.message
                                      ? (a(),
                                        c(
                                            "p",
                                            {
                                                key: 0,
                                                class: "message",
                                                innerHTML: i(e).footer.message,
                                            },
                                            null,
                                            8,
                                            us,
                                        ))
                                      : f("", !0),
                                  i(e).footer.copyright
                                      ? (a(),
                                        c(
                                            "p",
                                            {
                                                key: 1,
                                                class: "copyright",
                                                innerHTML:
                                                    i(e).footer.copyright,
                                            },
                                            null,
                                            8,
                                            ds,
                                        ))
                                      : f("", !0),
                              ]),
                          ],
                          2,
                      ))
                    : f("", !0);
        },
    }),
    ps = b(vs, [["__scopeId", "data-v-e315a0ad"]]);
function hs() {
    const { theme: o, frontmatter: e } = L(),
        t = Le([]),
        s = g(() => t.value.length > 0);
    return (
        ee(() => {
            t.value = _e(e.value.outline ?? o.value.outline);
        }),
        { headers: t, hasLocalNav: s }
    );
}
const fs = (o) => (B("data-v-17a5e62e"), (o = o()), H(), o),
    _s = { class: "menu-text" },
    ms = fs(() => v("span", { class: "vpi-chevron-right icon" }, null, -1)),
    ks = { class: "header" },
    bs = { class: "outline" },
    $s = _({
        __name: "VPLocalNavOutlineDropdown",
        props: { headers: {}, navHeight: {} },
        setup(o) {
            const e = o,
                { theme: t } = L(),
                s = I(!1),
                n = I(0),
                r = I(),
                u = I();
            function h(k) {
                var V;
                ((V = r.value) != null && V.contains(k.target)) ||
                    (s.value = !1);
            }
            j(s, (k) => {
                if (k) {
                    document.addEventListener("click", h);
                    return;
                }
                document.removeEventListener("click", h);
            }),
                le("Escape", () => {
                    s.value = !1;
                }),
                ee(() => {
                    s.value = !1;
                });
            function p() {
                (s.value = !s.value),
                    (n.value =
                        window.innerHeight +
                        Math.min(window.scrollY - e.navHeight, 0));
            }
            function y(k) {
                k.target.classList.contains("outline-link") &&
                    (u.value && (u.value.style.transition = "none"),
                    Re(() => {
                        s.value = !1;
                    }));
            }
            function P() {
                (s.value = !1),
                    window.scrollTo({ top: 0, left: 0, behavior: "smooth" });
            }
            return (k, V) => (
                a(),
                c(
                    "div",
                    {
                        class: "VPLocalNavOutlineDropdown",
                        style: Se({ "--vp-vh": n.value + "px" }),
                        ref_key: "main",
                        ref: r,
                    },
                    [
                        k.headers.length > 0
                            ? (a(),
                              c(
                                  "button",
                                  {
                                      key: 0,
                                      onClick: p,
                                      class: N({ open: s.value }),
                                  },
                                  [v("span", _s, w(i(Me)(i(t))), 1), ms],
                                  2,
                              ))
                            : (a(),
                              c(
                                  "button",
                                  { key: 1, onClick: P },
                                  w(i(t).returnToTopLabel || "Return to top"),
                                  1,
                              )),
                        m(
                            ve,
                            { name: "flyout" },
                            {
                                default: d(() => [
                                    s.value
                                        ? (a(),
                                          c(
                                              "div",
                                              {
                                                  key: 0,
                                                  ref_key: "items",
                                                  ref: u,
                                                  class: "items",
                                                  onClick: y,
                                              },
                                              [
                                                  v("div", ks, [
                                                      v(
                                                          "a",
                                                          {
                                                              class: "top-link",
                                                              href: "#",
                                                              onClick: P,
                                                          },
                                                          w(
                                                              i(t)
                                                                  .returnToTopLabel ||
                                                                  "Return to top",
                                                          ),
                                                          1,
                                                      ),
                                                  ]),
                                                  v("div", bs, [
                                                      m(
                                                          Ae,
                                                          {
                                                              headers:
                                                                  k.headers,
                                                          },
                                                          null,
                                                          8,
                                                          ["headers"],
                                                      ),
                                                  ]),
                                              ],
                                              512,
                                          ))
                                        : f("", !0),
                                ]),
                                _: 1,
                            },
                        ),
                    ],
                    4,
                )
            );
        },
    }),
    gs = b($s, [["__scopeId", "data-v-17a5e62e"]]),
    ys = (o) => (B("data-v-a6f0e41e"), (o = o()), H(), o),
    Ps = { class: "container" },
    Ls = ["aria-expanded"],
    Vs = ys(() => v("span", { class: "vpi-align-left menu-icon" }, null, -1)),
    Ss = { class: "menu-text" },
    Ts = _({
        __name: "VPLocalNav",
        props: { open: { type: Boolean } },
        emits: ["open-menu"],
        setup(o) {
            const { theme: e, frontmatter: t } = L(),
                { hasSidebar: s } = O(),
                { headers: n } = hs(),
                { y: r } = Te(),
                u = I(0);
            q(() => {
                u.value = parseInt(
                    getComputedStyle(document.documentElement).getPropertyValue(
                        "--vp-nav-height",
                    ),
                );
            }),
                ee(() => {
                    n.value = _e(t.value.outline ?? e.value.outline);
                });
            const h = g(() => n.value.length === 0),
                p = g(() => h.value && !s.value),
                y = g(() => ({
                    VPLocalNav: !0,
                    "has-sidebar": s.value,
                    empty: h.value,
                    fixed: p.value,
                }));
            return (P, k) =>
                i(t).layout !== "home" && (!p.value || i(r) >= u.value)
                    ? (a(),
                      c(
                          "div",
                          { key: 0, class: N(y.value) },
                          [
                              v("div", Ps, [
                                  i(s)
                                      ? (a(),
                                        c(
                                            "button",
                                            {
                                                key: 0,
                                                class: "menu",
                                                "aria-expanded": P.open,
                                                "aria-controls": "VPSidebarNav",
                                                onClick:
                                                    k[0] ||
                                                    (k[0] = (V) =>
                                                        P.$emit("open-menu")),
                                            },
                                            [
                                                Vs,
                                                v(
                                                    "span",
                                                    Ss,
                                                    w(
                                                        i(e).sidebarMenuLabel ||
                                                            "Menu",
                                                    ),
                                                    1,
                                                ),
                                            ],
                                            8,
                                            Ls,
                                        ))
                                      : f("", !0),
                                  m(
                                      gs,
                                      { headers: i(n), navHeight: u.value },
                                      null,
                                      8,
                                      ["headers", "navHeight"],
                                  ),
                              ]),
                          ],
                          2,
                      ))
                    : f("", !0);
        },
    }),
    ws = b(Ts, [["__scopeId", "data-v-a6f0e41e"]]);
function Is() {
    const o = I(!1);
    function e() {
        (o.value = !0), window.addEventListener("resize", n);
    }
    function t() {
        (o.value = !1), window.removeEventListener("resize", n);
    }
    function s() {
        o.value ? t() : e();
    }
    function n() {
        window.outerWidth >= 768 && t();
    }
    const r = te();
    return (
        j(() => r.path, t),
        { isScreenOpen: o, openScreen: e, closeScreen: t, toggleScreen: s }
    );
}
const Ns = {},
    Ms = { class: "VPSwitch", type: "button", role: "switch" },
    As = { class: "check" },
    Cs = { key: 0, class: "icon" };
function Bs(o, e) {
    return (
        a(),
        c("button", Ms, [
            v("span", As, [
                o.$slots.default
                    ? (a(),
                      c("span", Cs, [l(o.$slots, "default", {}, void 0, !0)]))
                    : f("", !0),
            ]),
        ])
    );
}
const Hs = b(Ns, [
        ["render", Bs],
        ["__scopeId", "data-v-1d5665e3"],
    ]),
    Be = (o) => (B("data-v-d1f28634"), (o = o()), H(), o),
    Es = Be(() => v("span", { class: "vpi-sun sun" }, null, -1)),
    Ds = Be(() => v("span", { class: "vpi-moon moon" }, null, -1)),
    Fs = _({
        __name: "VPSwitchAppearance",
        setup(o) {
            const { isDark: e, theme: t } = L(),
                s = oe("toggle-appearance", () => {
                    e.value = !e.value;
                }),
                n = g(() =>
                    e.value
                        ? t.value.lightModeSwitchTitle ||
                          "Switch to light theme"
                        : t.value.darkModeSwitchTitle || "Switch to dark theme",
                );
            return (r, u) => (
                a(),
                $(
                    Hs,
                    {
                        title: n.value,
                        class: "VPSwitchAppearance",
                        "aria-checked": i(e),
                        onClick: i(s),
                    },
                    { default: d(() => [Es, Ds]), _: 1 },
                    8,
                    ["title", "aria-checked", "onClick"],
                )
            );
        },
    }),
    me = b(Fs, [["__scopeId", "data-v-d1f28634"]]),
    Os = { key: 0, class: "VPNavBarAppearance" },
    Us = _({
        __name: "VPNavBarAppearance",
        setup(o) {
            const { site: e } = L();
            return (t, s) =>
                i(e).appearance && i(e).appearance !== "force-dark"
                    ? (a(), c("div", Os, [m(me)]))
                    : f("", !0);
        },
    }),
    Gs = b(Us, [["__scopeId", "data-v-e6aabb21"]]),
    ke = I();
let He = !1,
    re = 0;
function js(o) {
    const e = I(!1);
    if (Y) {
        !He && zs(), re++;
        const t = j(ke, (s) => {
            var n, r, u;
            s === o.el.value || ((n = o.el.value) != null && n.contains(s))
                ? ((e.value = !0), (r = o.onFocus) == null || r.call(o))
                : ((e.value = !1), (u = o.onBlur) == null || u.call(o));
        });
        he(() => {
            t(), re--, re || qs();
        });
    }
    return We(e);
}
function zs() {
    document.addEventListener("focusin", Ee),
        (He = !0),
        (ke.value = document.activeElement);
}
function qs() {
    document.removeEventListener("focusin", Ee);
}
function Ee() {
    ke.value = document.activeElement;
}
const Ks = { class: "VPMenuLink" },
    Rs = _({
        __name: "VPMenuLink",
        props: { item: {} },
        setup(o) {
            const { page: e } = L();
            return (t, s) => (
                a(),
                c("div", Ks, [
                    m(
                        D,
                        {
                            class: N({
                                active: i(z)(
                                    i(e).relativePath,
                                    t.item.activeMatch || t.item.link,
                                    !!t.item.activeMatch,
                                ),
                            }),
                            href: t.item.link,
                            target: t.item.target,
                            rel: t.item.rel,
                        },
                        { default: d(() => [F(w(t.item.text), 1)]), _: 1 },
                        8,
                        ["class", "href", "target", "rel"],
                    ),
                ])
            );
        },
    }),
    se = b(Rs, [["__scopeId", "data-v-43f1e123"]]),
    Ws = { class: "VPMenuGroup" },
    Js = { key: 0, class: "title" },
    Ys = _({
        __name: "VPMenuGroup",
        props: { text: {}, items: {} },
        setup(o) {
            return (e, t) => (
                a(),
                c("div", Ws, [
                    e.text ? (a(), c("p", Js, w(e.text), 1)) : f("", !0),
                    (a(!0),
                    c(
                        M,
                        null,
                        E(
                            e.items,
                            (s) => (
                                a(),
                                c(
                                    M,
                                    null,
                                    [
                                        "link" in s
                                            ? (a(),
                                              $(
                                                  se,
                                                  { key: 0, item: s },
                                                  null,
                                                  8,
                                                  ["item"],
                                              ))
                                            : f("", !0),
                                    ],
                                    64,
                                )
                            ),
                        ),
                        256,
                    )),
                ])
            );
        },
    }),
    Qs = b(Ys, [["__scopeId", "data-v-69e747b5"]]),
    Xs = { class: "VPMenu" },
    Zs = { key: 0, class: "items" },
    xs = _({
        __name: "VPMenu",
        props: { items: {} },
        setup(o) {
            return (e, t) => (
                a(),
                c("div", Xs, [
                    e.items
                        ? (a(),
                          c("div", Zs, [
                              (a(!0),
                              c(
                                  M,
                                  null,
                                  E(
                                      e.items,
                                      (s) => (
                                          a(),
                                          c(
                                              M,
                                              { key: s.text },
                                              [
                                                  "link" in s
                                                      ? (a(),
                                                        $(
                                                            se,
                                                            { key: 0, item: s },
                                                            null,
                                                            8,
                                                            ["item"],
                                                        ))
                                                      : (a(),
                                                        $(
                                                            Qs,
                                                            {
                                                                key: 1,
                                                                text: s.text,
                                                                items: s.items,
                                                            },
                                                            null,
                                                            8,
                                                            ["text", "items"],
                                                        )),
                                              ],
                                              64,
                                          )
                                      ),
                                  ),
                                  128,
                              )),
                          ]))
                        : f("", !0),
                    l(e.$slots, "default", {}, void 0, !0),
                ])
            );
        },
    }),
    en = b(xs, [["__scopeId", "data-v-e7ea1737"]]),
    tn = (o) => (B("data-v-b6c34ac9"), (o = o()), H(), o),
    on = ["aria-expanded", "aria-label"],
    sn = { key: 0, class: "text" },
    nn = ["innerHTML"],
    an = tn(() => v("span", { class: "vpi-chevron-down text-icon" }, null, -1)),
    rn = { key: 1, class: "vpi-more-horizontal icon" },
    ln = { class: "menu" },
    cn = _({
        __name: "VPFlyout",
        props: { icon: {}, button: {}, label: {}, items: {} },
        setup(o) {
            const e = I(!1),
                t = I();
            js({ el: t, onBlur: s });
            function s() {
                e.value = !1;
            }
            return (n, r) => (
                a(),
                c(
                    "div",
                    {
                        class: "VPFlyout",
                        ref_key: "el",
                        ref: t,
                        onMouseenter: r[1] || (r[1] = (u) => (e.value = !0)),
                        onMouseleave: r[2] || (r[2] = (u) => (e.value = !1)),
                    },
                    [
                        v(
                            "button",
                            {
                                type: "button",
                                class: "button",
                                "aria-haspopup": "true",
                                "aria-expanded": e.value,
                                "aria-label": n.label,
                                onClick:
                                    r[0] ||
                                    (r[0] = (u) => (e.value = !e.value)),
                            },
                            [
                                n.button || n.icon
                                    ? (a(),
                                      c("span", sn, [
                                          n.icon
                                              ? (a(),
                                                c(
                                                    "span",
                                                    {
                                                        key: 0,
                                                        class: N([
                                                            n.icon,
                                                            "option-icon",
                                                        ]),
                                                    },
                                                    null,
                                                    2,
                                                ))
                                              : f("", !0),
                                          n.button
                                              ? (a(),
                                                c(
                                                    "span",
                                                    {
                                                        key: 1,
                                                        innerHTML: n.button,
                                                    },
                                                    null,
                                                    8,
                                                    nn,
                                                ))
                                              : f("", !0),
                                          an,
                                      ]))
                                    : (a(), c("span", rn)),
                            ],
                            8,
                            on,
                        ),
                        v("div", ln, [
                            m(
                                en,
                                { items: n.items },
                                {
                                    default: d(() => [
                                        l(n.$slots, "default", {}, void 0, !0),
                                    ]),
                                    _: 3,
                                },
                                8,
                                ["items"],
                            ),
                        ]),
                    ],
                    544,
                )
            );
        },
    }),
    be = b(cn, [["__scopeId", "data-v-b6c34ac9"]]),
    un = ["href", "aria-label", "innerHTML"],
    dn = _({
        __name: "VPSocialLink",
        props: { icon: {}, link: {}, ariaLabel: {} },
        setup(o) {
            const e = o,
                t = g(() =>
                    typeof e.icon == "object"
                        ? e.icon.svg
                        : `<span class="vpi-social-${e.icon}" />`,
                );
            return (s, n) => (
                a(),
                c(
                    "a",
                    {
                        class: "VPSocialLink no-icon",
                        href: s.link,
                        "aria-label":
                            s.ariaLabel ??
                            (typeof s.icon == "string" ? s.icon : ""),
                        target: "_blank",
                        rel: "noopener",
                        innerHTML: t.value,
                    },
                    null,
                    8,
                    un,
                )
            );
        },
    }),
    vn = b(dn, [["__scopeId", "data-v-eee4e7cb"]]),
    pn = { class: "VPSocialLinks" },
    hn = _({
        __name: "VPSocialLinks",
        props: { links: {} },
        setup(o) {
            return (e, t) => (
                a(),
                c("div", pn, [
                    (a(!0),
                    c(
                        M,
                        null,
                        E(
                            e.links,
                            ({ link: s, icon: n, ariaLabel: r }) => (
                                a(),
                                $(
                                    vn,
                                    { key: s, icon: n, link: s, ariaLabel: r },
                                    null,
                                    8,
                                    ["icon", "link", "ariaLabel"],
                                )
                            ),
                        ),
                        128,
                    )),
                ])
            );
        },
    }),
    $e = b(hn, [["__scopeId", "data-v-7bc22406"]]),
    fn = { key: 0, class: "group translations" },
    _n = { class: "trans-title" },
    mn = { key: 1, class: "group" },
    kn = { class: "item appearance" },
    bn = { class: "label" },
    $n = { class: "appearance-action" },
    gn = { key: 2, class: "group" },
    yn = { class: "item social-links" },
    Pn = _({
        __name: "VPNavBarExtra",
        setup(o) {
            const { site: e, theme: t } = L(),
                { localeLinks: s, currentLang: n } = Q({
                    correspondingLink: !0,
                }),
                r = g(
                    () =>
                        (s.value.length && n.value.label) ||
                        e.value.appearance ||
                        t.value.socialLinks,
                );
            return (u, h) =>
                r.value
                    ? (a(),
                      $(
                          be,
                          {
                              key: 0,
                              class: "VPNavBarExtra",
                              label: "extra navigation",
                          },
                          {
                              default: d(() => [
                                  i(s).length && i(n).label
                                      ? (a(),
                                        c("div", fn, [
                                            v("p", _n, w(i(n).label), 1),
                                            (a(!0),
                                            c(
                                                M,
                                                null,
                                                E(
                                                    i(s),
                                                    (p) => (
                                                        a(),
                                                        $(
                                                            se,
                                                            {
                                                                key: p.link,
                                                                item: p,
                                                            },
                                                            null,
                                                            8,
                                                            ["item"],
                                                        )
                                                    ),
                                                ),
                                                128,
                                            )),
                                        ]))
                                      : f("", !0),
                                  i(e).appearance &&
                                  i(e).appearance !== "force-dark"
                                      ? (a(),
                                        c("div", mn, [
                                            v("div", kn, [
                                                v(
                                                    "p",
                                                    bn,
                                                    w(
                                                        i(t)
                                                            .darkModeSwitchLabel ||
                                                            "Appearance",
                                                    ),
                                                    1,
                                                ),
                                                v("div", $n, [m(me)]),
                                            ]),
                                        ]))
                                      : f("", !0),
                                  i(t).socialLinks
                                      ? (a(),
                                        c("div", gn, [
                                            v("div", yn, [
                                                m(
                                                    $e,
                                                    {
                                                        class: "social-links-list",
                                                        links: i(t).socialLinks,
                                                    },
                                                    null,
                                                    8,
                                                    ["links"],
                                                ),
                                            ]),
                                        ]))
                                      : f("", !0),
                              ]),
                              _: 1,
                          },
                      ))
                    : f("", !0);
        },
    }),
    Ln = b(Pn, [["__scopeId", "data-v-d0bd9dde"]]),
    Vn = (o) => (B("data-v-e5dd9c1c"), (o = o()), H(), o),
    Sn = ["aria-expanded"],
    Tn = Vn(() =>
        v(
            "span",
            { class: "container" },
            [
                v("span", { class: "top" }),
                v("span", { class: "middle" }),
                v("span", { class: "bottom" }),
            ],
            -1,
        ),
    ),
    wn = [Tn],
    In = _({
        __name: "VPNavBarHamburger",
        props: { active: { type: Boolean } },
        emits: ["click"],
        setup(o) {
            return (e, t) => (
                a(),
                c(
                    "button",
                    {
                        type: "button",
                        class: N(["VPNavBarHamburger", { active: e.active }]),
                        "aria-label": "mobile navigation",
                        "aria-expanded": e.active,
                        "aria-controls": "VPNavScreen",
                        onClick: t[0] || (t[0] = (s) => e.$emit("click")),
                    },
                    wn,
                    10,
                    Sn,
                )
            );
        },
    }),
    Nn = b(In, [["__scopeId", "data-v-e5dd9c1c"]]),
    Mn = ["innerHTML"],
    An = _({
        __name: "VPNavBarMenuLink",
        props: { item: {} },
        setup(o) {
            const { page: e } = L();
            return (t, s) => (
                a(),
                $(
                    D,
                    {
                        class: N({
                            VPNavBarMenuLink: !0,
                            active: i(z)(
                                i(e).relativePath,
                                t.item.activeMatch || t.item.link,
                                !!t.item.activeMatch,
                            ),
                        }),
                        href: t.item.link,
                        noIcon: t.item.noIcon,
                        target: t.item.target,
                        rel: t.item.rel,
                        tabindex: "0",
                    },
                    {
                        default: d(() => [
                            v("span", { innerHTML: t.item.text }, null, 8, Mn),
                        ]),
                        _: 1,
                    },
                    8,
                    ["class", "href", "noIcon", "target", "rel"],
                )
            );
        },
    }),
    Cn = b(An, [["__scopeId", "data-v-9c663999"]]),
    Bn = _({
        __name: "VPNavBarMenuGroup",
        props: { item: {} },
        setup(o) {
            const e = o,
                { page: t } = L(),
                s = (r) =>
                    "link" in r
                        ? z(t.value.relativePath, r.link, !!e.item.activeMatch)
                        : r.items.some(s),
                n = g(() => s(e.item));
            return (r, u) => (
                a(),
                $(
                    be,
                    {
                        class: N({
                            VPNavBarMenuGroup: !0,
                            active:
                                i(z)(
                                    i(t).relativePath,
                                    r.item.activeMatch,
                                    !!r.item.activeMatch,
                                ) || n.value,
                        }),
                        button: r.item.text,
                        items: r.item.items,
                    },
                    null,
                    8,
                    ["class", "button", "items"],
                )
            );
        },
    }),
    Hn = (o) => (B("data-v-7f418b0f"), (o = o()), H(), o),
    En = {
        key: 0,
        "aria-labelledby": "main-nav-aria-label",
        class: "VPNavBarMenu",
    },
    Dn = Hn(() =>
        v(
            "span",
            { id: "main-nav-aria-label", class: "visually-hidden" },
            "Main Navigation",
            -1,
        ),
    ),
    Fn = _({
        __name: "VPNavBarMenu",
        setup(o) {
            const { theme: e } = L();
            return (t, s) =>
                i(e).nav
                    ? (a(),
                      c("nav", En, [
                          Dn,
                          (a(!0),
                          c(
                              M,
                              null,
                              E(
                                  i(e).nav,
                                  (n) => (
                                      a(),
                                      c(
                                          M,
                                          { key: n.text },
                                          [
                                              "link" in n
                                                  ? (a(),
                                                    $(
                                                        Cn,
                                                        { key: 0, item: n },
                                                        null,
                                                        8,
                                                        ["item"],
                                                    ))
                                                  : (a(),
                                                    $(
                                                        Bn,
                                                        { key: 1, item: n },
                                                        null,
                                                        8,
                                                        ["item"],
                                                    )),
                                          ],
                                          64,
                                      )
                                  ),
                              ),
                              128,
                          )),
                      ]))
                    : f("", !0);
        },
    }),
    On = b(Fn, [["__scopeId", "data-v-7f418b0f"]]);
function Un(o) {
    const { localeIndex: e, theme: t } = L();
    function s(n) {
        var A, C, S;
        const r = n.split("."),
            u = (A = t.value.search) == null ? void 0 : A.options,
            h = u && typeof u == "object",
            p =
                (h &&
                    ((S = (C = u.locales) == null ? void 0 : C[e.value]) == null
                        ? void 0
                        : S.translations)) ||
                null,
            y = (h && u.translations) || null;
        let P = p,
            k = y,
            V = o;
        const T = r.pop();
        for (const U of r) {
            let G = null;
            const R = V == null ? void 0 : V[U];
            R && (G = V = R);
            const ne = k == null ? void 0 : k[U];
            ne && (G = k = ne);
            const ae = P == null ? void 0 : P[U];
            ae && (G = P = ae), R || (V = G), ne || (k = G), ae || (P = G);
        }
        return (
            (P == null ? void 0 : P[T]) ??
            (k == null ? void 0 : k[T]) ??
            (V == null ? void 0 : V[T]) ??
            ""
        );
    }
    return s;
}
const Gn = ["aria-label"],
    jn = { class: "DocSearch-Button-Container" },
    zn = v("span", { class: "vp-icon DocSearch-Search-Icon" }, null, -1),
    qn = { class: "DocSearch-Button-Placeholder" },
    Kn = v(
        "span",
        { class: "DocSearch-Button-Keys" },
        [
            v("kbd", { class: "DocSearch-Button-Key" }),
            v("kbd", { class: "DocSearch-Button-Key" }, "K"),
        ],
        -1,
    ),
    ge = _({
        __name: "VPNavBarSearchButton",
        setup(o) {
            const t = Un({
                button: { buttonText: "Search", buttonAriaLabel: "Search" },
            });
            return (s, n) => (
                a(),
                c(
                    "button",
                    {
                        type: "button",
                        class: "DocSearch DocSearch-Button",
                        "aria-label": i(t)("button.buttonAriaLabel"),
                    },
                    [
                        v("span", jn, [
                            zn,
                            v("span", qn, w(i(t)("button.buttonText")), 1),
                        ]),
                        Kn,
                    ],
                    8,
                    Gn,
                )
            );
        },
    }),
    Rn = { class: "VPNavBarSearch" },
    Wn = { id: "local-search" },
    Jn = { key: 1, id: "docsearch" },
    Yn = _({
        __name: "VPNavBarSearch",
        setup(o) {
            const e = Je(() =>
                    Ye(
                        () => import("./VPLocalSearchBox.CBNRattA.js"),
                        __vite__mapDeps([0, 1]),
                    ),
                ),
                t = () => null,
                { theme: s } = L(),
                n = I(!1),
                r = I(!1);
            q(() => {});
            function u() {
                n.value || ((n.value = !0), setTimeout(h, 16));
            }
            function h() {
                const k = new Event("keydown");
                (k.key = "k"),
                    (k.metaKey = !0),
                    window.dispatchEvent(k),
                    setTimeout(() => {
                        document.querySelector(".DocSearch-Modal") || h();
                    }, 16);
            }
            function p(k) {
                const V = k.target,
                    T = V.tagName;
                return (
                    V.isContentEditable ||
                    T === "INPUT" ||
                    T === "SELECT" ||
                    T === "TEXTAREA"
                );
            }
            const y = I(!1);
            le("k", (k) => {
                (k.ctrlKey || k.metaKey) &&
                    (k.preventDefault(), (y.value = !0));
            }),
                le("/", (k) => {
                    p(k) || (k.preventDefault(), (y.value = !0));
                });
            const P = "local";
            return (k, V) => {
                var T;
                return (
                    a(),
                    c("div", Rn, [
                        i(P) === "local"
                            ? (a(),
                              c(
                                  M,
                                  { key: 0 },
                                  [
                                      y.value
                                          ? (a(),
                                            $(i(e), {
                                                key: 0,
                                                onClose:
                                                    V[0] ||
                                                    (V[0] = (A) =>
                                                        (y.value = !1)),
                                            }))
                                          : f("", !0),
                                      v("div", Wn, [
                                          m(ge, {
                                              onClick:
                                                  V[1] ||
                                                  (V[1] = (A) =>
                                                      (y.value = !0)),
                                          }),
                                      ]),
                                  ],
                                  64,
                              ))
                            : i(P) === "algolia"
                              ? (a(),
                                c(
                                    M,
                                    { key: 1 },
                                    [
                                        n.value
                                            ? (a(),
                                              $(
                                                  i(t),
                                                  {
                                                      key: 0,
                                                      algolia:
                                                          ((T = i(s).search) ==
                                                          null
                                                              ? void 0
                                                              : T.options) ??
                                                          i(s).algolia,
                                                      onVnodeBeforeMount:
                                                          V[2] ||
                                                          (V[2] = (A) =>
                                                              (r.value = !0)),
                                                  },
                                                  null,
                                                  8,
                                                  ["algolia"],
                                              ))
                                            : f("", !0),
                                        r.value
                                            ? f("", !0)
                                            : (a(),
                                              c("div", Jn, [
                                                  m(ge, { onClick: u }),
                                              ])),
                                    ],
                                    64,
                                ))
                              : f("", !0),
                    ])
                );
            };
        },
    }),
    Qn = _({
        __name: "VPNavBarSocialLinks",
        setup(o) {
            const { theme: e } = L();
            return (t, s) =>
                i(e).socialLinks
                    ? (a(),
                      $(
                          $e,
                          {
                              key: 0,
                              class: "VPNavBarSocialLinks",
                              links: i(e).socialLinks,
                          },
                          null,
                          8,
                          ["links"],
                      ))
                    : f("", !0);
        },
    }),
    Xn = b(Qn, [["__scopeId", "data-v-0394ad82"]]),
    Zn = ["href", "rel", "target"],
    xn = { key: 1 },
    ea = { key: 2 },
    ta = _({
        __name: "VPNavBarTitle",
        setup(o) {
            const { site: e, theme: t } = L(),
                { hasSidebar: s } = O(),
                { currentLang: n } = Q(),
                r = g(() => {
                    var p;
                    return typeof t.value.logoLink == "string"
                        ? t.value.logoLink
                        : (p = t.value.logoLink) == null
                          ? void 0
                          : p.link;
                }),
                u = g(() => {
                    var p;
                    return typeof t.value.logoLink == "string" ||
                        (p = t.value.logoLink) == null
                        ? void 0
                        : p.rel;
                }),
                h = g(() => {
                    var p;
                    return typeof t.value.logoLink == "string" ||
                        (p = t.value.logoLink) == null
                        ? void 0
                        : p.target;
                });
            return (p, y) => (
                a(),
                c(
                    "div",
                    { class: N(["VPNavBarTitle", { "has-sidebar": i(s) }]) },
                    [
                        v(
                            "a",
                            {
                                class: "title",
                                href: r.value ?? i(fe)(i(n).link),
                                rel: u.value,
                                target: h.value,
                            },
                            [
                                l(
                                    p.$slots,
                                    "nav-bar-title-before",
                                    {},
                                    void 0,
                                    !0,
                                ),
                                i(t).logo
                                    ? (a(),
                                      $(
                                          x,
                                          {
                                              key: 0,
                                              class: "logo",
                                              image: i(t).logo,
                                          },
                                          null,
                                          8,
                                          ["image"],
                                      ))
                                    : f("", !0),
                                i(t).siteTitle
                                    ? (a(), c("span", xn, w(i(t).siteTitle), 1))
                                    : i(t).siteTitle === void 0
                                      ? (a(), c("span", ea, w(i(e).title), 1))
                                      : f("", !0),
                                l(
                                    p.$slots,
                                    "nav-bar-title-after",
                                    {},
                                    void 0,
                                    !0,
                                ),
                            ],
                            8,
                            Zn,
                        ),
                    ],
                    2,
                )
            );
        },
    }),
    oa = b(ta, [["__scopeId", "data-v-ab179fa1"]]),
    sa = { class: "items" },
    na = { class: "title" },
    aa = _({
        __name: "VPNavBarTranslations",
        setup(o) {
            const { theme: e } = L(),
                { localeLinks: t, currentLang: s } = Q({
                    correspondingLink: !0,
                });
            return (n, r) =>
                i(t).length && i(s).label
                    ? (a(),
                      $(
                          be,
                          {
                              key: 0,
                              class: "VPNavBarTranslations",
                              icon: "vpi-languages",
                              label: i(e).langMenuLabel || "Change language",
                          },
                          {
                              default: d(() => [
                                  v("div", sa, [
                                      v("p", na, w(i(s).label), 1),
                                      (a(!0),
                                      c(
                                          M,
                                          null,
                                          E(
                                              i(t),
                                              (u) => (
                                                  a(),
                                                  $(
                                                      se,
                                                      { key: u.link, item: u },
                                                      null,
                                                      8,
                                                      ["item"],
                                                  )
                                              ),
                                          ),
                                          128,
                                      )),
                                  ]),
                              ]),
                              _: 1,
                          },
                          8,
                          ["label"],
                      ))
                    : f("", !0);
        },
    }),
    ra = b(aa, [["__scopeId", "data-v-88af2de4"]]),
    ia = (o) => (B("data-v-ccf7ddec"), (o = o()), H(), o),
    la = { class: "wrapper" },
    ca = { class: "container" },
    ua = { class: "title" },
    da = { class: "content" },
    va = { class: "content-body" },
    pa = ia(() =>
        v(
            "div",
            { class: "divider" },
            [v("div", { class: "divider-line" })],
            -1,
        ),
    ),
    ha = _({
        __name: "VPNavBar",
        props: { isScreenOpen: { type: Boolean } },
        emits: ["toggle-screen"],
        setup(o) {
            const { y: e } = Te(),
                { hasSidebar: t } = O(),
                { frontmatter: s } = L(),
                n = I({});
            return (
                Pe(() => {
                    n.value = {
                        "has-sidebar": t.value,
                        home: s.value.layout === "home",
                        top: e.value === 0,
                    };
                }),
                (r, u) => (
                    a(),
                    c(
                        "div",
                        { class: N(["VPNavBar", n.value]) },
                        [
                            v("div", la, [
                                v("div", ca, [
                                    v("div", ua, [
                                        m(oa, null, {
                                            "nav-bar-title-before": d(() => [
                                                l(
                                                    r.$slots,
                                                    "nav-bar-title-before",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            "nav-bar-title-after": d(() => [
                                                l(
                                                    r.$slots,
                                                    "nav-bar-title-after",
                                                    {},
                                                    void 0,
                                                    !0,
                                                ),
                                            ]),
                                            _: 3,
                                        }),
                                    ]),
                                    v("div", da, [
                                        v("div", va, [
                                            l(
                                                r.$slots,
                                                "nav-bar-content-before",
                                                {},
                                                void 0,
                                                !0,
                                            ),
                                            m(Yn, { class: "search" }),
                                            m(On, { class: "menu" }),
                                            m(ra, { class: "translations" }),
                                            m(Gs, { class: "appearance" }),
                                            m(Xn, { class: "social-links" }),
                                            m(Ln, { class: "extra" }),
                                            l(
                                                r.$slots,
                                                "nav-bar-content-after",
                                                {},
                                                void 0,
                                                !0,
                                            ),
                                            m(
                                                Nn,
                                                {
                                                    class: "hamburger",
                                                    active: r.isScreenOpen,
                                                    onClick:
                                                        u[0] ||
                                                        (u[0] = (h) =>
                                                            r.$emit(
                                                                "toggle-screen",
                                                            )),
                                                },
                                                null,
                                                8,
                                                ["active"],
                                            ),
                                        ]),
                                    ]),
                                ]),
                            ]),
                            pa,
                        ],
                        2,
                    )
                )
            );
        },
    }),
    fa = b(ha, [["__scopeId", "data-v-ccf7ddec"]]),
    _a = { key: 0, class: "VPNavScreenAppearance" },
    ma = { class: "text" },
    ka = _({
        __name: "VPNavScreenAppearance",
        setup(o) {
            const { site: e, theme: t } = L();
            return (s, n) =>
                i(e).appearance && i(e).appearance !== "force-dark"
                    ? (a(),
                      c("div", _a, [
                          v(
                              "p",
                              ma,
                              w(i(t).darkModeSwitchLabel || "Appearance"),
                              1,
                          ),
                          m(me),
                      ]))
                    : f("", !0);
        },
    }),
    ba = b(ka, [["__scopeId", "data-v-2d7af913"]]),
    $a = _({
        __name: "VPNavScreenMenuLink",
        props: { item: {} },
        setup(o) {
            const e = oe("close-screen");
            return (t, s) => (
                a(),
                $(
                    D,
                    {
                        class: "VPNavScreenMenuLink",
                        href: t.item.link,
                        target: t.item.target,
                        rel: t.item.rel,
                        onClick: i(e),
                        innerHTML: t.item.text,
                    },
                    null,
                    8,
                    ["href", "target", "rel", "onClick", "innerHTML"],
                )
            );
        },
    }),
    ga = b($a, [["__scopeId", "data-v-7f31e1f6"]]),
    ya = _({
        __name: "VPNavScreenMenuGroupLink",
        props: { item: {} },
        setup(o) {
            const e = oe("close-screen");
            return (t, s) => (
                a(),
                $(
                    D,
                    {
                        class: "VPNavScreenMenuGroupLink",
                        href: t.item.link,
                        target: t.item.target,
                        rel: t.item.rel,
                        onClick: i(e),
                    },
                    { default: d(() => [F(w(t.item.text), 1)]), _: 1 },
                    8,
                    ["href", "target", "rel", "onClick"],
                )
            );
        },
    }),
    De = b(ya, [["__scopeId", "data-v-19976ae1"]]),
    Pa = { class: "VPNavScreenMenuGroupSection" },
    La = { key: 0, class: "title" },
    Va = _({
        __name: "VPNavScreenMenuGroupSection",
        props: { text: {}, items: {} },
        setup(o) {
            return (e, t) => (
                a(),
                c("div", Pa, [
                    e.text ? (a(), c("p", La, w(e.text), 1)) : f("", !0),
                    (a(!0),
                    c(
                        M,
                        null,
                        E(
                            e.items,
                            (s) => (
                                a(),
                                $(De, { key: s.text, item: s }, null, 8, [
                                    "item",
                                ])
                            ),
                        ),
                        128,
                    )),
                ])
            );
        },
    }),
    Sa = b(Va, [["__scopeId", "data-v-8133b170"]]),
    Ta = (o) => (B("data-v-ff6087d4"), (o = o()), H(), o),
    wa = ["aria-controls", "aria-expanded"],
    Ia = ["innerHTML"],
    Na = Ta(() => v("span", { class: "vpi-plus button-icon" }, null, -1)),
    Ma = ["id"],
    Aa = { key: 1, class: "group" },
    Ca = _({
        __name: "VPNavScreenMenuGroup",
        props: { text: {}, items: {} },
        setup(o) {
            const e = o,
                t = I(!1),
                s = g(
                    () =>
                        `NavScreenGroup-${e.text.replace(" ", "-").toLowerCase()}`,
                );
            function n() {
                t.value = !t.value;
            }
            return (r, u) => (
                a(),
                c(
                    "div",
                    { class: N(["VPNavScreenMenuGroup", { open: t.value }]) },
                    [
                        v(
                            "button",
                            {
                                class: "button",
                                "aria-controls": s.value,
                                "aria-expanded": t.value,
                                onClick: n,
                            },
                            [
                                v(
                                    "span",
                                    { class: "button-text", innerHTML: r.text },
                                    null,
                                    8,
                                    Ia,
                                ),
                                Na,
                            ],
                            8,
                            wa,
                        ),
                        v(
                            "div",
                            { id: s.value, class: "items" },
                            [
                                (a(!0),
                                c(
                                    M,
                                    null,
                                    E(
                                        r.items,
                                        (h) => (
                                            a(),
                                            c(
                                                M,
                                                { key: h.text },
                                                [
                                                    "link" in h
                                                        ? (a(),
                                                          c(
                                                              "div",
                                                              {
                                                                  key: h.text,
                                                                  class: "item",
                                                              },
                                                              [
                                                                  m(
                                                                      De,
                                                                      {
                                                                          item: h,
                                                                      },
                                                                      null,
                                                                      8,
                                                                      ["item"],
                                                                  ),
                                                              ],
                                                          ))
                                                        : (a(),
                                                          c("div", Aa, [
                                                              m(
                                                                  Sa,
                                                                  {
                                                                      text: h.text,
                                                                      items: h.items,
                                                                  },
                                                                  null,
                                                                  8,
                                                                  [
                                                                      "text",
                                                                      "items",
                                                                  ],
                                                              ),
                                                          ])),
                                                ],
                                                64,
                                            )
                                        ),
                                    ),
                                    128,
                                )),
                            ],
                            8,
                            Ma,
                        ),
                    ],
                    2,
                )
            );
        },
    }),
    Ba = b(Ca, [["__scopeId", "data-v-ff6087d4"]]),
    Ha = { key: 0, class: "VPNavScreenMenu" },
    Ea = _({
        __name: "VPNavScreenMenu",
        setup(o) {
            const { theme: e } = L();
            return (t, s) =>
                i(e).nav
                    ? (a(),
                      c("nav", Ha, [
                          (a(!0),
                          c(
                              M,
                              null,
                              E(
                                  i(e).nav,
                                  (n) => (
                                      a(),
                                      c(
                                          M,
                                          { key: n.text },
                                          [
                                              "link" in n
                                                  ? (a(),
                                                    $(
                                                        ga,
                                                        { key: 0, item: n },
                                                        null,
                                                        8,
                                                        ["item"],
                                                    ))
                                                  : (a(),
                                                    $(
                                                        Ba,
                                                        {
                                                            key: 1,
                                                            text: n.text || "",
                                                            items: n.items,
                                                        },
                                                        null,
                                                        8,
                                                        ["text", "items"],
                                                    )),
                                          ],
                                          64,
                                      )
                                  ),
                              ),
                              128,
                          )),
                      ]))
                    : f("", !0);
        },
    }),
    Da = _({
        __name: "VPNavScreenSocialLinks",
        setup(o) {
            const { theme: e } = L();
            return (t, s) =>
                i(e).socialLinks
                    ? (a(),
                      $(
                          $e,
                          {
                              key: 0,
                              class: "VPNavScreenSocialLinks",
                              links: i(e).socialLinks,
                          },
                          null,
                          8,
                          ["links"],
                      ))
                    : f("", !0);
        },
    }),
    Fe = (o) => (B("data-v-858fe1a4"), (o = o()), H(), o),
    Fa = Fe(() => v("span", { class: "vpi-languages icon lang" }, null, -1)),
    Oa = Fe(() =>
        v("span", { class: "vpi-chevron-down icon chevron" }, null, -1),
    ),
    Ua = { class: "list" },
    Ga = _({
        __name: "VPNavScreenTranslations",
        setup(o) {
            const { localeLinks: e, currentLang: t } = Q({
                    correspondingLink: !0,
                }),
                s = I(!1);
            function n() {
                s.value = !s.value;
            }
            return (r, u) =>
                i(e).length && i(t).label
                    ? (a(),
                      c(
                          "div",
                          {
                              key: 0,
                              class: N([
                                  "VPNavScreenTranslations",
                                  { open: s.value },
                              ]),
                          },
                          [
                              v("button", { class: "title", onClick: n }, [
                                  Fa,
                                  F(" " + w(i(t).label) + " ", 1),
                                  Oa,
                              ]),
                              v("ul", Ua, [
                                  (a(!0),
                                  c(
                                      M,
                                      null,
                                      E(
                                          i(e),
                                          (h) => (
                                              a(),
                                              c(
                                                  "li",
                                                  {
                                                      key: h.link,
                                                      class: "item",
                                                  },
                                                  [
                                                      m(
                                                          D,
                                                          {
                                                              class: "link",
                                                              href: h.link,
                                                          },
                                                          {
                                                              default: d(() => [
                                                                  F(
                                                                      w(h.text),
                                                                      1,
                                                                  ),
                                                              ]),
                                                              _: 2,
                                                          },
                                                          1032,
                                                          ["href"],
                                                      ),
                                                  ],
                                              )
                                          ),
                                      ),
                                      128,
                                  )),
                              ]),
                          ],
                          2,
                      ))
                    : f("", !0);
        },
    }),
    ja = b(Ga, [["__scopeId", "data-v-858fe1a4"]]),
    za = { class: "container" },
    qa = _({
        __name: "VPNavScreen",
        props: { open: { type: Boolean } },
        setup(o) {
            const e = I(null),
                t = we(Y ? document.body : null);
            return (s, n) => (
                a(),
                $(
                    ve,
                    {
                        name: "fade",
                        onEnter: n[0] || (n[0] = (r) => (t.value = !0)),
                        onAfterLeave: n[1] || (n[1] = (r) => (t.value = !1)),
                    },
                    {
                        default: d(() => [
                            s.open
                                ? (a(),
                                  c(
                                      "div",
                                      {
                                          key: 0,
                                          class: "VPNavScreen",
                                          ref_key: "screen",
                                          ref: e,
                                          id: "VPNavScreen",
                                      },
                                      [
                                          v("div", za, [
                                              l(
                                                  s.$slots,
                                                  "nav-screen-content-before",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                              m(Ea, { class: "menu" }),
                                              m(ja, { class: "translations" }),
                                              m(ba, { class: "appearance" }),
                                              m(Da, { class: "social-links" }),
                                              l(
                                                  s.$slots,
                                                  "nav-screen-content-after",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                      ],
                                      512,
                                  ))
                                : f("", !0),
                        ]),
                        _: 3,
                    },
                )
            );
        },
    }),
    Ka = b(qa, [["__scopeId", "data-v-cc5739dd"]]),
    Ra = { key: 0, class: "VPNav" },
    Wa = _({
        __name: "VPNav",
        setup(o) {
            const { isScreenOpen: e, closeScreen: t, toggleScreen: s } = Is(),
                { frontmatter: n } = L(),
                r = g(() => n.value.navbar !== !1);
            return (
                Ie("close-screen", t),
                J(() => {
                    Y &&
                        document.documentElement.classList.toggle(
                            "hide-nav",
                            !r.value,
                        );
                }),
                (u, h) =>
                    r.value
                        ? (a(),
                          c("header", Ra, [
                              m(
                                  fa,
                                  {
                                      "is-screen-open": i(e),
                                      onToggleScreen: i(s),
                                  },
                                  {
                                      "nav-bar-title-before": d(() => [
                                          l(
                                              u.$slots,
                                              "nav-bar-title-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-bar-title-after": d(() => [
                                          l(
                                              u.$slots,
                                              "nav-bar-title-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-bar-content-before": d(() => [
                                          l(
                                              u.$slots,
                                              "nav-bar-content-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-bar-content-after": d(() => [
                                          l(
                                              u.$slots,
                                              "nav-bar-content-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      _: 3,
                                  },
                                  8,
                                  ["is-screen-open", "onToggleScreen"],
                              ),
                              m(
                                  Ka,
                                  { open: i(e) },
                                  {
                                      "nav-screen-content-before": d(() => [
                                          l(
                                              u.$slots,
                                              "nav-screen-content-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-screen-content-after": d(() => [
                                          l(
                                              u.$slots,
                                              "nav-screen-content-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      _: 3,
                                  },
                                  8,
                                  ["open"],
                              ),
                          ]))
                        : f("", !0)
            );
        },
    }),
    Ja = b(Wa, [["__scopeId", "data-v-ae24b3ad"]]),
    Oe = (o) => (B("data-v-b8d55f3b"), (o = o()), H(), o),
    Ya = ["role", "tabindex"],
    Qa = Oe(() => v("div", { class: "indicator" }, null, -1)),
    Xa = Oe(() =>
        v("span", { class: "vpi-chevron-right caret-icon" }, null, -1),
    ),
    Za = [Xa],
    xa = { key: 1, class: "items" },
    er = _({
        __name: "VPSidebarItem",
        props: { item: {}, depth: {} },
        setup(o) {
            const e = o,
                {
                    collapsed: t,
                    collapsible: s,
                    isLink: n,
                    isActiveLink: r,
                    hasActiveLink: u,
                    hasChildren: h,
                    toggle: p,
                } = bt(g(() => e.item)),
                y = g(() => (h.value ? "section" : "div")),
                P = g(() => (n.value ? "a" : "div")),
                k = g(() =>
                    h.value
                        ? e.depth + 2 === 7
                            ? "p"
                            : `h${e.depth + 2}`
                        : "p",
                ),
                V = g(() => (n.value ? void 0 : "button")),
                T = g(() => [
                    [`level-${e.depth}`],
                    { collapsible: s.value },
                    { collapsed: t.value },
                    { "is-link": n.value },
                    { "is-active": r.value },
                    { "has-active": u.value },
                ]);
            function A(S) {
                ("key" in S && S.key !== "Enter") || (!e.item.link && p());
            }
            function C() {
                e.item.link && p();
            }
            return (S, U) => {
                const G = K("VPSidebarItem", !0);
                return (
                    a(),
                    $(
                        W(y.value),
                        { class: N(["VPSidebarItem", T.value]) },
                        {
                            default: d(() => [
                                S.item.text
                                    ? (a(),
                                      c(
                                          "div",
                                          X(
                                              {
                                                  key: 0,
                                                  class: "item",
                                                  role: V.value,
                                              },
                                              Xe(
                                                  S.item.items
                                                      ? { click: A, keydown: A }
                                                      : {},
                                                  !0,
                                              ),
                                              { tabindex: S.item.items && 0 },
                                          ),
                                          [
                                              Qa,
                                              S.item.link
                                                  ? (a(),
                                                    $(
                                                        D,
                                                        {
                                                            key: 0,
                                                            tag: P.value,
                                                            class: "link",
                                                            href: S.item.link,
                                                            rel: S.item.rel,
                                                            target: S.item
                                                                .target,
                                                        },
                                                        {
                                                            default: d(() => [
                                                                (a(),
                                                                $(
                                                                    W(k.value),
                                                                    {
                                                                        class: "text",
                                                                        innerHTML:
                                                                            S
                                                                                .item
                                                                                .text,
                                                                    },
                                                                    null,
                                                                    8,
                                                                    [
                                                                        "innerHTML",
                                                                    ],
                                                                )),
                                                            ]),
                                                            _: 1,
                                                        },
                                                        8,
                                                        [
                                                            "tag",
                                                            "href",
                                                            "rel",
                                                            "target",
                                                        ],
                                                    ))
                                                  : (a(),
                                                    $(
                                                        W(k.value),
                                                        {
                                                            key: 1,
                                                            class: "text",
                                                            innerHTML:
                                                                S.item.text,
                                                        },
                                                        null,
                                                        8,
                                                        ["innerHTML"],
                                                    )),
                                              S.item.collapsed != null &&
                                              S.item.items &&
                                              S.item.items.length
                                                  ? (a(),
                                                    c(
                                                        "div",
                                                        {
                                                            key: 2,
                                                            class: "caret",
                                                            role: "button",
                                                            "aria-label":
                                                                "toggle section",
                                                            onClick: C,
                                                            onKeydown: Qe(C, [
                                                                "enter",
                                                            ]),
                                                            tabindex: "0",
                                                        },
                                                        Za,
                                                        32,
                                                    ))
                                                  : f("", !0),
                                          ],
                                          16,
                                          Ya,
                                      ))
                                    : f("", !0),
                                S.item.items && S.item.items.length
                                    ? (a(),
                                      c("div", xa, [
                                          S.depth < 5
                                              ? (a(!0),
                                                c(
                                                    M,
                                                    { key: 0 },
                                                    E(
                                                        S.item.items,
                                                        (R) => (
                                                            a(),
                                                            $(
                                                                G,
                                                                {
                                                                    key: R.text,
                                                                    item: R,
                                                                    depth:
                                                                        S.depth +
                                                                        1,
                                                                },
                                                                null,
                                                                8,
                                                                [
                                                                    "item",
                                                                    "depth",
                                                                ],
                                                            )
                                                        ),
                                                    ),
                                                    128,
                                                ))
                                              : f("", !0),
                                      ]))
                                    : f("", !0),
                            ]),
                            _: 1,
                        },
                        8,
                        ["class"],
                    )
                );
            };
        },
    }),
    tr = b(er, [["__scopeId", "data-v-b8d55f3b"]]),
    Ue = (o) => (B("data-v-575e6a36"), (o = o()), H(), o),
    or = Ue(() => v("div", { class: "curtain" }, null, -1)),
    sr = {
        class: "nav",
        id: "VPSidebarNav",
        "aria-labelledby": "sidebar-aria-label",
        tabindex: "-1",
    },
    nr = Ue(() =>
        v(
            "span",
            { class: "visually-hidden", id: "sidebar-aria-label" },
            " Sidebar Navigation ",
            -1,
        ),
    ),
    ar = _({
        __name: "VPSidebar",
        props: { open: { type: Boolean } },
        setup(o) {
            const { sidebarGroups: e, hasSidebar: t } = O(),
                s = o,
                n = I(null),
                r = we(Y ? document.body : null);
            return (
                j(
                    [s, n],
                    () => {
                        var u;
                        s.open
                            ? ((r.value = !0),
                              (u = n.value) == null || u.focus())
                            : (r.value = !1);
                    },
                    { immediate: !0, flush: "post" },
                ),
                (u, h) =>
                    i(t)
                        ? (a(),
                          c(
                              "aside",
                              {
                                  key: 0,
                                  class: N(["VPSidebar", { open: u.open }]),
                                  ref_key: "navEl",
                                  ref: n,
                                  onClick:
                                      h[0] || (h[0] = Ze(() => {}, ["stop"])),
                              },
                              [
                                  or,
                                  v("nav", sr, [
                                      nr,
                                      l(
                                          u.$slots,
                                          "sidebar-nav-before",
                                          {},
                                          void 0,
                                          !0,
                                      ),
                                      (a(!0),
                                      c(
                                          M,
                                          null,
                                          E(
                                              i(e),
                                              (p) => (
                                                  a(),
                                                  c(
                                                      "div",
                                                      {
                                                          key: p.text,
                                                          class: "group",
                                                      },
                                                      [
                                                          m(
                                                              tr,
                                                              {
                                                                  item: p,
                                                                  depth: 0,
                                                              },
                                                              null,
                                                              8,
                                                              ["item"],
                                                          ),
                                                      ],
                                                  )
                                              ),
                                          ),
                                          128,
                                      )),
                                      l(
                                          u.$slots,
                                          "sidebar-nav-after",
                                          {},
                                          void 0,
                                          !0,
                                      ),
                                  ]),
                              ],
                              2,
                          ))
                        : f("", !0)
            );
        },
    }),
    rr = b(ar, [["__scopeId", "data-v-575e6a36"]]),
    ir = _({
        __name: "VPSkipLink",
        setup(o) {
            const e = te(),
                t = I();
            j(
                () => e.path,
                () => t.value.focus(),
            );
            function s({ target: n }) {
                const r = document.getElementById(
                    decodeURIComponent(n.hash).slice(1),
                );
                if (r) {
                    const u = () => {
                        r.removeAttribute("tabindex"),
                            r.removeEventListener("blur", u);
                    };
                    r.setAttribute("tabindex", "-1"),
                        r.addEventListener("blur", u),
                        r.focus(),
                        window.scrollTo(0, 0);
                }
            }
            return (n, r) => (
                a(),
                c(
                    M,
                    null,
                    [
                        v(
                            "span",
                            { ref_key: "backToTop", ref: t, tabindex: "-1" },
                            null,
                            512,
                        ),
                        v(
                            "a",
                            {
                                href: "#VPContent",
                                class: "VPSkipLink visually-hidden",
                                onClick: s,
                            },
                            " Skip to content ",
                        ),
                    ],
                    64,
                )
            );
        },
    }),
    lr = b(ir, [["__scopeId", "data-v-0f60ec36"]]),
    cr = _({
        __name: "Layout",
        setup(o) {
            const { isOpen: e, open: t, close: s } = O(),
                n = te();
            j(() => n.path, s), kt(e, s);
            const { frontmatter: r } = L(),
                u = xe(),
                h = g(() => !!u["home-hero-image"]);
            return (
                Ie("hero-image-slot-exists", h),
                (p, y) => {
                    const P = K("Content");
                    return i(r).layout !== !1
                        ? (a(),
                          c(
                              "div",
                              { key: 0, class: N(["Layout", i(r).pageClass]) },
                              [
                                  l(p.$slots, "layout-top", {}, void 0, !0),
                                  m(lr),
                                  m(
                                      st,
                                      {
                                          class: "backdrop",
                                          show: i(e),
                                          onClick: i(s),
                                      },
                                      null,
                                      8,
                                      ["show", "onClick"],
                                  ),
                                  m(Ja, null, {
                                      "nav-bar-title-before": d(() => [
                                          l(
                                              p.$slots,
                                              "nav-bar-title-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-bar-title-after": d(() => [
                                          l(
                                              p.$slots,
                                              "nav-bar-title-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-bar-content-before": d(() => [
                                          l(
                                              p.$slots,
                                              "nav-bar-content-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-bar-content-after": d(() => [
                                          l(
                                              p.$slots,
                                              "nav-bar-content-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-screen-content-before": d(() => [
                                          l(
                                              p.$slots,
                                              "nav-screen-content-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "nav-screen-content-after": d(() => [
                                          l(
                                              p.$slots,
                                              "nav-screen-content-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      _: 3,
                                  }),
                                  m(
                                      ws,
                                      { open: i(e), onOpenMenu: i(t) },
                                      null,
                                      8,
                                      ["open", "onOpenMenu"],
                                  ),
                                  m(
                                      rr,
                                      { open: i(e) },
                                      {
                                          "sidebar-nav-before": d(() => [
                                              l(
                                                  p.$slots,
                                                  "sidebar-nav-before",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          "sidebar-nav-after": d(() => [
                                              l(
                                                  p.$slots,
                                                  "sidebar-nav-after",
                                                  {},
                                                  void 0,
                                                  !0,
                                              ),
                                          ]),
                                          _: 3,
                                      },
                                      8,
                                      ["open"],
                                  ),
                                  m(ls, null, {
                                      "page-top": d(() => [
                                          l(
                                              p.$slots,
                                              "page-top",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "page-bottom": d(() => [
                                          l(
                                              p.$slots,
                                              "page-bottom",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "not-found": d(() => [
                                          l(
                                              p.$slots,
                                              "not-found",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-hero-before": d(() => [
                                          l(
                                              p.$slots,
                                              "home-hero-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-hero-info-before": d(() => [
                                          l(
                                              p.$slots,
                                              "home-hero-info-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-hero-info": d(() => [
                                          l(
                                              p.$slots,
                                              "home-hero-info",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-hero-info-after": d(() => [
                                          l(
                                              p.$slots,
                                              "home-hero-info-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-hero-actions-after": d(() => [
                                          l(
                                              p.$slots,
                                              "home-hero-actions-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-hero-image": d(() => [
                                          l(
                                              p.$slots,
                                              "home-hero-image",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-hero-after": d(() => [
                                          l(
                                              p.$slots,
                                              "home-hero-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-features-before": d(() => [
                                          l(
                                              p.$slots,
                                              "home-features-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "home-features-after": d(() => [
                                          l(
                                              p.$slots,
                                              "home-features-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "doc-footer-before": d(() => [
                                          l(
                                              p.$slots,
                                              "doc-footer-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "doc-before": d(() => [
                                          l(
                                              p.$slots,
                                              "doc-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "doc-after": d(() => [
                                          l(
                                              p.$slots,
                                              "doc-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "doc-top": d(() => [
                                          l(
                                              p.$slots,
                                              "doc-top",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "doc-bottom": d(() => [
                                          l(
                                              p.$slots,
                                              "doc-bottom",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "aside-top": d(() => [
                                          l(
                                              p.$slots,
                                              "aside-top",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "aside-bottom": d(() => [
                                          l(
                                              p.$slots,
                                              "aside-bottom",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "aside-outline-before": d(() => [
                                          l(
                                              p.$slots,
                                              "aside-outline-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "aside-outline-after": d(() => [
                                          l(
                                              p.$slots,
                                              "aside-outline-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "aside-ads-before": d(() => [
                                          l(
                                              p.$slots,
                                              "aside-ads-before",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      "aside-ads-after": d(() => [
                                          l(
                                              p.$slots,
                                              "aside-ads-after",
                                              {},
                                              void 0,
                                              !0,
                                          ),
                                      ]),
                                      _: 3,
                                  }),
                                  m(ps),
                                  l(p.$slots, "layout-bottom", {}, void 0, !0),
                              ],
                              2,
                          ))
                        : (a(), $(P, { key: 1 }));
                }
            );
        },
    }),
    ur = b(cr, [["__scopeId", "data-v-5d98c3a5"]]),
    dr = {
        Layout: ur,
        enhanceApp: ({ app: o }) => {
            o.component("Badge", et);
        },
    },
    pr = {
        ...dr,
        setup() {
            const { lang: o } = ye();
            J(() => {
                if (Y) {
                    const e = new Date();
                    e.setMinutes(e.getMinutes() + 6e3);
                    const t = e.toUTCString();
                    document.cookie = `nf_lang=${o.value}; expires=${t}; path=/`;
                }
            });
        },
    };
export { pr as R, Un as c, L as u };
