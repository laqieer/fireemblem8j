#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from the de-pointered UnitDef_Event_PrologueGradoCavalry word stream (axis #6 editability,
 * fe8u events_udefs.c parity). Each 20-byte struct UnitDefinition entry is
 * decoded per include/bmunit.h; the redas reinforcement pointer is kept as a
 * relocatable symbol reference so the ROM stays SHIFTABLE. Byte-identical to
 * baserom (gated by `make compare`). */

extern const u8 REDA_PrologueGradoCavalry0[];
extern const u8 REDA_PrologueGradoCavalry1[];
extern const u8 REDA_PrologueGradoCavalry2[];
extern const u8 REDA_PrologueGradoCavalry3[];
extern const u8 REDA_PrologueGradoCavalry4[];
extern const u8 REDA_PrologueGradoCavalry5[];

SECTION(".rodata.dat_UnitDef_Event_PrologueGradoCavalry_ref") struct UnitDefinition UnitDef_Event_PrologueGradoCavalry[] =
{
    { .charIndex=0x83, .classIndex=0x35, .allegiance=0x2, .level=0x1, .xPosition=0xA, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoCavalry0) },
    { .charIndex=0x83, .classIndex=0x35, .allegiance=0x2, .level=0x1, .xPosition=0x10, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoCavalry1) },
    { .charIndex=0x84, .classIndex=0x7, .allegiance=0x2, .level=0x1, .xPosition=0xA, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoCavalry2) },
    { .charIndex=0x84, .classIndex=0x7, .allegiance=0x2, .level=0x1, .xPosition=0x10, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoCavalry3) },
    { .charIndex=0x85, .classIndex=0x29, .allegiance=0x2, .level=0x1, .xPosition=0xA, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoCavalry4) },
    { .charIndex=0x85, .classIndex=0x29, .allegiance=0x2, .level=0x1, .xPosition=0x10, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_PrologueGradoCavalry5) },
    {0},
};
