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

//! FE8U = 0x08033ED4
void PrepScreenProc_StartShopScreen(ProcPtr proc)
{
    struct EventInfo info;
    const struct ChapterEventGroup * evGroup = GetChapterEventDataPointer(gPlaySt.chapterIndex);

    info.listScript = evGroup->locationBasedEvents;
    info.xPos = gBmSt.playerCursor.x;
    info.yPos = gBmSt.playerCursor.y;

    if (!SearchAvailableEvent(&info))
    {
        return;
    }

    switch (info.commandId)
    {
        case TILE_COMMAND_ARMORY:
            StartArmoryScreen(NULL, (u16 *)info.script, proc);
            break;

        case TILE_COMMAND_VENDOR:
            StartVendorScreen(NULL, (u16 *)info.script, proc);
            break;
    }

    return;
}
