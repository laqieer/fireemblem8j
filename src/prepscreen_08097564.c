#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"

#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"












 // maybe there is 0xC*sizeof(u16) free space





/* prototypes for same-file helpers called by this run */
s8 CanPrepScreenCheckMap();

void PrepScreenMenu_OnUnk3(ProcPtr proc)
{
    Proc_Goto(proc, 0x5);
}

int PrepScreenMenu_OnBPress(struct ProcAtMenu* proc) {

    if (false != CheckInLinkArena()) {
        Proc_Goto(proc, 0x5);
        return true;
    }
    
    if (false == CanPrepScreenCheckMap())
        return false;

    PrepSpriteDraw_BlinkButtonB();
    Proc_Goto(proc, 0x5);
    return true;
}

void PrepScreenMenu_OnCheckMap(struct ProcAtMenu* proc) {
    Proc_Goto(proc, 0x5);
}
