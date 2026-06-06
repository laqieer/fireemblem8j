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

struct GuideSt * CONST_DATA gGuideSt = (void *)gGenericBuffer;

// clang-format off











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

//! FE8U = 0x080CE28C
void ClearGuideCategoryTilemap(void)
{
    int iy;
    int ix;

    int yBase = 160;

    for (iy = 0; iy < 12; iy++)
    {
        for (ix = 0; ix < 28; ix++)
        {
            gBG1TilemapBuffer[(yBase + 1) + ix] = 0;
        }
        yBase += 0x20;
    }

    for (ix = 0; ix < 28; ix++)
    {
        gBG0TilemapBuffer[0x241 + ix + 0x00] = 0;
        gBG0TilemapBuffer[0x241 + ix + 0x20] = 0;
    }

    return;
}

//! FE8U = 0x080CE2E4
void GuideMenuRefresh_SyncBg1(void)
{
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    return;
}

//! FE8U = 0x080CE2F0
void GuideMenuRefresh_SyncBg0Bg1(void)
{
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
    return;
}

//! FE8U = 0x080CE2FC
void GuideEntry_RedrawUp(struct GuideProc * proc)
{
    int idx = proc->unk_34;
    int textIdx = idx % 6;

    ClearText(&gGuideSt->unk_b4[textIdx]);

    PutDrawText(
        &gGuideSt->unk_b4[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5),
        CheckFlag(gGuideTable[gGuideSt->unk_68[idx]].readFlag) ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GREEN, 0,
        18, GetStringFromIndex(gGuideTable[gGuideSt->unk_68[idx]].itemName));

    return;
}

//! FE8U = 0x080CE388
void GuideEntry_RedrawDown(struct GuideProc * proc)
{
    int idx = proc->unk_34;
    int textIdx = idx % 6;

    ClearText(&gGuideSt->unk_b4[textIdx]);

    PutDrawText(
        &gGuideSt->unk_b4[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 15),
        CheckFlag(gGuideTable[gGuideSt->unk_68[idx]].readFlag) ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GREEN, 0,
        18, GetStringFromIndex(gGuideTable[gGuideSt->unk_68[idx]].itemName));

    return;
}

//! FE8U = 0x080CE414
void BuildAndPutGuideEntryList(void)
{
    int r6;

    register int r4 asm("r4");
    int r5;
    int r8;

    int y = 5;
    int idx = 0;

    for (r8 = 0, gGuideSt->unk_3e = 0; gGuideTable[r8].title != 12; r8++)
    {

        if (!CheckFlag(gGuideTable[r8].displayFlag))
        {
            continue;
        }

        if (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC)
        {
            if (gGuideTable[r8].chapterTitle == gGuideSt->unk_40[gGuideSt->categoryIdx])
            {
                gGuideSt->unk_68[idx] = r8;
                idx++;
            }
        }
        else
        {
            if (gGuideTable[r8].title == gGuideSt->unk_54[gGuideSt->categoryIdx])
            {
                gGuideSt->unk_68[idx] = r8;
                idx++;
            }
        }
    }

    r6 = gGuideSt->unk_3e = idx;

    r5 = r4 = gGuideSt->unk_2c;

    for (r8 = 0; r8 <= 5 && r6 != 0; y += 2, r5++, r6--, r4++, r8++)
    {
        r5 = r5 % 6;

        ClearText(&gGuideSt->unk_b4[r5]);

        PutDrawText(
            &gGuideSt->unk_b4[r5], gBG1TilemapBuffer + TILEMAP_INDEX(11, y),
            (!CheckFlag(gGuideTable[gGuideSt->unk_68[r4]].readFlag)) ? TEXT_COLOR_SYSTEM_GREEN
                                                                     : TEXT_COLOR_SYSTEM_WHITE,
            0, 18, GetStringFromIndex(gGuideTable[gGuideSt->unk_68[r4]].itemName));
    }

    return;
}

//! FE8U = 0x080CE588
void GuideEntry_DrawInitial(void)
{
    int ix;
    int iy;

    int base = 160;

    for (iy = 0; iy < 12; iy++)
    {
        for (ix = 0; ix < 19; ix++)
        {
            int x = 10 + ix;

            gBG1TilemapBuffer[x + base] = 0;
        }

        base += 0x20;
    }

    return;
}

//! FE8U = 0x080CE5BC
const char * GetStringNextLine(const char * str)
{
    if (str == NULL)
    {
        return NULL;
    }

    if (*str == 0) // [X]
    {
        return NULL;
    }

    while (1)
    {
        char c = *str;
        u32 width;

        if (c != 0)
        {
            if (c == 1) // [NL]
            {
                return str + 1;
            }
        }
        else
        {
            return NULL;
        }

        str = GetCharTextLen(str, &width);
    }
}

//! FE8U = 0x080CE5F0
void MoveGuideDetailText(int idx, int moveDirection)
{
    int detailLinesScrolled;
    int i;

    int numDetailLines = 1;

    const char * str = GetStringFromIndex(gGuideTable[idx].details);
    while (1)
    {
        str = GetStringNextLine(str);
        if (str == NULL)
        {
            break;
        }

        numDetailLines++;
    }

    gGuideSt->numDetailLines = numDetailLines;

    detailLinesScrolled = gGuideSt->detailLinesScrolled;

    if (moveDirection != GUIDE_DETAILS_STAY)
    {
        if (numDetailLines > 4)
        {
            if (moveDirection == GUIDE_DETAILS_ADVANCE)
            {
                if (detailLinesScrolled + 4 <= numDetailLines - 4)
                {
                    detailLinesScrolled = detailLinesScrolled + 4;
                }
                else
                {
                    detailLinesScrolled = numDetailLines - 4;
                }
            }
            else
            {
                if (detailLinesScrolled - 4 >= 0)
                {
                    detailLinesScrolled = detailLinesScrolled - 4;
                }
                else
                {
                    detailLinesScrolled = 0;
                }
            }
        }

        if ((moveDirection != GUIDE_DETAILS_STAY) && (gGuideSt->detailLinesScrolled == detailLinesScrolled))
        {
            return;
        }
    }

    GuideEntry_DrawInitial();

    gGuideSt->detailLinesScrolled = detailLinesScrolled;

    ClearText(gGuideSt->unk_b4);

    PutDrawText(
        gGuideSt->unk_b4, TILEMAP_LOCATED(gBG1TilemapBuffer, 10, 5), TEXT_COLOR_SYSTEM_GOLD, 2, 18,
        GetStringFromIndex(gGuideTable[idx].itemName));

    str = GetStringFromIndex(gGuideTable[idx].details);

    for (i = 0; i < detailLinesScrolled + 4; i++)
    {

        if (i != 0)
        {
            str = GetStringNextLine(str);
            if (str == NULL)
            {
                break;
            }
        }

        if (i >= detailLinesScrolled)
        {
            int off;
            int textIndex = i % 5;

            ClearText(&gGuideSt->unk_b4[1 + textIndex]);

            PutDrawText(
                &gGuideSt->unk_b4[1 + textIndex],
                gBG1TilemapBuffer + 11 + ((((i - detailLinesScrolled) % 4) * 0x40) + (off = 0x100)),
                TEXT_COLOR_SYSTEM_WHITE, 0, 17, str);
        }
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}
