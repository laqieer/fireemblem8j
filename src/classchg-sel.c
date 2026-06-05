#include "global.h"
#include "classchg.h"
#include "proc.h"
#include "hardware.h"
#include "scene.h"
#include "classdisplayfont.h"
#include "constants/video-global.h"
#include "constants/classes.h"
#include "bmlib.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmsave.h"
#include "bm.h"
#include "bmmind.h"
#include "bmio.h"
#include "bmmap.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmitem.h"
#include "prepscreen.h"

void EndBanimTerrain(void *);
void InitBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);

void ClassChgSel_RouteOnEndByType(struct ProcPromoSel *proc)
{
    struct ProcPromoMain *parent;
    struct ProcPromoHandler *gparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;

    if (gparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE)
        Proc_Goto(proc, 5);
    else if (gparent->bmtype == PROMO_HANDLER_TYPE_BM)
        Proc_Goto(proc, 5);
    else if (gparent->bmtype == PROMO_HANDLER_TYPE_PREP)
        Proc_Break(proc);
}

bool StartAndWaitPromoSelect(struct ProcPromoMain *proc)
{
    struct ProcPromoMain *_proc = (struct ProcPromoMain *)proc;
    switch (_proc->stat) {
    case PROMO_MAIN_STAT_SELECTION:
        return false;

    case PROMO_MAIN_STAT_TRAINEE_EVENT:
    case PROMO_MAIN_STAT_INIT:
        proc->sel_en = StartPromoClassSelect(proc);
        _proc->stat = PROMO_MAIN_STAT_SELECTION;
        return false;

    default:
        return true;
    }
}

bool PromoMain_WaitSelectDone(struct ProcPromoMain *proc)
{
    switch (proc->stat) {
    case PROMO_MAIN_STAT_INIT:
    case PROMO_MAIN_STAT_SELECTION:
        return true;

    case PROMO_MAIN_STAT_2:
        return false;

    default:
        return true;
    }
}

void ClassChgSel_SetBlendWindowConfig(void)
{
    SetBlendConfig(1, 16, 16, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 0xF0, 0xA0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = true;
    gLCDControlBuffer.wincnt.wout_enableBlend = false;
    gLCDControlBuffer.bldcnt.target2_bd_on = true;
}
