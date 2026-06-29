#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch4Ally_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch4Ally_0_COLM[];
extern const u8 REDA_Ch4Ally_0_EIRIKA[];
extern const u8 REDA_Ch4Ally_0_GILLIAM[];
extern const u8 REDA_Ch4Ally_0_MOULDER[];
extern const u8 REDA_Ch4Ally_0_NEIMI[];
extern const u8 REDA_Ch4Ally_0_ROSS[];
extern const u8 REDA_Ch4Ally_0_SETH[];
extern const u8 REDA_Ch4Ally_0_VANESSA[];
SECTION(".rodata.dat_UnitDef_Ch4Ally_0_ref") struct UnitDefinition UnitDef_Ch4Ally_0[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x5, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Ally_0_EIRIKA, .items={0x09,0x6C,0x00,0x00} },
    { .charIndex=0x5, .classIndex=0x45, .level=0x1, .xPosition=0x5, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Ally_0_MOULDER, .items={0x4B,0x00,0x00,0x00} },
    { .charIndex=0x9, .classIndex=0xD, .level=0x1, .xPosition=0x4, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Ally_0_COLM, .items={0x01,0x6B,0x00,0x00} },
    { .charIndex=0x6, .classIndex=0x48, .level=0x1, .xPosition=0x4, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Ally_0_VANESSA, .items={0x15,0x6C,0x00,0x00} },
    { .charIndex=0x3, .classIndex=0x9, .level=0x1, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Ally_0_GILLIAM, .items={0x14,0x6C,0x00,0x00} },
    { .charIndex=0x8, .classIndex=0x1A, .level=0x1, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Ally_0_NEIMI, .items={0x2D,0x6C,0x00,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x6, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Ally_0_SETH, .items={0x03,0x17,0x6C,0x00} },
    { .charIndex=0x7, .classIndex=0x3D, .level=0x2, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4Ally_0_ROSS, .items={0x2C,0x6C,0x00,0x00} },
    {0},
};
