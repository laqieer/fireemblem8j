#include "global.h"

#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"

#include "bmguide.h"
#include "constants/songs.h"

extern struct GuideSt * CONST_DATA gGuideSt;

// clang-format off

u16 CONST_DATA gSprite_GuideBannerText[] =
{
    4,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_CHR(0xC0),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0xC4),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8, OAM2_CHR(0xC8),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0xCC),
};

u16 CONST_DATA gSprite_SelectButtonSort[] =
{
    2,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, OAM2_CHR(0x92),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x98),
};

u16 CONST_DATA gSprite_BButtonBack[] =
{
    2,
    OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_X(16), OAM2_CHR(0x96),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x9C),
};



extern u16 CONST_DATA gTextIds_GuideCategoriesTopic[];

// clang-format on

extern u8 Tsa_UnkData_5[]; // tsa
extern u8 Img_UnkData_2[]; // gfx
extern u8 Img_UnkData_3[]; // gfx
extern u16 Pal_UnkData_3[]; // pal

// TODO: Implicit declarations
void UpdateMenuScrollBarConfig(int, int, int, int);
ProcPtr StartMenuScrollBarExt(ProcPtr, int, int, int, int);
void UnlockMenuScrollBar(void);
void LockMenuScrollBar(void);
void EndMenuScrollBar(void);

//! FE8U = 0x080CDF88
void GuideSpriteDraw_Loop(void)
{
    int y1;
    int y2;

    GetGameClock();

    PutSprite(3, 16, 8, gSprite_GuideBannerText, OAM2_PAL(2));

    if (gGuideSt->state == GUIDE_STATE_0)
    {
        PutSprite(3, 176, 3, gSprite_SelectButtonSort, OAM2_PAL(2));
    }

    PutSprite(3, 176, 15, gSprite_BButtonBack, OAM2_PAL(2));

    y1 = (gGuideSt->categoryIdx - gGuideSt->unk_2a) * 2 + 5;
    y2 = (gGuideSt->unk_2b - gGuideSt->unk_2c) * 2 + 5;

    switch (gGuideSt->state)
    {
        case GUIDE_STATE_0:
            DisplayUiHand(12, y1 * 8);

            if ((gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC ? gGuideSt->unk_3c : gGuideSt->unk_3d) > 6)
            {
                if (gGuideSt->unk_2a != 0)
                {
                    DisplayUiVArrow(32, 32, OAM2_CHR(0xE0) + OAM2_PAL(3), 1);
                }

                if (gGuideSt->unk_2a <
                    (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC ? gGuideSt->unk_3c : gGuideSt->unk_3d) - 6)
                {
                    DisplayUiVArrow(32, 136, OAM2_CHR(0xE0) + OAM2_PAL(3), 0);
                }
            }

            break;

        case GUIDE_STATE_1:
            DisplayFrozenUiHand(12, y1 * 8);
            DisplayUiHand(80, y2 * 8);

            break;

        case GUIDE_STATE_2:
            DisplayFrozenUiHand(12, y1 * 8);

            if (gGuideSt->numDetailLines > 4)
            {
                if ((gGuideSt->detailLinesScrolled) != 0)
                {
                    DisplayUiVArrow(144, 56, OAM2_CHR(0xE0) + OAM2_PAL(3), 1);
                }

                if (gGuideSt->detailLinesScrolled < gGuideSt->numDetailLines - 4)
                {
                    DisplayUiVArrow(144, 128, OAM2_CHR(0xE0) + OAM2_PAL(3), 0);
                }
            }

            break;
    }

    UpdateMenuScrollBarConfig(10, gGuideSt->unk_2c * 16, gGuideSt->unk_3e, 6);

    return;
}
