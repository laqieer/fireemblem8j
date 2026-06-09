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

// data







 void Menu_AutoHelpBox_OnInit(struct MenuProc* proc);
 void Menu_AutoHelpBox_OnLoop(struct MenuProc* proc);



 void Menu_FrozenHelpBox_OnLoop(struct MenuProc* proc);



 void Menu_Frozen_OnLoop(struct MenuProc* proc);



/* prototypes for same-file helpers called by this run */
struct MenuProc* StartMenuAt( const struct MenuDef* def, struct MenuRect rect, ProcPtr parent);

// functions

struct MenuProc* StartOrphanMenuAdjusted(
    const struct MenuDef* def,
    int xSubject, int xTileLeft, int xTileRight)
{
    struct MenuRect rect = def->rect;

    if (xSubject < 120)
        rect.x = xTileRight;
    else
        rect.x = xTileLeft;

    return StartMenuAt(def, rect, NULL);
}

struct MenuProc* StartMenu(const struct MenuDef* def, ProcPtr parent)
{
    return StartMenuAt(def, def->rect, parent);
}
