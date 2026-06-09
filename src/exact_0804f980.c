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
struct MenuProc* StartMenuCore( const struct MenuDef* def, struct MenuRect rect, int backBg, int tileref, int frontBg, int unk, ProcPtr parent);

struct MenuProc* StartOrphanMenuAdjustedExt(
    const struct MenuDef* def,
    int xSubject, int xTileLeft, int xTileRight,
    int backBg,
    int tileref,
    int frontBg,
    int unk)
{
    struct MenuRect rect = def->rect;

    if (xSubject < 120)
        rect.x = xTileRight;
    else
        rect.x = xTileLeft;

    return StartMenuCore(def, rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* StartMenuExt(
    const struct MenuDef* def,
    int backBg,
    int tileref,
    int frontBg,
    int unk,
    ProcPtr parent)
{
    return StartMenuCore(def, def->rect, backBg, tileref, frontBg, unk, parent);
}

struct MenuProc* StartOrphanMenuAtExt(
    const struct MenuDef* def,
    struct MenuRect rect,
    int backBg,
    int tileref,
    int frontBg,
    int unk)
{
    return StartMenuCore(def, rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* StartOrphanMenuExt(
    const struct MenuDef* def,
    int backBg,
    int tileref,
    int frontBg,
    int unk)
{
    return StartMenuCore(def, def->rect, backBg, tileref, frontBg, unk, NULL);
}

struct MenuProc* StartMenuAt(
    const struct MenuDef* def,
    struct MenuRect rect,
    ProcPtr parent)
{
    return StartMenuCore(def, rect, 1, TILEREF(0, 0), 0, 0, parent);
}
