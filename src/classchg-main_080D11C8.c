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

extern CONST_DATA struct ProcCmd ProcScr_PromoMain[];

struct ProcPromoMain *Make6C_PromotionMain(ProcPtr proc);

void PromoMain_InitScreen(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent;
    proc->stat = PROMO_HANDLER_STAT_INIT;
    proc->priv = 0;
    proc->sel_en = 0;
    parent = proc->proc_parent;
    if (parent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        ResetFaces();
        ResetText();
        LoadUiFrameGraphics();
        LoadObjUIGfx();
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
    if (parent->bmtype == PROMO_HANDLER_TYPE_BM) {
        struct ProcPromoHandler *gparent = parent->proc_parent;

        SetupBackgrounds(0);
        EndGreenText();
        gparent->game_lock = GetGameLock();
        EndHelpPromptSprite();
        EndSysBrownBox();
        EndAllParallelWorkers();
        EndFaceById(0);
        ClearUiCursorHandConfig(0);
        ResetFaces();
        ResetText();
        LoadUiFrameGraphics();
        LoadObjUIGfx();
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
        BG_EnableSyncByMask(2);
    }
    if (parent->bmtype == PROMO_HANDLER_TYPE_PREP) {
        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 2;
        gLCDControlBuffer.bg2cnt.priority = 1;
        gLCDControlBuffer.bg3cnt.priority = 3;
    }
}
