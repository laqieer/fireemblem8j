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




void InitRightAnim(int round_type)
{
    struct Anim * anim;
    u32 frame_front = BanimDefaultModeConfig[round_type * 4 + 0];
    u32 priority_front = BanimDefaultModeConfig[round_type * 4 + 1];
    u32 frame_back = BanimDefaultModeConfig[round_type * 4 + 2];
    u32 priority_back = BanimDefaultModeConfig[round_type * 4 + 3];
    u32 r2 = BanimTypesPosRight[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;
    
    gEkrXPosBase[1] = 0;
    gEkrYPosBase[1] = 0;
    gEkrXPosReal[1] = r2;
    gEkrYPosReal[1] = 0x58;

label1:
    {
        u32 idx = gpBanimModesRight[frame_front];
        void *scr = gBanimScrRight + idx;
        if (frame_front == 0xFF)
            scr = BanimScr_DefaultAnim;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosReal[1] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[1];
        anim->oam2Base = OAM2_PAL(0x9) + OAM2_LAYER(0x2) + OAM2_CHR(0x6000 / 0x20);
        anim->state2 |= ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimRightImgSheetBuf;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[2] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesRight[frame_back];
        void *scr = gBanimScrRight + idx;
        if (frame_back == 0xFF)
            scr = BanimScr_DefaultAnim;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosReal[1] - gEkrBgPosition;
        anim->yPosition = gEkrYPosReal[1];
        anim->oam2Base = OAM2_PAL(0x9) + OAM2_LAYER(0x2) + OAM2_CHR(0x6000 / 0x20);
        anim->state2 |= ANIM_BIT2_FRONT_FRAME | ANIM_BIT2_POS_RIGHT | ANIM_BIT2_0400;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = round_type;
        anim->pImgSheetBuf = gBanimRightImgSheetBuf;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[3] = anim;
    }
}
