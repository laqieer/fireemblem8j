#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "bm.h"
#include "bmlib.h"
#include "bmio.h"
#include "mu.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void ekrBaStart_InitBattleScreen(struct ProcEkrBattleStarting *proc)
{
    if (0 == gEkrDebugModeMaybe) {
        NewEkrGauge();
        NewEkrDispUP();

        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            break;

        case EKR_DISTANCE_MONOCOMBAT:
            if (gBanimValid[EKR_POS_L] == false) {
                EkrGauge_Set4C();
                EkrDispUpSet4C();
            }

            if (gBanimValid[EKR_POS_R] == false) {
                EkrGauge_Set50();
                EkrDispUpSet50();
            }
            break;

        case EKR_DISTANCE_PROMOTION:
            EkrGauge_Set4C();
            EkrDispUpSet4C();
            break;

        default:
            break;
        }
    }

    EfxClearScreenFx();
    NewEkrUnitKakudai(0);
    NewEkrBaseKaiten(0);
    NewEkrWindowAppear(0, 0xB);
    NewEkrNamewinAppear(0, 0xB, 0);
    NewEkrBaseAppear(0, 0xB);

    proc->timer = 0;
    Proc_Break(proc);
}
