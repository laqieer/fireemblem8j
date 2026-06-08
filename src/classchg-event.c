#include "global.h"
#include "hardware.h"
#include "mu.h"
#include "face.h"
#include "proc.h"
#include "bmio.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "scene.h"
#include "bm.h"
#include "ap.h"
#include "bmlib.h"
#include "cgtext.h"
#include "constants/characters.h"
#include "classchg.h"

/* prototypes for same-file helpers called by this run */
void PromoMain_SetupTraineeEvent(struct ProcPromoMain *proc);

int PromoMain_SetupTraineeEvent_(struct ProcPromoMain *proc) {
    PromoMain_SetupTraineeEvent(proc);
    return 0;
}

bool PromoTraineeEventExists(struct ProcPromoMain *proc) {
    if (proc->stat == PROMO_MAIN_STAT_TRAINEE_EVENT)
        return false;
    else
        return true;
}
