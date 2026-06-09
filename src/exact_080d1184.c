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

/* prototypes for same-file helpers called by this run */
struct ProcPromoMain *Make6C_PromotionMain(ProcPtr proc);

void MakePromotionScreen(struct ProcPromoHandler *proc, u8 pid, u8 terrain)
{
    struct ProcPromoMain *child;

    /* set callback stat */
    proc->stat = PROMO_HANDLER_STAT_INIT;

    child = Make6C_PromotionMain(proc);
    proc->promo_main = child;
    child->pid = pid;
    child->terrain = terrain;
}
