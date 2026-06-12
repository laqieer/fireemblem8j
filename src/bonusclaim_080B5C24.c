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








 // maybe lower

extern struct BonusClaimEnt * CONST_DATA gpBonusClaimData;
extern struct BonusClaimEnt * CONST_DATA gpBonusClaimDataUpdated;
extern struct BonusClaimItemEnt * CONST_DATA gpBonusClaimItemList;
extern int* CONST_DATA gpBonusClaimItemCount;
extern struct BonusClaimConfig * CONST_DATA gpBonusClaimConfig;

int LoadBonusContentData(void*);

//! FE8U = 0x080B1008
void BonusClaim_EndTargetSpriteWorker(struct BonusClaimProc * proc)
{

    if (proc->unk_34 != NULL) {
        Proc_End(proc->unk_34);
        proc->unk_34 = NULL;
    }

    return;
}
