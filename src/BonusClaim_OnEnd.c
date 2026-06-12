#include "global.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"

//! FE8U = 0x080B166C
void BonusClaim_OnEnd(struct BonusClaimProc * proc)
{
    EndGreenText();
    EndAllProcChildren(proc);
    SetPrimaryHBlankHandler(NULL);
}
