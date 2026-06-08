#include "global.h"

#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"



// clang-format off





















// clang-format on

void ChapterStatus_Init(struct ChapterStatusProc * proc);
void ChapterStatus_DrawText(struct ChapterStatusProc * proc);
void ChapterStatus_ShowAllLayers(void);
void ChapterStatus_LoopKeyHandler(struct ChapterStatusProc * proc);
void ChapterStatus_OnEnd(struct ChapterStatusProc * proc);
void ChapterStatus_FocusLeaderUnit(struct ChapterStatusProc * proc);

// clang-format off







// clang-format on

void StatusScreenSpriteDraw_Init(struct ChapterStatusProc * proc);
void StatusScreenSpriteDraw_Loop(struct ChapterStatusProc * proc);

// clang-format off



// clang-format on

extern struct HelpBoxInfo sHelpInfo_ChapterStatus_TurnCount;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_Funds;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_AllyUnits;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_EnemyUnits;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_Leader;
extern struct HelpBoxInfo sHelpInfo_ChapterStatus_TimePlayed;

// clang-format off

struct HelpBoxInfo sHelpInfo_ChapterStatus_Goal =
{
    &sHelpInfo_ChapterStatus_AllyUnits,
    &sHelpInfo_ChapterStatus_TurnCount,
    NULL,
    &sHelpInfo_ChapterStatus_Leader,
    36,
    68,
    MSG_6F1, // "The goal of this chapter.[.]"
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_TurnCount =
{
    &sHelpInfo_ChapterStatus_Goal,
    &sHelpInfo_ChapterStatus_Funds,
    NULL,
    &sHelpInfo_ChapterStatus_TimePlayed,
    16,
    116,
    MSG_6F2, // "Number of turns played at this[NL]point in the current chapter.[.]"
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_Funds =
{
    &sHelpInfo_ChapterStatus_TurnCount,
    &sHelpInfo_ChapterStatus_AllyUnits,
    NULL,
    &sHelpInfo_ChapterStatus_TimePlayed,
    16,
    132,
    MSG_6F3, // "Money on hand."
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_AllyUnits =
{
    &sHelpInfo_ChapterStatus_Funds,
    &sHelpInfo_ChapterStatus_Goal,
    NULL,
    &sHelpInfo_ChapterStatus_EnemyUnits,
    20,
    43,
    MSG_6ED, // "Number of allied units.[.]"
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_EnemyUnits =
{
    &sHelpInfo_ChapterStatus_Funds,
    &sHelpInfo_ChapterStatus_Goal,
    &sHelpInfo_ChapterStatus_AllyUnits,
    &sHelpInfo_ChapterStatus_Leader,
    76,
    43,
    MSG_6EE, // "Number of enemy units."
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_Leader =
{
    &sHelpInfo_ChapterStatus_TimePlayed,
    &sHelpInfo_ChapterStatus_TimePlayed,
    &sHelpInfo_ChapterStatus_Goal,
    NULL,
    136,
    62,
    MSG_6EF, // "Name of the army commander.[.]"
    NULL,
    NULL,
};

struct HelpBoxInfo sHelpInfo_ChapterStatus_TimePlayed =
{
    &sHelpInfo_ChapterStatus_Leader,
    &sHelpInfo_ChapterStatus_Leader,
    &sHelpInfo_ChapterStatus_Funds,
    NULL,
    152,
    127,
    MSG_6F0, // "Total time played."
    NULL,
    NULL,
};

// clang-format on

//! FE8U = 0x0808DCAC
void StartChapterStatusHelpBox(ProcPtr proc)
{
    LoadHelpBoxGfx(OBJ_CHR_ADDR(0x280), 6);
    StartMovingHelpBox(&sHelpInfo_ChapterStatus_AllyUnits, proc);

    return;
}

//! FE8U = 0x0808DCD0
struct Unit * GetFirstValidBlueUnit_Unused(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        return unit;
    }

    return NULL;
}

//! FE8U = 0x0808DCF8
struct Unit * GetEnemyBossUnit(void)
{
    int i;

    struct Unit * unit = NULL;

    switch (gPlaySt.chapterIndex)
    {
    case CHAPTER_E_13:
        unit = GetUnitFromCharId(CHARACTER_AIAS);
        break;

    case CHAPTER_E_15:
        unit = GetUnitFromCharId(CHARACTER_VALTER);
        break;

    case CHAPTER_I_15:
        unit = GetUnitFromCharId(CHARACTER_CAELLACH);
        break;

    case CHAPTER_E_20:
    case CHAPTER_I_20:
        unit = GetUnitFromCharId(CHARACTER_MORVA);
        break;
    }

    if (unit != NULL)
    {
        return unit;
    }

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS))
        {
            continue;
        }

        return unit;
    }

    return NULL;
}

//! FE8U = 0x0808DDC0
int CountEnemyBossUnits(void)
{
    int count;
    int i;

    count = 0;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (!(UNIT_CATTRIBUTES(unit) & CA_BOSS))
        {
            continue;
        }

        count++;
    }

    return count;
}

//! FE8U = 0x0808DDF8
int CountUnitsByFaction(int faction)
{
    int count;
    int i;

    count = 0;

    for (i = faction + 1; i < faction + 0x40; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & US_UNAVAILABLE)
        {
            continue;
        }

        count++;
    }

    return count;
}

//! FE8U = 0x0808DE38
void UpdateStatusFactionSelectorGlow(struct ChapterStatusProc * proc)
{
    u16 * palPtr;
    u16 base;
    int mod;

    base = Pal_MenuStatus_0[0x2F];
    palPtr = &PAL_OBJ_COLOR(7, 14);

    mod = RED_VALUE(proc->timer >> 1);

    proc->timer++;

    if (mod > 16)
    {
        mod = 16 - (mod & 15);
    }

    if (proc->unitIndex != proc->unitIndexPrev)
    {
        proc->unitIndexPrev = proc->unitIndex;
        proc->timer = 0;
    }

    *palPtr = ((((base & RED_MASK) * (16 - mod)) >> 4) & RED_MASK) +
        ((((base & GREEN_MASK) * (16 - mod)) >> 4) & GREEN_MASK) +
        ((((base & BLUE_MASK) * (16 - mod)) >> 4) & BLUE_MASK);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x0808DEBC
const char * SplitObjectiveTextOnNewline(const char * str)
{
    if (str == NULL)
    {
        return NULL;
    }

    if (*str == CHFE_L_X)
    {
        return NULL;
    }

    while (true)
    {
        char c = *str;
        u32 width;

        if (c != CHFE_L_X)
        {
            if (c == CHFE_L_NL)
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
