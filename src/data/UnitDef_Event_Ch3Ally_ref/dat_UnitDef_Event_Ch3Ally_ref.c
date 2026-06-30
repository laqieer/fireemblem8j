#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_Ch3Ally word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern const u8 data_08908958[];

SECTION(".rodata.dat_UnitDef_Event_Ch3Ally_ref") struct UnitDefinition UnitDef_Event_Ch3Ally[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x104), .items={0x9, 0x6C, 0x6C} },
    { .charIndex=0x5, .classIndex=0x45, .level=0x1, .yPosition=0xC, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x10C), .items={0x4B} },
    { .charIndex=0x7, .classIndex=0x3D, .level=0x1, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x114), .items={0x2C, 0x6C} },
    { .charIndex=0x6, .classIndex=0x48, .level=0x2, .yPosition=0xC, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x11C), .items={0x15, 0x6C} },
    { .charIndex=0x3, .classIndex=0x9, .level=0x5, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x124), .items={0x14} },
    { .charIndex=0x4, .classIndex=0x5, .level=0x1, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x12C), .items={0x1, 0x14} },
    { .charIndex=0x8, .classIndex=0x1A, .level=0x1, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x134), .items={0x2D, 0x6C} },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .yPosition=0xC, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x13C), .items={0x3, 0x17, 0x6C} },
    { .charIndex=0xA, .classIndex=0x3F, .level=0x4, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_08908958 + 0x144), .items={0x1F} },
    {0},
};
