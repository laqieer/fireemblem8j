#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bm.h"
#include "bmio.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "helpbox.h"
#include "uimenu.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd sProc_MenuFrozenHelpBox[];

u8 MenuFrozenHelpBox(struct MenuProc* proc, int msgid)
{
    Proc_GotoScript(proc, sProc_MenuFrozenHelpBox);

    LoadHelpBoxGfx(NULL, -1); // TODO: default constants?
    StartHelpBox(GetUiHandPrevDisplayX(), GetUiHandPrevDisplayY(), msgid);
}
