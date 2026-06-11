#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809E840
void PrepItemSupply_SwitchToUnitInventory(struct PrepItemSupplyProc * proc)
{
    ShowSysHandCursor(16, proc->unitInvIdx * 16 + 72, 0xb, 0x800);
    return;
}
