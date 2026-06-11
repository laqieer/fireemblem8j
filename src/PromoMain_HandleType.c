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

void PromoMain_HandleType(struct ProcPromoMain *proc)
{
    struct ProcPromoHandler *parent = proc->proc_parent;
    switch (parent->bmtype) {
        case PROMO_HANDLER_TYPE_TRANINEE:
            Proc_Goto(proc, PROMOMAIN_LABEL_TRAINEE);
            break;

        case PROMO_HANDLER_TYPE_BM:

            /* If not select, direcly promote unit */
            if (parent->sel_en == false) {
                proc->jid = parent->jid;
                Proc_Goto(proc, PROMOMAIN_LABEL_POST_SEL);
            }
            /* other prepare for branch selection */
            else if (parent->sel_en == true)
                Proc_Goto(proc, PROMOMAIN_LABEL_SEL_EN);
            break;

        case PROMO_HANDLER_TYPE_PREP:
            if (parent->sel_en == false) {
                proc->jid = parent->jid;
                Proc_Goto(proc, PROMOMAIN_LABEL_POST_SEL);
            }
            else if (parent->sel_en == true)
                Proc_Goto(proc, PROMOMAIN_LABEL_SEL_EN);
            break;
    }
}
