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

//! FE8U = 0x08033C90
void PrepScreen_UnitSwapIdle(struct ProcPrepSallyCursor * proc)
{
    int r7 = gMapRangeSigned[gBmSt.playerCursor.y][gBmSt.playerCursor.x];
    u32 xLoc;
    u32 yLoc;

    if (GetPlayerSelectKind(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])) == PLAYER_SELECT_4)
    {
        r7 = 0;
    }

    HandlePlayerCursorMovement();

    xLoc = (proc->xCursor * 16) - gBmSt.camera.x;
    yLoc = (proc->yCursor * 16) - gBmSt.camera.y;

    if (((xLoc + 16) <= DISPLAY_WIDTH + 16) && ((yLoc + 32) <= DISPLAY_HEIGHT + 32))
    {
        PutSprite(4, xLoc, yLoc - 12, gObject_16x16, OAM2_CHR(0x6));
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (r7)
        {
            AP_Delete(proc->ap);
            Proc_Break(proc);
            EndSubtitleHelp();

            return;
        }

        PlaySoundEffect(SONG_6C);

        return;
    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        AP_Delete(proc->ap);
        Proc_Goto(proc, PL_SALLYCURSOR_CANCEL_SWAP);
        EndSubtitleHelp();
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        return;
    }

    if (r7 != proc->unk_4A)
    {
        AP_SwitchAnimation(proc->ap, r7 == 0 ? 1 : 0);
    }

    AP_Update(proc->ap, gBmSt.playerCursorDisplay.x - gBmSt.camera.x, gBmSt.playerCursorDisplay.y - gBmSt.camera.y);

    proc->unk_4A = r7;

    return;
}
