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

//! FE8U = 0x08033C10
void PrepScreen_StartUnitSwap(struct ProcPrepSallyCursor * proc)
{
    struct APHandle * ap = AP_Create(gUnkData_2, 0);
    ap->tileBase = 0;
    AP_SwitchAnimation(ap, 0);

    proc->ap = ap;
    proc->unk_4A = 2;
    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    StartSubtitleHelp(proc, GetStringFromIndex(0x7F0)); // "Reorder your units.[.]"

    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    PlaySoundEffect(SONG_69);

    return;
}
