/* See LICENSE file for copyright and license details. */

/* appearance */

static const unsigned int borderpx = 3; /* border pixel of windows */

static const int startwithgaps = 1;  /* 1 means gaps are used by default */
static const unsigned int gappx = 5; /* default gap between windows in pixels */

static const unsigned int snap = 32; /* snap pixel */

static const int showbar = 1; /* 0 means no bar */
static const int topbar = 1;  /* 0 means bottom bar */

static const int horizpadbar = 4; /* horizontal padding for statusbar */
static const int vertpadbar = 6;  /* vertical padding for statusbar */
static const int vertpad = 0;     /* vertical padding of bar */
static const int sidepad = 0;     /* horizontal padding of bar */

static const char *fonts[] = {"JetBrainsMono:size=7"};
static const char dmenufont[] = "Departure Mono:size=9";

#include "colors.h"

static const char *colors[][3] = {
    /*               fg         bg          border   */
    [SchemeNorm] = {col_gray2, col_black, col_gray2},
    [SchemeSel] = {col_white, col_black, col_white},
};

/* Tag Names */
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"Gimp", NULL, NULL, 0, 1, -1},
    {"Firefox", NULL, NULL, 1 << 8, 0, -1},
};

/* layout(s) */
static const float mfact = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;   /* number of clients in master area */

static const int resizehints =
    0; /* 1 means respect size hints in tiled resizals */
static const int attachbelow =
    1; /* 1 means attach after the currently active window */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol, arrange function */
    {" T ", tile},    /* first entry is default */
    {" F ", NULL},    /* no layout function means floating behavior */
    {" M ", monocle}, /* "Fullscreen" Layout */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
  &((Keychord){1, {{MODKEY, KEY}}, view, {.ui = 1 << TAG}}),                   \
      &((Keychord){                                                            \
          1, {{MODKEY | ControlMask, KEY}}, toggleview, {.ui = 1 << TAG}}),    \
      &((Keychord){1, {{MODKEY | ShiftMask, KEY}}, tag, {.ui = 1 << TAG}}),    \
      &((Keychord){1,                                                          \
                   {{MODKEY | ControlMask | ShiftMask, KEY}},                  \
                   toggletag,                                                  \
                   {.ui = 1 << TAG}})

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

#include "cmds.h"

#include "keychords.h"

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
