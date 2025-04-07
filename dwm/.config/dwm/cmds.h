static char dmenumon[2] =
    "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
    "dmenu_run", "-m",  dmenumon, "-fn", dmenufont, "-nb", col_black, "-nf",
    col_white,   "-sb", col_red,  "-sf", col_black, "-l",  "0",       NULL};

// Spawn terminal
static const char *termcmd[] = {"ghostty", NULL};

/* Launch internet browser */
static const char *browsercmd[] = {"librewolf", NULL};

/* Launch file browser */
static const char *filescmd[] = {"dolphin", NULL};

static const char *restartbar[] = {"pkill slstatus; slstatus &", NULL};
