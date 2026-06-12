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

/* prototypes for same-file helpers called by this run */
const char * GetStringNextLine(const char * str);

//! FE8U = 0x080CE95C
void GuideDetailsRedraw_Init(struct GuideProc * proc)
{
    int textIdx;
    const char * str;
    int unk_34;

    unk_34 = proc->unk_34;
    textIdx = (unk_34 % 5);

    str = GetStringFromIndex(gGuideTable[gGuideSt->unk_68[gGuideSt->unk_2b]].details);

    while (unk_34 != 0)
    {
        str = GetStringNextLine(str);
        if (str == NULL)
        {
            break;
        }

        unk_34--;
    }

    ClearText(&gGuideSt->unk_b4[1 + textIdx]);
    PutDrawText(
        &gGuideSt->unk_b4[1 + textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 17,
        str);

    proc->unk_34 = 0;

    return;
}
