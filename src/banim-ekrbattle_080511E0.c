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

void ekrBattleInRoundIdle(struct ProcEkrBattle *proc)
{
    int ret = 0;
    if (gKeyStatusPtr->heldKeys & B_BUTTON)
        proc->speedup = true;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) == 2) {
            if (GetBattleAnimArenaFlag() == 0)
                ret = 1;
            else {
                gBanimExpGain[0] = gpEkrBattleUnitLeft->expGain;
                gBanimExpGain[1] = gpEkrBattleUnitRight->expGain;

                if (gEkrGaugeHp[0] == 0) {
                    ArenaSetResult(1);
                    ret = 1;
                } else if (gEkrGaugeHp[1] == 0) {
                    ArenaSetResult(2);
                    gBanimExpGain[1] = 0;
                    ret = 1;
                } else if (proc->speedup == true) {
                    StopArenaBattleMusic();
                    ArenaSetResult(4);
                    gBanimExpGain[1] = 0;
                    ret = 1;
                } else {
                    u8 val = 0;
                    struct Anim *anim1 = gAnims[0];
                    struct Anim *anim2 = gAnims[2];

                    switch (anim1->currentRoundType) {
                    case ANIM_ROUND_TAKING_HIT_CLOSE:
                    case ANIM_ROUND_STANDING:
                    case ANIM_ROUND_TAKING_HIT_FAR:
                        val = 1;
                        break;

                    default:
                        break;
                    } /* switch */

                    switch (anim2->currentRoundType) {
                    case ANIM_ROUND_TAKING_HIT_CLOSE:
                    case ANIM_ROUND_STANDING:
                    case ANIM_ROUND_TAKING_HIT_FAR:
                        val++;
                        break;

                    default:
                        break;
                    } /* switch */

                    if (val == 2) {
                        if (anim1->xPosition == 0x44)
                            NewEfxFarAttackWithDistance(anim1, -1);

                        ArenaContinueBattle();
                        ParseBattleHitToBanimCmd();
                        AnimClearAll();
                        UpdateBanimFrame();
                        InitMainAnims();

                        proc->timer = 0;
                        proc->proc_idleCb = (ProcFunc)ekrBattleTriggerNewRoundStart;
                    } /* if */
                }
            } /* if */
        } /* switch */
        break;

    case EKR_DISTANCE_MONOCOMBAT:
        if ((gBanimDoneFlag[0] + gBanimDoneFlag[1]) == 1)
            ret = 1;
        break;

    case EKR_DISTANCE_PROMOTION:
        ret = 1;
        break;
    }

    if (ret == 1)
        proc->proc_idleCb = (ProcFunc)ekrBattleOnBattleEnd;
}
