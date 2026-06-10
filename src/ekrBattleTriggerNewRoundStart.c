#include "global.h"
#include "anime.h"
#include "bm.h"
#include "hardware.h"
#include "ctc.h"
#include "event.h"
#include "proc.h"
#include "bmbattle.h"
#include "bmarena.h"
#include "ekrlevelup.h"
#include "ekrclasschg.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrdragon.h"
#include "ekrtriangle.h"
#include "eventinfo.h"
#include "constants/songs.h"

void ekrBattleTriggerNewRoundStart(struct ProcEkrBattle *proc)
{
    struct Anim *anim;

    if (++proc->timer <= 0x1E)
        return;

    if (gBanimValid[0] == true) {
        anim = gAnims[0];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;

        anim = gAnims[1];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;
    }

    if (gBanimValid[1] == true) {
        anim = gAnims[2];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;

        anim = gAnims[3];
        anim->state3 = ANIM_BIT3_NEW_ROUND_START;
        anim->state2 |= ANIM_BIT2_STOP;
    }

    gBanimDoneFlag[0] = false;
    gBanimDoneFlag[1] = false;
    proc->proc_idleCb = (ProcFunc)ekrBattle_2;
}
