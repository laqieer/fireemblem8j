#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ctc.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "banim_data.h"
#include "constants/classes.h"




void SwitchAISFrameDataFromBARoundType(struct Anim * anim, int type)
{
    u32 frame, priority;
    const u32 *scr;

    if (GetAISLayerId(anim) == 0) {
        frame    = BanimDefaultModeConfig[4 * type + 0];
        priority = BanimDefaultModeConfig[4 * type + 1];
    } else {
        frame    = BanimDefaultModeConfig[4 * type + 2];
        priority = BanimDefaultModeConfig[4 * type + 3];
    }

    if (frame != 0xFF) {
        if (GetAnimPosition(anim) == EKR_POS_L) {
            // use r1 for scr
            scr = gpBanimModesLeft;
            scr = (void *)gBanimScrLeft + scr[frame];
        } else {
            scr = (void *)gBanimScrRight + gpBanimModesRight[frame];
        }
        anim->pScrStart = scr;
        anim->pScrCurrent = scr;
    } else {
        anim->pScrStart = BanimScr_DefaultAnim;
        anim->pScrCurrent = BanimScr_DefaultAnim;
        anim->state3 = 0;
    }

    anim->drawLayerPriority = priority;
    anim->oam2Base &= ~0xC00;
    anim->oam2Base |= 0x800;
    anim->timer = 0;
    anim->state2 &= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
    anim->currentRoundType = type;
    anim->commandQueueSize = 0;
    anim->pSpriteDataPool = gBanimOaml + GetAnimPosition(anim) * 0x5800 / 4;
    AnimSort();
    EkrDragonBodyAnimeSet54(anim);
}
