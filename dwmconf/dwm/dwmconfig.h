/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 8;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 10;       /* vertical padding of bar */
static const int sidepad            = 10;       /* horizontal padding of bar */
static const char *fonts[]          = { "JetbrainsMono Nerd Font:bold:size=10" };
static const char dmenufont[]       = "JetbrainsMono Nerd Font:bold:size=13";
static const char col_gray1[]       = "#15141b";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#d8d9da";
static const char col_gray4[]       = "#eeeeee";
static const char col_purple[]        = "#54c59f";
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
static const char *tags[] = {" ", "󰈹 ", " ", "󰶎 ", "󰎆 ", "󰈙 ", "󱈎 ", "󰣇 ", "󰘧 " };

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
	{ " ",      tile },    /* first entry is default */
	{ " ",      NULL },    /* no layout function means floating behavior */
	{ " ",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG)                                                                                               \
       &((Keychord){1, {{MODKEY, KEY}},                                        view,           {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ControlMask, KEY}},                            toggleview,     {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ShiftMask, KEY}},                              tag,            {.ui = 1 << TAG} }), \
       &((Keychord){1, {{MODKEY|ControlMask|ShiftMask, KEY}},                  toggletag,      {.ui = 1 << TAG} }),

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_purple, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };

/* Launch Emacs */
static const char *emacsclientcmd[] = {"emacsclient", "-c", "-a",  "emacs", NULL};

/* Launch Mercury browser */
static const char *mercurycmd[]  = { "mercury-browser", NULL };

/* Launch Discord */
static const char *discordcmd[]  = { "discord", NULL };

/* Launch Thunar */
static const char *thunarcmd[]  = { "thunar", NULL };

/* Rofi Commands */
static const char *rofiruncmd[] = {"rofi", "-show", "run", NULL};
static const char *rofidruncmd[] = {"rofi", "-show", "drun", NULL};
static const char *roficalccmd[] = {"rofi", "-show", "calc", NULL};
static const char *rofifilescmd[] = {"rofi", "-show", "filebrowser", NULL};
static const char *rofiemojicmd[] = {"rofi", "emoji", "-show", "emoji", NULL};
static const char *rofiwificmd[] = {"rofi-wifi", NULL};
static const char *rofipowercmd[] = {"rofi-powermenu", NULL};


/* Volume control */
static const char *volup[]   = { "amixer", "set", "Master", "5%+", NULL };
static const char *voldown[] = { "amixer", "set", "Master", "5%-", NULL };

