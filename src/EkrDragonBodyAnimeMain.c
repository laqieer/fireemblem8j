#include "global.h"
#include "gbafe.h"

extern const s16 BnaimFrames_DkHittedNormal[];
extern const s16 BnaimFrames_DkMiss[];

void EkrDragonBodyAnimeMain(struct ProcEfxDKfx * proc)
{
    s16 ret;
    struct ProcEfxDKBody1 *child;
    int round_type;

    /* Wait for anim->round to triger DK action */
    if (proc->round_cur != proc->anim->currentRoundType) {
        round_type = proc->anim->currentRoundType;
        proc->round_cur = round_type;
        proc->timer = 0;
        proc->unk2E = 0;
        proc->frame = 0;

        switch (round_type) {
        case ANIM_ROUND_HIT_CLOSE:
        case ANIM_ROUND_CRIT_CLOSE:
        case ANIM_ROUND_NONCRIT_FAR:
        case ANIM_ROUND_CRIT_FAR:
        case ANIM_ROUND_MISS_CLOSE:
            proc->frame_lut = BnaimFrames_DkHittedNormal;
            NewEkrDemoKingAtk(proc->anim, round_type);
            break;

        case ANIM_ROUND_TAKING_MISS_CLOSE:
        case ANIM_ROUND_TAKING_MISS_FAR:
            proc->frame_lut = BnaimFrames_DkMiss;
            break;

        case ANIM_ROUND_TAKING_HIT_CLOSE:
        case ANIM_ROUND_STANDING:
        case ANIM_ROUND_TAKING_HIT_FAR:
            proc->frame_lut = BnaimFrames_DkHittedNormal;
            break;

        default:
            break;
        }
    }

    ret = EfxAdvanceFrameLut((void *)&proc->timer, (void *)&proc->frame, (const s16 *)proc->frame_lut);
    if (ret >= 0) {
        s16 idx = ret;
        LZ77UnCompWram(proc->tsa_set[idx], gEkrTsaBuffer);
        EkrDragonTmCpyWithDistance();
        EkrDragonTmCpyExt(gEkrBgPosition, 0);
        return;
    }

    switch (ret) {
    case -6:
        if (proc->unk2E == 0) {
            if (GetAnimAnotherSide(proc->anim)->state3 & ANIM_BIT_FROZEN)
                proc->unk2E = 1;
        } else if (CheckEkrHitDone() == true){
            Proc_BreakEach(ProcScr_EkrDemoKingBodyShake);
            proc->timer = 0;
            proc->unk2E = 0;
            proc->frame++;
        }
        break;

    case -5:
        if (proc->unk2E == 0)
            proc->unk2E = 1;
        else if (proc->anim->state3 & ANIM_BIT_FROZEN){
            child = Proc_Start(ProcScr_EkrDemoKingBodyShake, PROC_TREE_3);
            child->fxproc = proc;
            proc->timer = 0;
            proc->unk2E = 0;
            proc->frame++;
        }
        break;

    case -4:
        if (proc->unk2E == 0)
            proc->unk2E = 1;
        else if (CheckEkrHitDone() == true){
            proc->timer = 0;
            proc->unk2E = 0;
            proc->frame++;
        }
        break;

    default:
        break;
    }
}
