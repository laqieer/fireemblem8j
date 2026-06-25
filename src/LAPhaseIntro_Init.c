#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmunit.h"
#include "sio.h"
#include "phasechangefx.h"

//! FE8J = 0x0804E038
void LAPhaseIntro_Init(void)
{
    // clang-format off
    u8 * gUnknown_080DF1F8[] =
    {
        gUnkData_17,
        gUnkData_18,
        gUnkData_19,
        gUnkData_20,
    };

    u16 * gUnknown_080DF208[] =
    {
        gUnkData_21,
        gUnkData_23,
        gUnkData_22,
        gUnkData_24,
    };

    u16 * gUnknown_080DF218[] =
    {
        Pal_PhaseChangePlayer,
        Pal_PhaseChangeOther,
        Pal_PhaseChangeEnemy,
        Pal_PhaseChange_0,
    };
    // clang-format on

    Decompress(Img_PhaseChangeUnk, OBJ_CHR_ADDR(0x200));
    Decompress(Img_PhaseChangeSquares, BG_CHR_ADDR(0x100));
    Decompress(gUnkData_16, BG_CHR_ADDR(0x140));

    Decompress(gUnknown_080DF1F8[gPlaySt.faction], gGenericBuffer);
    Copy2dChr(gGenericBuffer, BG_CHR_ADDR(0x140), 2, 3);

    ApplyPalette(gUnknown_080DF208[gPlaySt.faction], 5);
    ApplyPalette(gUnknown_080DF218[gPlaySt.faction], 0x12);

    gUnk_49 = gPlaySt.faction;
    gPlaySt.faction = FACTION_BLUE;

    return;
}
