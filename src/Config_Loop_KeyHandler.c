#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmshop.h"
#include "uiutils.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "statscreen.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "unitlistscreen.h"
#include "uiconfig.h"
#include "sysutil.h"
#include "constants/msg.h"
#include "constants/songs.h"

void Config_Loop_KeyHandler(struct ConfigProc * proc)
{
    int valueChanged = 0;

    switch (proc->moving)
    {
    case CONFIG_MOVE_NONE:
        if (gKeyStatusPtr->newKeys & (B_BUTTON))
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Break(proc);

            break;
        }
        else if (gKeyStatusPtr->newKeys & (A_BUTTON))
        {
            if ((gConfigUiState->source & CONFIG_UI_SOURCE_FROMPREP) && (PrepGetDeployedUnitAmt() == 0))
            {
                break;
            }

            if (gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx] != 0)
            {
                break;
            }

            if (GetGameOption(GAME_OPTION_ANIMATION) != 3)
            {
                break;
            }

            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            proc->loadSoloAnimScreen = true;
            Proc_Break(proc);

            break;
        }
        else if (gKeyStatusPtr->repeatedKeys & (DPAD_UP | DPAD_DOWN))
        {
            if (gKeyStatusPtr->repeatedKeys & (DPAD_UP))
            {
                if (gConfigUiState->selectedOptionIdx != 0)
                {
                    gConfigUiState->selectedOptionIdx--;

                    if ((gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx < 1) && (gConfigUiState->headOptionIdx != 0))
                    {
                        gConfigUiState->headOptionIdx--;

                        PutGameOptionRow(proc, gConfigUiState->selectedOptionIdx - 1, 0);

                        gConfigUiState->bg1YOffset -= 4;
                        proc->moving = CONFIG_MOVE_UP;
                    }

                    valueChanged = true;
                }
            }
            else // if (gKeyStatusPtr->repeatedKeys & (DPAD_DOWN))
            {
                if (gConfigUiState->selectedOptionIdx < gConfigUiState->maxOption - 1)
                {
                    gConfigUiState->selectedOptionIdx++;

                    if ((gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx > 4) &&
                        (gConfigUiState->selectedOptionIdx < gConfigUiState->maxOption - 1))
                    {
                        gConfigUiState->headOptionIdx++;

                        PutGameOptionRow(proc, gConfigUiState->selectedOptionIdx + 1, 320);

                        gConfigUiState->bg1YOffset += 4;
                        proc->moving = CONFIG_MOVE_DOWN;
                    }

                    valueChanged = true;
                }
            }

            if (valueChanged == 1)
            {
                Proc_Start(gProcScr_RedrawConfigHelpText, proc);
                BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

                break;
            }
        }

        if (gKeyStatusPtr->newKeys & (DPAD_LEFT | DPAD_RIGHT))
        {
            if (gGameOptions[gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]].func != NULL)
            {
                gGameOptions[gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]].func(proc);
            }
        }

        break;

    case CONFIG_MOVE_UP:
    case CONFIG_MOVE_UP_FRAME_2:
    case CONFIG_MOVE_UP_FRAME_3:
        // Moving up (duration of 3 frames)

        gConfigUiState->bg1YOffset -= 4;

        if (proc->moving == CONFIG_MOVE_UP_FRAME_3)
        {
            proc->moving = CONFIG_MOVE_NONE;
        }
        else
        {
            proc->moving++;
        }

        break;

    case CONFIG_MOVE_DOWN:
    case CONFIG_MOVE_DOWN_FRAME_2:
    case CONFIG_MOVE_DOWN_FRAME_3:
        // Moving down (duration of 3 frames)

        gConfigUiState->bg1YOffset += 4;

        if (proc->moving == CONFIG_MOVE_DOWN_FRAME_3)
        {
            proc->moving = CONFIG_MOVE_NONE;
        }
        else
        {
            proc->moving++;
        }

        break;
    }

    BG_SetPosition(BG_1, 0, gConfigUiState->bg1YOffset);

    return;
}
