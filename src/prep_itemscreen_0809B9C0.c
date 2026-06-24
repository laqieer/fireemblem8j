#include "global.h"

#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "sysutil.h"

/* JP prep_itemscreen TU treats CheckInLinkArena as returning int (no sub-word
 * sign-extension at the test sites), matching the ROM; sio.h's bool prototype
 * would force an extra lsls. (fe8u header notes it is "defined as different
 * types by files".) */
int CheckInLinkArena(void);
#include "constants/songs.h"
#include "constants/msg.h"
#include "prepscreen.h"

//! JP = 0x0809B9C0
void PrepItem_CommandMenuLoop(struct PrepItemScreenProc * proc)
{
    int previous = proc->popupPromptIdx;

    if (proc->helpboxActiveIdx == 0xff)
    {
        if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            proc->helpboxActiveIdx = proc->popupPromptIdx;

            if (gGMData.state.bits.state_0)
            {
                StartHelpBox(
                    (proc->popupPromptIdx & 1) * 32 + 136, (proc->popupPromptIdx >> 1) * 16 + 84,
                    gHelpTextIds_GMapItemScreen[proc->popupPromptIdx]);
                return;
            }
            else
            {
                StartHelpBox(
                    (proc->popupPromptIdx & 1) * 32 + 136, (proc->popupPromptIdx >> 1) * 16 + 84,
                    gHelpTextIds_PrepItemScreen[proc->popupPromptIdx]);
                return;
            }
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            switch (proc->popupPromptIdx)
            {
            case 0:
                if (PrepGetUnitAmount() < 2)
                {
                    PlaySoundEffect(SONG_6C);
                }
                else
                {
                    Proc_Goto(proc, 4);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                }

                break;

            case 1:
                if (PrepGetUnitAmount() < 2)
                {
                    PlaySoundEffect(SONG_6C);
                }
                else
                {
                    Proc_Goto(proc, 8);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                }

                break;

            case 2:
                if (!CanUnitPrepScreenUse(GetUnitFromPrepList(proc->selectedUnitIdx)))
                {
                    PlaySoundEffect(SONG_6C);
                }
                else
                {
                    Proc_Goto(proc, 9);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                }

                break;

            case 3:
                if (CheckInLinkArena() && (!(GetUnitFromPrepList(proc->selectedUnitIdx)->state & US_NOT_DEPLOYED)))
                {
                    StartPrepErrorHelpbox(
                        -1, -1, MSG_6FC, proc);
                    return;
                }

                if (proc->hasConvoyAccess)
                {
                    if (PrepItemScreen_GiveAll(GetUnitFromPrepList(proc->selectedUnitIdx)) != 0)
                    {
                        PrepItem_DrawCommandMenuText(
                            proc, TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 9),
                            GetUnitFromPrepList(proc->selectedUnitIdx));
                        PrepItemScreen_DrawUnitItems(
                            &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9),
                            GetUnitFromPrepList(proc->selectedUnitIdx), 0);

                        BG_EnableSyncByMask(BG0_SYNC_BIT);

                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        return;
                    }
                }

                PlaySoundEffect(SONG_6C);
                break;

            case 4:
                if (!proc->hasConvoyAccess)
                {
                    PlaySoundEffect(SONG_6C);
                }
                else
                {
                    Proc_Goto(proc, 10);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                }

                break;

            case 5:
                if (gGMData.state.bits.state_0)
                {
                    if (proc->hasConvoyAccess)
                    {
                        int itemCount = GetUnitItemCount(GetUnitFromPrepList(proc->selectedUnitIdx));
                        if ((itemCount > 0) && (!CheckInLinkArena()))
                        {
                            Proc_Goto(proc, 11);
                            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                            return;
                        }
                    }
                }
                else
                {
                    if (!CheckInLinkArena())
                    {
                        Proc_Goto(proc, 12);
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        return;
                    }
                }

                PlaySoundEffect(SONG_6C);
                break;

            default:
                PlaySoundEffect(SONG_6C);
                break;
            }

            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            proc->hoverUnitIdx = proc->selectedUnitIdx;
            proc->selectedUnitIdx = 0xff;
            ClearUiCursorHandConfig(0);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Goto(proc, 0);
            return;
        }
    }
    else if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        proc->helpboxActiveIdx = 0xff;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT)
    {
        if ((proc->popupPromptIdx & 1) != 0)
        {
            proc->popupPromptIdx--;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_LEFT)
        {
            proc->popupPromptIdx++;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT)
    {
        if ((proc->popupPromptIdx & 1) == 0)
        {
            proc->popupPromptIdx++;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
        {
            proc->popupPromptIdx--;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->popupPromptIdx >= 2)
        {
            proc->popupPromptIdx -= 2;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_UP)
        {
            proc->popupPromptIdx += 4;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->popupPromptIdx < 4)
        {
            proc->popupPromptIdx += 2;
        }
        else if (gKeyStatusPtr->newKeys & DPAD_DOWN)
        {
            proc->popupPromptIdx -= 4;
        }
    }

    if (previous == proc->popupPromptIdx)
    {
        return;
    }

    PlaySoundEffect(SONG_65);

    ShowSysHandCursor((proc->popupPromptIdx & 1) * 38 + 144, (proc->popupPromptIdx >> 1) * 16 + 84, 3, 0x20 * CHR_SIZE);

    if (proc->helpboxActiveIdx == 0xff)
    {
        return;
    }

    if (gGMData.state.bits.state_0)
    {
        StartHelpBox(
            (proc->popupPromptIdx & 1) * 38 + 144, (proc->popupPromptIdx >> 1) * 16 + 84,
            gHelpTextIds_GMapItemScreen[proc->popupPromptIdx]);
    }
    else
    {
        StartHelpBox(
            (proc->popupPromptIdx & 1) * 38 + 144, (proc->popupPromptIdx >> 1) * 16 + 84,
            gHelpTextIds_PrepItemScreen[proc->popupPromptIdx]);
    }

    return;
}
