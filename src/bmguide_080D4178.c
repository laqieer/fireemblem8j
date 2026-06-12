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

bool BmGuideTextShowGreenOrNormal(void)
{
    struct GuideEnt * it;

    for (it = gGuideTable; it->title != 12; it++)
    {
        if (CheckFlag(it->displayFlag) && !CheckFlag(it->readFlag))
        {
            return FALSE;
        }
    }
    return TRUE;
}
