#include "themes.h"
#include <X11/X.h>
#include <X11/XF86keysym.h>

/* See LICENSE file for copyright and license details. */

// Functions
static void kbd_toggle_layout();

/* appearance */
static const unsigned int borderpx = 2; /* border pixel of windows */
static const unsigned int snap = 32;    /* snap pixel */
static const int showbar = 1;           /* 0 means no bar */
static const int topbar = 1;            /* 0 means bottom bar */
static const char *fonts[] = {"JetBrainsMono Nerd Font Mono:size=12"};

const char *kbd_layouts[3] = {"us", "ua", "ru"}; 

/* tagging */
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"KeePassXC", NULL, NULL, 0, 1, -1},
    {"Steam", NULL, NULL, 0, 1, -1},
    {"Nm-connection-editor", NULL, NULL, 0, 1, -1},
    {"copyq", NULL, NULL, 0, 1, -1},
    {NULL, NULL, "st-float", 0, 1, -1},
};

/* layout(s) */
static const float mfact = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;   /* number of clients in master area */
static const int resizehints =
    0; /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[]=", tile}, /* first entry is default */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
      {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

/* commands */
static char dmenumon[2] = "0";
static const char *dmenucmd[] = {"dmenu_run", "-m", dmenumon, NULL};
static const char *termcmd[] = {"st", NULL};
static const char *firefoxhomecmd[] = {"firefox", "-P", "home", NULL};
static const char *qutebrcmd[] = {"qutebrowser", NULL};
static const char *flameshotcmd[] = {"flameshot", "gui", NULL};
static const char *keepassxccmd[] = {"keepassxc", NULL};
static const char *projmancmd[] = {"projman", NULL};
static const char *brightnessicmd[] = {"brightnessctl", "s", "10%+", NULL};
static const char *brightnessdcmd[] = {"brightnessctl", "s", "10%-", NULL};
static const char *fmcmd[] = {"pcmanfm", NULL};
static const char *playernextcmd[] = {"playerctl", "next", NULL};
static const char *playerprevcmd[] = {"playerctl", "previous", NULL};
static const char *playertogglecmd[] = {"playerctl", "play-pause", NULL};
static const char *roficmd[] = {"rofi", "-show", "drun", NULL};
static const char *ytfzfcmd[] = {"ytfzf", "-Df", NULL};
static const char *ytfzfsubscmd[] = {"ytfzf", "-Df", "-c",
                                     "youtube-subscriptions", NULL};
static const char *newscmd[] = {"st", "-e", "newsboat", NULL};
static const char *cmuscmd[] = {"st", "-T", "st-float", "-e", "cmus", NULL};
static const char *qalccmd[] = {"st", "-T", "st-float", "-e", "qalc", NULL};
static const char *taskmanagercmd[] = {"st", "-T",   "st-float",
                                       "-e", "btop", NULL};
static const char *edgecmd[] = {"microsoft-edge-stable", NULL};
static const char *nmtuicmd[] = {"st", "-T", "st-float", "-e", "nmtui", NULL};
static const char *nmedcmd[] = {"nm-connection-editor", NULL};

static const char *volicmd[] = {
    "wpctl", "set-volume", "@DEFAULT_SINK@", "5%+", "-l", "1.0", NULL};
static const char *voldcmd[] = {
    "wpctl", "set-volume", "@DEFAULT_SINK@", "5%-", "-l", "1.0", NULL};

static const Key keys[] = {
    /* modifier                     key        function        argument */
    {MODKEY, XK_space, kbd_toggle_layout, {0}},
    {MODKEY, XK_d, spawn, {.v = roficmd}},
    {MODKEY, XK_x, spawn, {.v = cmuscmd}},
    {MODKEY, XK_n, spawn, {.v = nmtuicmd}},
    {MODKEY | ShiftMask, XK_n, spawn, {.v = nmedcmd}},
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {MODKEY, XK_w, spawn, {.v = firefoxhomecmd}},
    {MODKEY | ShiftMask, XK_w, spawn, {.v = edgecmd}},
    {MODKEY, XK_u, spawn, {.v = qutebrcmd}},
    {MODKEY, XK_i, spawn, {.v = taskmanagercmd}},
    {MODKEY, XK_y, spawn, {.v = keepassxccmd}},
    {MODKEY, XK_Print, spawn, {.v = flameshotcmd}},
    {MODKEY, XK_e, spawn, {.v = fmcmd}},
    {MODKEY, XK_t, spawn, {.v = ytfzfcmd}},
    {MODKEY | ShiftMask, XK_t, spawn, {.v = ytfzfsubscmd}},
    {MODKEY, XK_c, spawn, {.v = qalccmd}},
    {MODKEY, XK_apostrophe, spawn, {.v = playertogglecmd}},
    {MODKEY, XK_bracketright, spawn, {.v = playernextcmd}},
    {MODKEY, XK_bracketleft, spawn, {.v = playerprevcmd}},
    {NULL, XF86XK_MonBrightnessUp, spawn, {.v = brightnessicmd}},
    {NULL, XF86XK_MonBrightnessDown, spawn, {.v = brightnessdcmd}},
    {NULL, XF86XK_AudioRaiseVolume, spawn, {.v = volicmd}},
    {NULL, XF86XK_AudioLowerVolume, spawn, {.v = voldcmd}},
    {MODKEY, XK_p, spawn, {.v = projmancmd}},
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_l, setmfact, {.f = +0.05}},
    {MODKEY | ShiftMask, XK_Return, zoom, {0}},
    {MODKEY, XK_Tab, view, {0}},
    {MODKEY, XK_q, killclient, {0}},
    {MODKEY, XK_s, togglefloating, {0}},
    {MODKEY, XK_a, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_a, tag, {.ui = ~0}},
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8){MODKEY | ShiftMask, XK_q, quit, {0}},
};

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

static char *active_kbd_layout = "us";

static void kbd_toggle_layout() {
    const int num_layouts = sizeof(kbd_layouts) / sizeof(char*);

    for (int i = 0; i < num_layouts; i++) {
        const char* layout = kbd_layouts[i];
        
        if (!strcmp(layout, active_kbd_layout)) {
            int next_ind;

            if (i == num_layouts - 1) {
                next_ind = 0;
            } else {
                next_ind = i + 1;
            }

            active_kbd_layout = kbd_layouts[next_ind];
            const char *layout_cmd[] = {"setxkbmap", "-layout", active_kbd_layout, NULL};
            const Arg layout_arg = {.v = layout_cmd};
            spawn(&layout_arg);
            break;
        }
    }
}
