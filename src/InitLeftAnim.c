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




void InitLeftAnim(int round_type)
{
    struct Anim * anim;
    u32 frame_front = BanimDefaultModeConfig[round_type * 4 + 0];
    u32 priority_front = BanimDefaultModeConfig[round_type * 4 + 1];
    u32 frame_back = BanimDefaultModeConfig[round_type * 4 + 2];
    u32 priority_back = BanimDefaultModeConfig[round_type * 4 + 3];
    u32 r4 = BanimTypesPosLeft[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;

    gEkrXPosBase[0] = -BanimLeftDefaultPos[gEkrDistanceType];
    gEkrYPosBase[0] = 0;
    gEkrXPosReal[0] = gEkrXPosBase[0] + r4;
    gEkrYPosReal[0] = 0x58;

label1:
    {
        u32 idx = gpBanimModesLeft[frame_front];
        void *scr = gBanimScrLeft + idx;
        if (frame_front == 0xFF)
            scr = BanimScr_DefaultAnim;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosReal[0] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[0];
        anim->oam2Base = OAM2_PAL(0x7) + OAM2_LAYER(0x2) + OAM2_CHR(0x4000 / 0x20);
        anim->state2 |= ANIM_BIT2_0400 | ANIM_BIT2_BACK_FRAME;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimLeftImgSheetBuf;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[0] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesLeft[frame_back];
        void *scr = gBanimScrLeft + idx;
        if (frame_back == 0xFF)
            scr = BanimScr_DefaultAnim;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosReal[0] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[0];
        anim->oam2Base = OAM2_PAL(0x7) + OAM2_LAYER(0x2) + OAM2_CHR(0x4000 / 0x20);
        anim->state2 |= ANIM_BIT2_0400 | ANIM_BIT2_FRONT_FRAME;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimLeftImgSheetBuf;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[1] = anim;
    }
}
