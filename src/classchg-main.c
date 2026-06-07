#include "classchg.h"

#include "bm.h"
#include "bmio.h"
#include "bmudisp.h"
#include "face.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "sysutil.h"
#include "constants/songs.h"

int PromoMain_SetupTraineeEvent_(struct ProcPromoMain *proc);
bool PromoTraineeEventExists(struct ProcPromoMain *proc);
bool StartAndWaitPromoSelect(ProcPtr proc);
bool PromoMain_WaitSelectDone(struct ProcPromoMain *proc);



struct ProcPromoMain *Make6C_PromotionMain(ProcPtr proc);

void PromoMain_HandlePrepEndEffect(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent = proc->proc_parent;
    switch (parent->bmtype) {
        case PROMO_HANDLER_TYPE_TRANINEE:
        case PROMO_HANDLER_TYPE_BM:
            break;

        case PROMO_HANDLER_TYPE_PREP:
            BMapDispResume();
            RefreshUnitSprites();
            ApplyUnitSpritePalettes();
            ForceSyncUnitSpriteSheet();
            InitSystemTextFont();
            break;
    }
}

void PromoMain_OnEnd(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent = proc->proc_parent;
    if (parent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        RestoreBgm();
        Sound_SetSEVolume(0x100);
        OverrideBgm(SONG_COMBAT_PREPARATION);
    }
    parent->stat = 2;
    EndAllProcChildren(proc);
    Proc_End(proc);
}