static Keychord *keychords[] = {
       /* Keys        function        argument */

       &((Keychord){1, {{MODKEY|ShiftMask, XK_Return}},                        spawn,          {.v = termcmd } }),
       &((Keychord){2, {{MODKEY, XK_e}, {MODKEY, XK_e}},                       spawn,          {.v = termcmd } }),

       /* Toggle status bar */
       &((Keychord){1, {{MODKEY, XK_b}},                                       togglebar,      {0} }),

       /* Window focus */
       &((Keychord){1, {{MODKEY, XK_j}},                                       focusstack,     {.i = +1 } }),
       &((Keychord){1, {{MODKEY, XK_k}},                                       focusstack,     {.i = -1 } }),

       /* Increase/Decrease the number of master windows */
       &((Keychord){1, {{MODKEY, XK_i}},                                       incnmaster,     {.i = +1 } }),
       &((Keychord){1, {{MODKEY, XK_d}},                                       incnmaster,     {.i = -1 } }),

       /* Increase/Decrease the master window size */
       &((Keychord){1, {{MODKEY, XK_h}},                                       setmfact,       {.f = -0.05} }),
       &((Keychord){1, {{MODKEY, XK_l}},                                       setmfact,       {.f = +0.05} }),
       &((Keychord){1, {{MODKEY, XK_Return}},                                  zoom,           {0} }),
       &((Keychord){1, {{MODKEY, XK_Tab}},                                     view,           {0} }),

       /* Kill current window */
       &((Keychord){1, {{MODKEY|ShiftMask, XK_c}},                             killclient,     {0} }),

       /* Change layout */
       &((Keychord){1, {{MODKEY, XK_t}},                                       setlayout,      {.v = &layouts[0]} }),
       &((Keychord){1, {{MODKEY, XK_f}},                                       setlayout,      {.v = &layouts[1]} }),
       &((Keychord){1, {{MODKEY, XK_m}},                                       setlayout,      {.v = &layouts[2]} }),
       &((Keychord){1, {{MODKEY, XK_space}},                                   setlayout,      {0} }),
       &((Keychord){1, {{MODKEY|ShiftMask, XK_space}},                         togglefloating, {0} }),

       /* Tags control */
       &((Keychord){1, {{MODKEY, XK_0}},                                       view,           {.ui = ~0 } }),
       &((Keychord){1, {{MODKEY|ShiftMask, XK_0}},                             tag,            {.ui = ~0 } }),

       //
       &((Keychord){1, {{MODKEY, XK_comma}},                                   focusmon,       {.i = -1 } }),
       &((Keychord){1, {{MODKEY, XK_period}},                                  focusmon,       {.i = +1 } }),
       &((Keychord){1, {{MODKEY|ShiftMask, XK_comma}},                         tagmon,         {.i = -1 } }),
       &((Keychord){1, {{MODKEY|ShiftMask, XK_period}},                        tagmon,         {.i = +1 } }),

       /* Fullgaps */
       &((Keychord){1, {{MODKEY|ControlMask, XK_minus}},                       setgaps,        {.i = -1 } }),
       &((Keychord){1, {{MODKEY|ControlMask, XK_equal}},                       setgaps,        {.i = +1 } }),
       &((Keychord){1, {{MODKEY|ControlMask|ShiftMask, XK_equal}},             setgaps,        {.i =  0 } }),

       /* Volume controls */
       &((Keychord){1, {{MODKEY, XK_equal}},                                   spawn,          {.v = volup } }),
       &((Keychord){1, {{MODKEY, XK_minus}},                                   spawn,          {.v = voldown } }),

       /* Quit DWM */
       &((Keychord){1, {{MODKEY|ShiftMask, XK_q}},                             quit,           {0} }),

       /* Tags */

       TAGKEYS(                        XK_1,                      0)
       TAGKEYS(                        XK_2,                      1)
       TAGKEYS(                        XK_3,                      2)
       TAGKEYS(                        XK_4,                      3)
       TAGKEYS(                        XK_5,                      4)
       TAGKEYS(                        XK_6,                      5)
       TAGKEYS(                        XK_7,                      6)
       TAGKEYS(                        XK_8,                      7)
       TAGKEYS(                        XK_9,                      8)


       /* Custom Keychords */

       // super + a
       /// e emacs
       &((Keychord){2, {{MODKEY, XK_a}, {MODKEY, XK_e}},                       spawn,          {.v = emacsclientcmd } }),

       /// b Mercury browser
       &((Keychord){2, {{MODKEY, XK_a}, {MODKEY, XK_b}},                       spawn,          {.v = mercurycmd } }),

       /// d discord
       &((Keychord){2, {{MODKEY, XK_a}, {MODKEY, XK_d}},                       spawn,          {.v = discordcmd } }),

       /// f thunar
       &((Keychord){2, {{MODKEY, XK_a}, {MODKEY, XK_f}},                       spawn,          {.v = thunarcmd } }),

       // super + r
       /// d rofi drun menu
       &((Keychord){2, {{MODKEY, XK_r}, {MODKEY, XK_d}},                                       spawn,          {.v = rofidruncmd } }),

       /// r rofi run menu
       &((Keychord){2, {{MODKEY, XK_r}, {MODKEY, XK_r}},                                       spawn,          {.v = rofiruncmd } }),

       /// c rofi run menu
       &((Keychord){2, {{MODKEY, XK_r}, {MODKEY, XK_c}},                                       spawn,          {.v = roficalccmd } }),

       /// f rofi run menu
       &((Keychord){2, {{MODKEY, XK_r}, {MODKEY, XK_f}},                                       spawn,          {.v = rofifilescmd } }),

       /// e rofi run menu
       &((Keychord){2, {{MODKEY, XK_r}, {MODKEY, XK_e}},                                       spawn,          {.v = rofiemojicmd } }),

       /// w rofi run menu
       &((Keychord){2, {{MODKEY, XK_r}, {MODKEY, XK_w}},                                       spawn,          {.v = rofiwificmd } }),

       /// p rofi run menu
       &((Keychord){2, {{MODKEY, XK_r}, {MODKEY, XK_p}},                                       spawn,          {.v = rofipowercmd } }),
};


/*   /\* Emacs Shortcut *\/ */
/*   {MODKEY,                        XK_e,      spawn,          {.v = emacsclientcmd } }, */

/* 	/\* Volume Shortcuts *\/ */
/* 	{ MODKEY,                       XK_equal,  spawn,      {.v = volup } }, */
/* 	{ MODKEY,                       XK_minus,  spawn,      {.v = voldown } }, */

/* }; */

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

