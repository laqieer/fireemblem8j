#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"

#include "constants/songs.h"

// clang-format off





extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg1And3Scroll[];





u16 CONST_DATA Sprite_ChapterIntro_DecalBanner[] =
{
    4,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x8) + OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(112) + OAM1_HFLIP, OAM2_CHR(0x8) + OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(176) + OAM1_HFLIP, OAM2_LAYER(1),
};



extern struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[];

struct ProcCmd CONST_DATA ProcScr_ChapterIntro_RevealDecalSprite[] =
{
    PROC_CALL(ChapterIntro_RevealDecalSprite_Init),
    PROC_REPEAT(ChapterIntro_RevealDecalSprite_Loop),

    PROC_END,
};

extern struct ProcCmd CONST_DATA gProcScr_ChapterIntro[];



/**
 * Draws the vine-like banner decal behind the chapter intro title. The
 * "split open" effect that reveals the decal sprite is handled by
 * "ProcScr_ChapterIntro_RevealDecalSprite".
 */
//! FE8U = 0x080207C8
void ChapterIntro_PutDecalSprite_Loop(void)
{
    CallARM_PushToSecondaryOAM(0, 64, Sprite_ChapterIntro_DecalBanner, OAM2_CHR(0x200) + OAM2_PAL(2));
    CallARM_PushToSecondaryOAM(0, 64, Sprite_ChapterIntro_DecalBanner, OAM2_CHR(0x200) + OAM2_PAL(2));

    return;
}
