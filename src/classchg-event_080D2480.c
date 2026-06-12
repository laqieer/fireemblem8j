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

void PromoTrainee_OnEnd(struct ProcPromoTraineeEvent *proc)
{
    struct ProcPromoMain *parent = proc->proc_parent;
    parent->stat = PROMO_MAIN_STAT_TRAINEE_EVENT;
    ResetDialogueScreen();
    EndPrepScreenSpriteDraw();
    APProc_DeleteAll();
    EndMuralBackground_();
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(4, 0, 0);
    BG_SetPosition(8, 0, 0);
    BG_EnableSyncByMask(15);
    SetDispEnable(1, 1, 1, 1, 1);
}
