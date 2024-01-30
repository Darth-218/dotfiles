/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "JetbrainsMono Nerd Font:bold:size=10" };
static const char dmenufont[]       = "JetbrainsMono Nerd Font:bold:size=13";
static const char col_gray1[]       = "#15141b";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#d8d9da";
static const char col_gray4[]       = "#eeeeee";
static const char col_purple[]        = "#239a7f";
static const char *colors[][3]      = {
	/*               fg         bg          border   */
	[SchemeNorm] = { col_gray3, col_gray1,  col_gray2 },
	[SchemeSel]  = { col_purple,  col_gray1,  col_purple  },
};

static const char *const autostart[] = {
	"st", NULL,
	NULL /* terminate */
};

/* tagging */
static const char *tags[] = { "󰣇 ", " ", "󰈹 ", " ", "󰶎 ", "󰎆 ", "󰐀 ", "󱃠 ", "󰘧 " };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int attachbelow = 1;    /* 1 means attach after the currently active window */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[t]=",      tile },    /* first entry is default */
	{ "><f>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_purple, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };

/* Launch Emacs */
static const char *emacsclientcmd[] = {"emacsclient", "-c", "-a",  "emacs", NULL};

/* Rofi Commands */
static const char *rofiruncmd[] = {"rofi", "-show", "run", NULL};
static const char *rofidruncmd[] = {"rofi", "-show", "drun", NULL};

/* Volume control */
static const char *volup[]   = { "amixer", "set", "Master", "5%+", NULL };
static const char *voldown[] = { "amixer", "set", "Master", "5%-", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */

  // Rofi Shortcuts
	{ MODKEY,                       XK_p,      spawn,          {.v = rofidruncmd } },
	{ MODKEY,                       XK_r,      spawn,          {.v = rofiruncmd } },

  // Spawn Terminal
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },

  // Toggle Status Bar
	{ MODKEY,                       XK_b,      togglebar,      {0} },

  // Switch Window Focus
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },

  // Number of Master Windows
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },

  // Window Width
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	
  // Switch Master Window
  { MODKEY,                       XK_Return, zoom,           {0} },

  //
	{ MODKEY,                       XK_Tab,    view,           {0} },

  // 
  { MODKEY|ShiftMask,             XK_c,      killclient,     {0} },

  // Change Layout //
  
  // Tiled Layout
  { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	// Floating Layout
  { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
  // Mono Layout
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
  //
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	// Toggle Floating -duh-
  { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },

	//
  { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

  // Tags
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)

  // Quit DWM
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },

  /* Emacs Shortcut */
  {MODKEY,                        XK_e,      spawn,          {.v = emacsclientcmd } },

	/* Volume Shortcuts */
	{ MODKEY,                       XK_equal,  spawn,      {.v = volup } },
	{ MODKEY,                       XK_minus,  spawn,      {.v = voldown } },

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

