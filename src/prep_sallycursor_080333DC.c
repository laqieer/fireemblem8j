#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "types.h"
#include "functions.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmcontainer.h"
#include "chapterdata.h"
#include "bmdebug.h"
#include "statscreen.h"
#include "ap.h"
#include "proc.h"
#include "eventinfo.h"
#include "bmdifficulty.h"
#include "playerphase.h"
#include "minimap.h"
#include "uichapterstatus.h"
#include "player_interface.h"
#include "bb.h"
#include "bmshop.h"
#include "uiconfig.h"
#include "helpbox.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "muctrl.h"
#include "menu_def.h"
#include "worldmap.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bmsave.h"
#include "bmlib.h"
#include "eventcall.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/terrains.h"
#include "constants/songs.h"

// TODO: Implicit declaration?
int CanShowUnitStatScreen(struct Unit * unit);
int CheckInLinkArena(void);

// clang-format off





//! FE8U = 0x080334CC
void PrepScreenProc_DimMapImmediate(void)
{
    ArchiveCurrentPalettes();
    WriteFadedPaletteFromArchive(0xC0, 0xC0, 0xC0, 0xFF00FFF0);
    return;
}

//! FE8U = 0x080334E8
void PrepScreenProc_StartBrightenMap(ProcPtr proc)
{
    StartMapPaletteBrightnessFade(0xC0, 0xC0, 0xC0, 0x100, 0x100, 0x100, 0xFF00FFF0, 0x40, proc);
    return;
}

//! FE8U = 0x08033514
void PrepScreenProc_StartDimMap(ProcPtr proc)
{
    ArchiveCurrentPalettes();
    StartMapPaletteBrightnessFade(0x100, 0x100, 0x100, 0xC0, 0xC0, 0xC0, 0xFF00FFF0, 0x40, proc);
    return;
}
