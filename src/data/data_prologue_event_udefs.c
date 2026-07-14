#include "global.h"
#include "bmunit.h"

/* 0x0890814C..0x089081D8 (140 B): prologue reinforcement/UnitDefinition data
 * that follows the world-map Events_WM_Beginning/ChapterIntro lookup tail
 * (src/data/data_chapter_asset_table.c) and precedes DifficultyMenu/SysHandCtrl
 * data (0x0890894C+, out of scope here). Sibling REDA carves at 0x08908228
 * (src/data/data/data_08908228.c) and 0x08908354 (data_08908354.s) establish
 * the exact local convention this follows: REDA reinforcement records are kept
 * as raw `u32[]` word streams (data word + 0xFFFF-pattern terminator), not the
 * generic bitfield `struct REDA` in include/muctrl.h (untested for byte-exact
 * packing under agbcc); `struct UnitDefinition` (include/bmunit.h, 20 B/entry,
 * BITPACKED) is used directly since its exact layout is already proven byte-
 * exact by UnitDef_Event_PrologueEnemy_ref.c and UnitDef_Event_PrologueGradoRoyals.
 *
 * Consumers (EventScr_Prologue_BeginningScene_ref.c, PrologueEvents_ref.c,
 * UnitDef_Event_PrologueEnemy_ref.c, frontier_df4_banim_b.c gap73) previously
 * reached these bytes via frontier_df4_banim_b_073_907F78 + 0x1D4/0x204/0x20C/
 * 0x214/0x21C/0x224 base+offset arithmetic; repointed to these named symbols. */

/* [0x0890814C,0x08908178): UnitDef_Event_PrologueAlly[0].redas, redaCount=6. */
u32 REDAs_PrologueAlly1[] __attribute__((section(".data.prologue_event_udefs"))) = {
    0x0001820D, 0x0000FFFF,
    0x0001820A, 0x0000FFFF,
    0x000181CA, 0x0000FFFF,
    0x000181C9, 0x0000FFFF,
    0x00018149, 0x0000FFFF,
    0x00018148, 0x0000FFFF,
};

/* [0x0890817C,0x08908184): UnitDef_Event_PrologueAlly[1].redas, redaCount=1. */
u32 REDAs_PrologueAlly2[] __attribute__((section(".data.prologue_event_udefs"))) = {
    0x02010149, 0x0000FFFF,
};

/* [0x08908184,0x0890818C): matches frontier_df4_banim_b_073_907F78+0x20C, used by
 * UnitDef_Event_PrologueEnemy[0].redas (redaCount=1). */
u32 REDAs_PrologueEnemy1[] __attribute__((section(".data.prologue_event_udefs"))) = {
    0x0000020A, 0x0000FFFF,
};

/* [0x0890818C,0x08908194): matches +0x214, UnitDef_Event_PrologueEnemy[1].redas. */
u32 REDAs_PrologueEnemy2[] __attribute__((section(".data.prologue_event_udefs"))) = {
    0x00000188, 0x0000FFFF,
};

/* [0x08908194,0x0890819C): matches +0x21C, UnitDef_Event_PrologueEnemy[2].redas.
 * Terminator word is 0x0010FFFF (not the plain 0x0000FFFF pattern used above),
 * matching the existing REDA_PrologueGradoCavalry2/3 sibling precedent of a
 * nonzero high half on some terminators. */
u32 REDAs_PrologueEnemy3[] __attribute__((section(".data.prologue_event_udefs"))) = {
    0x00000189, 0x0010FFFF,
};

/* [0x0890819C,0x089081D8): matches +0x224 (EventScr_Prologue_BeginningScene's
 * LOAD1 operand and PrologueEvents__shift's duplicate entry both target this
 * exact address). Two real ally units (both level 1, prologue tutorial allies)
 * plus the standard all-zero UnitDefinition terminator entry. */
struct UnitDefinition UnitDef_Event_PrologueAlly[] __attribute__((section(".data.prologue_event_udefs"))) =
{
    { .charIndex=0x02, .classIndex=0x07, .level=0x1, .xPosition=0xD, .yPosition=0x9,
      .redaCount=0x6, .redas=REDAs_PrologueAlly1, .items={0x03, 0x17, 0x6C}, .ai={0} },
    { .charIndex=0x01, .classIndex=0x02, .level=0x1, .xPosition=0x8, .yPosition=0x5,
      .redaCount=0x1, .redas=REDAs_PrologueAlly2, .items={0x6C}, .ai={0} },
    {0},
};
