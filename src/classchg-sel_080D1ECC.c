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

/* file-scope type definitions used by this run */


struct Struct_8A30978 {
    u8 a;
    u8 b; // Accessed indirectly, strangely
    u16 longBuffer[0x4B2];
};

void ClassChgSel_OnEndCleanupBm(struct ProcPromoSel *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    struct ProcPromoHandler *gparent = parent->proc_parent;
    switch (gparent->bmtype) {
    case PROMO_HANDLER_TYPE_TRANINEE:
        return;
    case PROMO_HANDLER_TYPE_BM:
        Proc_End(proc);
        Proc_End(parent);
        Proc_End(gparent);
        EndEkrUnitMainMini(&gUnk_81);
        EndBanimTerrain(&gEkrbattle_9);
        EndEfxAnimeDrvProc();
    }
}
