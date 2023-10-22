/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "JetBrainsMonoNLNerdFont:size=14" };
static const char dmenufont[]       = "JetBrainsMonoNLNerdFont:size=14";
static const char col_black[]       = "#000000";
static const char col_gray2[]       = "#222222";
static const char col_gray3[]       = "#bbbbbb";
static const char col_white[]       = "#ffffff";
static const char col_purple[]        = "#bd93f9";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white, col_black, col_black },
	[SchemeSel]  = { col_black, col_white,  col_purple  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Zathura",  NULL,       NULL,       2,            0,           -1 },
	{ "Brave-browser",  NULL,       NULL,       4,            0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_black, "-nf", col_gray3, "-sb", col_purple, "-sf", col_white, NULL };
static const char *termcmd[]  = { "st", NULL };


//my shit now
#define PRINT "/home/ju/.config/my-scripts/print.sh"
static const char *screenshot[]  =	{"/home/ju/.config/my-scripts/scrot.sh", NULL };
static const char *suspend[]  =	{"systemctl","suspend", NULL };
static const char *brave[]  =	{"brave", NULL };

static const char *typeä[]  = 		{ PRINT,"ä", NULL };
static const char *typeö[]  = 		{ PRINT,"ö", NULL };
static const char *typeü[]  = 		{ PRINT,"ü", NULL };
static const char *typeÄ[]  = 		{ PRINT,"Ä", NULL };
static const char *typeÖ[]  = 		{ PRINT,"Ö", NULL };
static const char *typeÜ[]  = 		{ PRINT,"Ü", NULL };
static const char *typeß[]  = 		{ PRINT,"ß", NULL };

static const char *brighter[]  = 	{ "xbacklight","-inc","1", NULL };
static const char *darker[]  =	 	{ "xbacklight","-dec","1", NULL };
static const char *brighterer[]  = 	{ "xbacklight","-inc","0.1", NULL };
static const char *darkerer[]  =	{ "xbacklight","-dec","0.1", NULL };
static const char *raiseVol[] = 	{"amixer", "-q", "set","Master", "5%+",NULL};
static const char *lowerVol[] = 	{"amixer", "-q", "set","Master", "5%-",NULL};
static const char *mute[] = 		{"amixer", "-q", "set","Master", "toggle",NULL};
static const char *muteMic[] = 		{"amixer", "-q", "set","Capture", "toggle",NULL};
#include <X11/XF86keysym.h>

static const Key keys[] = {

	//german layout overated
	{ Mod4Mask|ControlMask,		XK_minus,	   spawn,	   {.v = typeß}},
	{ Mod4Mask|ControlMask,		XK_apostrophe,	   spawn,	   {.v = typeä}},
	{ Mod4Mask|ControlMask,		XK_semicolon,	   spawn,	   {.v = typeö}},
	{ Mod4Mask|ControlMask,		XK_bracketleft,	   spawn,	   {.v = typeü}},
	{ Mod4Mask|ControlMask|ShiftMask,		XK_apostrophe,	   spawn,	   {.v = typeÄ}},
	{ Mod4Mask|ControlMask|ShiftMask,		XK_semicolon,	   spawn,	   {.v = typeÖ}},
	{ Mod4Mask|ControlMask|ShiftMask,		XK_bracketleft,	   spawn,	   {.v = typeÜ}},

	//util
	{ Mod4Mask|ShiftMask,		XK_s,	   spawn,	   {.v = screenshot}},
	{ Mod4Mask|ControlMask|MODKEY,		XK_h,	   spawn,	   {.v = suspend}},
	{ Mod4Mask,		XK_3,	   spawn,	   {.v = brave}},

	//media keys
	{ 0,		XF86XK_MonBrightnessUp,	   spawn,	   {.v = brighter}},
	{ 0,		XF86XK_MonBrightnessDown,  spawn,	   {.v = darker}},
	{ ShiftMask,		XF86XK_MonBrightnessUp,	   spawn,	   {.v = brighterer}},
	{ ShiftMask,		XF86XK_MonBrightnessDown,  spawn,	   {.v = darkerer}},

	{ 0,	XF86XK_AudioRaiseVolume	,  spawn,	   {.v = raiseVol}},
	{ 0,	XF86XK_AudioLowerVolume	,  spawn,	   {.v = lowerVol}},
	{ 0,	XF86XK_AudioMute 	,  spawn,	   {.v = mute}},
	{ 0,	XF86XK_AudioMicMute 	,  spawn,	   {.v = muteMic}},
	// from here default bindings
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

