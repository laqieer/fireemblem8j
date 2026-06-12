#include "global.h"
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

void PromoHandleTraineePostType(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent = proc->proc_parent;
    if (parent->bmtype == PROMO_HANDLER_TYPE_TRANINEE) {
        if (parent->sel_en == false) {
            proc->jid = parent->jid;
            Proc_Goto(proc, PROMOMAIN_LABEL_POST_SEL);
        }
        if (parent->sel_en == true) {
            Proc_Goto(proc, PROMOMAIN_LABEL_SEL_EN);
        }
    }
}
