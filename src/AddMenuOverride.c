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


extern struct MenuItemOverride sMenuOverrides[];

void AddMenuOverride(int cmdid, int kind, void* func)
{
    struct MenuItemOverride* it = sMenuOverrides;

    while ((it->kind != 0) && !((it->kind == kind) && (it->cmdid == cmdid)))
        ++it;

    it->cmdid = cmdid;
    it->kind = kind;
    it->func = func;
}
