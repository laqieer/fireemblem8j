#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_PrologueEnemy word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern const u32 REDAs_PrologueEnemy1[];
extern const u32 REDAs_PrologueEnemy2[];
extern const u32 REDAs_PrologueEnemy3[];

SECTION(".rodata.dat_UnitDef_Event_PrologueEnemy_ref") struct UnitDefinition UnitDef_Event_PrologueEnemy[] =
{
    { .charIndex=0x68, .classIndex=0x3F, .allegiance=0x2, .level=0x4, .xPosition=0xE, .yPosition=0x8, .redaCount=0x1, .redas=(const struct REDA *)REDAs_PrologueEnemy1, .items={0x1F}, .ai={0x6, 0x3} },
    { .charIndex=0x82, .classIndex=0x3F, .allegiance=0x2, .level=0x1, .xPosition=0xE, .yPosition=0x7, .redaCount=0x1, .redas=(const struct REDA *)REDAs_PrologueEnemy2, .items={0x1F}, .ai={0x0, 0xA} },
    { .charIndex=0x80, .classIndex=0x3F, .allegiance=0x2, .level=0x2, .xPosition=0xE, .yPosition=0x7, .redaCount=0x1, .redas=(const struct REDA *)REDAs_PrologueEnemy3, .items={0x1F}, .ai={0x0, 0x12, 0x2} },
    {0},
};
