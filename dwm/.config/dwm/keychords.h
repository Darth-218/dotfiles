/* Include media function keys */
#include <X11/XF86keysym.h>

#include "movestack.c"

/* Keybindings */
static Keychord *keychords[] = {
    /* Keys        function        argument */

    /* Spawn terminal */
    &((Keychord){1, {{MODKEY | ShiftMask, XK_Return}}, spawn, {.v = termcmd}}),
    &((Keychord){2, {{MODKEY, XK_n}, {MODKEY, XK_n}}, spawn, {.v = termcmd}}),

    /* Toggle status bar */
    &((Keychord){1, {{MODKEY, XK_space}}, togglebar, {0}}),

    /* Change window focus */
    &((Keychord){1, {{MODKEY, XK_j}}, focusstack, {.i = +1}}),
    &((Keychord){1, {{MODKEY, XK_k}}, focusstack, {.i = -1}}),

    /* Increase/Decrease the number of master windows */
    &((Keychord){1, {{MODKEY, XK_i}}, incnmaster, {.i = +1}}),
    &((Keychord){1, {{MODKEY, XK_d}}, incnmaster, {.i = -1}}),

    /* Increase/Decrease the master window size (width) */
    &((Keychord){1, {{MODKEY, XK_h}}, setmfact, {.f = -0.05}}),
    &((Keychord){1, {{MODKEY, XK_l}}, setmfact, {.f = +0.05}}),

    /* Change master window to currently in focus */
    &((Keychord){1, {{MODKEY, XK_Return}}, zoom, {0}}),

    /* Switch to last-used tag */
    &((Keychord){1, {{MODKEY, XK_Tab}}, view, {0}}),

    /* Move current window up and down (j, k) */
    &((Keychord){1, {{MODKEY | ShiftMask, XK_j}}, movestack, {.i = +1}}),
    &((Keychord){1, {{MODKEY | ShiftMask, XK_k}}, movestack, {.i = -1}}),

    /* Kill current window */
    &((Keychord){1, {{MODKEY | ShiftMask, XK_x}}, killclient, {0}}),

    /* Change to tiled, floating, monocole view */
    &((Keychord){1, {{MODKEY, XK_t}}, setlayout, {.v = &layouts[0]}}),
    &((Keychord){1, {{MODKEY, XK_f}}, setlayout, {.v = &layouts[1]}}),
    &((Keychord){1, {{MODKEY, XK_m}}, setlayout, {.v = &layouts[2]}}),

    /* Change the current window to floating mode */
    &((Keychord){1, {{MODKEY | ShiftMask, XK_space}}, togglefloating, {0}}),

    /* Toggle all tags */
    &((Keychord){1, {{MODKEY, XK_0}}, view, {.ui = ~0}}),

    /* View current window in all tags */
    &((Keychord){1, {{MODKEY | ShiftMask, XK_0}}, tag, {.ui = ~0}}),

    /* Move focus to the next, previous screen (j, k) */
    &((Keychord){1, {{MODKEY | ControlMask, XK_j}}, focusmon, {.i = -1}}),
    &((Keychord){1, {{MODKEY | ControlMask, XK_k}}, focusmon, {.i = +1}}),

    /* Move window to the next, previous screen */
    &((Keychord){1, {{MODKEY | ShiftMask, XK_comma}}, tagmon, {.i = -1}}),
    &((Keychord){1, {{MODKEY | ShiftMask, XK_period}}, tagmon, {.i = +1}}),

    /* Toggle gaps between windows */
    &((Keychord){1,
                 {{MODKEY | ControlMask | ShiftMask, XK_equal}},
                 setgaps,
                 {.i = GAP_TOGGLE}}),

    /* Decrease, Increase gap size between windows */
    &((Keychord){1, {{MODKEY | ControlMask, XK_minus}}, setgaps, {.i = -1}}),
    &((Keychord){1, {{MODKEY | ControlMask, XK_equal}}, setgaps, {.i = +1}}),

    // Reset gaps to the default size
    &((Keychord){1,
                 {{MODKEY | ControlMask | ShiftMask, XK_minus}},
                 setgaps,
                 {.i = GAP_RESET}}),

    /* Quit DWM */
    &((Keychord){1, {{MODKEY | ShiftMask, XK_q}}, quit, {0}}),

    /* Restart DWM */
    &((Keychord){1, {{MODKEY | ControlMask | ShiftMask, XK_q}}, quit, {1}}),

    /* Tags */
    TAGKEYS(XK_1, 0),
    TAGKEYS(XK_2, 1),
    TAGKEYS(XK_3, 2),
    TAGKEYS(XK_4, 3),
    TAGKEYS(XK_5, 4),
    TAGKEYS(XK_6, 5),
    TAGKEYS(XK_7, 6),
    TAGKEYS(XK_8, 7),
    TAGKEYS(XK_9, 8),

    // "mod + a, b" Mercury browser
    &((Keychord){2, {{MODKEY, XK_a}, {0, XK_b}}, spawn, {.v = browsercmd}}),

    // "mod + a, f" Launch file manager
    &((Keychord){2, {{MODKEY, XK_a}, {0, XK_f}}, spawn, {.v = filescmd}}),
};
