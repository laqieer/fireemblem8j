#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_PrologueGradoShamans word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern const u8 REDA_PrologueGradoShamans0[];
extern const u8 REDA_PrologueGradoShamans1[];
extern const u8 REDA_PrologueGradoShamans2[];
extern const u8 REDA_PrologueGradoShamans3[];

SECTION(".rodata.dat_UnitDef_Event_PrologueGradoShamans_ref") struct UnitDefinition UnitDef_Event_PrologueGradoShamans[] =
{
    { .charIndex=0x80, .classIndex=0x2D, .allegiance=0x2, .level=0x1, .xPosition=0x5, .yPosition=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoShamans0) },
    { .charIndex=0x80, .classIndex=0x2D, .allegiance=0x2, .level=0x1, .xPosition=0x5, .yPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoShamans1) },
    { .charIndex=0x80, .classIndex=0x2F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x13, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoShamans2) },
    { .charIndex=0x80, .classIndex=0x2F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x14, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoShamans3) },
    {0},
};
