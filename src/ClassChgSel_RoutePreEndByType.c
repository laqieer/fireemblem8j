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

void ClassChgSel_RoutePreEndByType(struct ProcPromoSel *proc)
{
    struct ProcPromoMain *parent;
    struct ProcPromoHandler *gparent;
    parent = proc->proc_parent;
    gparent = parent->proc_parent;
    if (gparent->bmtype == PROMO_HANDLER_TYPE_TRANINEE)
        Proc_Goto(proc, 4);
    else if (gparent->bmtype == PROMO_HANDLER_TYPE_BM)
        Proc_Break(proc);
    else if (gparent->bmtype == PROMO_HANDLER_TYPE_PREP)
        Proc_Goto(proc, 4);
}
