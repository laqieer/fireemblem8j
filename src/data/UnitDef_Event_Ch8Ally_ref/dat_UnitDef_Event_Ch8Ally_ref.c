#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_Ch8Ally word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern const u8 frontier_df4_banim_b_076_90B4DC[];

SECTION(".rodata.dat_UnitDef_Event_Ch8Ally_ref") struct UnitDefinition UnitDef_Event_Ch8Ally[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x8, .xPosition=0x13, .yPosition=0x14, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x21C), .items={0x9, 0x6C} },
    { .charIndex=0x5, .classIndex=0x45, .level=0x3, .xPosition=0x14, .yPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x224), .items={0x4B} },
    { .charIndex=0x9, .classIndex=0xD, .level=0x2, .xPosition=0x13, .yPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x22C), .items={0x1, 0x6B} },
    { .charIndex=0x6, .classIndex=0x48, .level=0x2, .xPosition=0x13, .yPosition=0x12, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x234), .items={0x15, 0x6C} },
    { .charIndex=0x3, .classIndex=0x9, .level=0x5, .xPosition=0x14, .yPosition=0x14, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x23C), .items={0x14, 0x6C} },
    { .charIndex=0x4, .classIndex=0x5, .level=0x1, .xPosition=0x14, .yPosition=0x12, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x244), .items={0x1, 0x14, 0x6C} },
    { .charIndex=0x7, .classIndex=0x3D, .level=0x1, .xPosition=0x14, .yPosition=0x11, .items={0x2C} },
    { .charIndex=0xA, .classIndex=0x3F, .level=0x4, .xPosition=0x13, .yPosition=0x12, .items={0x1F} },
    { .charIndex=0x13, .classIndex=0x44, .level=0x1, .xPosition=0x13, .yPosition=0x14, .items={0x3F} },
    {0},
};
