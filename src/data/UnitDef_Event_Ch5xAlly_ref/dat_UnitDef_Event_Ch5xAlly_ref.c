#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_Ch5xAlly word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern const u8 frontier_df4_banim_b_074_909DE8[];

SECTION(".rodata.dat_UnitDef_Event_Ch5xAlly_ref") struct UnitDefinition UnitDef_Event_Ch5xAlly[] =
{
    { .charIndex=0xF, .classIndex=0x1, .level=0x4, .xPosition=0x1, .yPosition=0x12, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_074_909DE8 + 0x1CC), .items={0x78, 0x16, 0x6D} },
    { .charIndex=0x10, .classIndex=0x5, .level=0x6, .xPosition=0x3, .yPosition=0x12, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_074_909DE8 + 0x1D4), .items={0x3, 0x1C, 0x6C} },
    { .charIndex=0x11, .classIndex=0x5, .level=0x5, .yPosition=0x12, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_074_909DE8 + 0x1DC), .items={0x1, 0x16, 0x6C} },
    { .charIndex=0x42, .classIndex=0x7, .level=0x3, .yPosition=0x12, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_074_909DE8 + 0x1E4), .items={0x4, 0x16, 0x6C} },
    {0},
};
