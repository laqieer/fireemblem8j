#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "proc.h"
#include "hardware.h"
#include "bmarch.h"
#include "scene.h"
#include "constants/classes.h"

u32 ClassChgMenuSelOnInit(struct MenuProc *proc)
{
    SyncMenuBgs(proc);
    return 0;
}
