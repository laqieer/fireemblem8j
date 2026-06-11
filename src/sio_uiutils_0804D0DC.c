#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

/**
 * Contains various sprite/palette utility procs used in
 * the Link Arena menus.
 */

//! FE8U = 0x0804C33C
void InitSioBG(void)
{
    // clang-format off
    u16 SioDefaultBgConfig[] =
    {
        0x0000, 0x6000, 0x0000,
        0x0000, 0x6800, 0x0000,
        0x0000, 0x7000, 0x0000,
        0x8000, 0x7800, 0x0000,
    };
    // clang-format on

    SetupBackgrounds(SioDefaultBgConfig);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ReadGameSaveCoreGfx();

    ApplyPalettes(Pal_LinkArenaRankIcons, 0x18, 2);

    return;
}
