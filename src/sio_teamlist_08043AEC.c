#include "global.h"
#include "bmunit.h"
#include "bmsave.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "unitlistscreen.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/msg.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
enum
{
    MULTIARENA_LIST_NONE = 0,
    MULTIARENA_LIST_BUILDTEAM = 1,
    MULTIARENA_LIST_SELECTTEAM = 2,
    MULTIARENA_LIST_UNITLIST = 3,
    MULTIARENA_LIST_SWAP = 4,
    MULTIARENA_LIST_CONFIRMSWAP = 5,
    MULTIARENA_LIST_DISBAND = 6,
    MULTIARENA_LIST_LINKMENU = 7,
    MULTIARENA_LIST_8 = 8,
};
extern struct LATeamListConfig * gSioTeamListConfigLut[];

struct LATeamListConfig
{
    /* 00 */ u8 kind;
    /* 01 */ STRUCT_PAD(0x01, 0x02);
    /* 02 */ u16 helpTextId; // Text that displays across the bottom
    /* 04 */ u8 unk_04;
    /* 05 */ u8 unk_05;
    /* 06 */ STRUCT_PAD(0x06, 0x08);
    /* 08 */ int menuTextId;
    /* 0C */ bool (*isValidFunc)(void);
};

void SioTeamList_Main_HandleDPadInput(int * selection, u8 max, u8 min, u8 total);

//! FE8U = 0x08043B6C
void SioTeamList_Loop_MainKeyHandler(struct SioTeamListProc * proc)
{
    int previous = proc->optionIdx;

    struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    struct SioProc85AAA78 * unk_2C = proc->unk_2c;
    unk_2C->unk_44 = 1;
    unk_2C->unk_48 = -1;

    SioTeamList_Main_HandleDPadInput(&proc->optionIdx, proc->numActiveOptions - 1, 0, proc->numActiveOptions);

    if (previous != proc->optionIdx)
    {
        SioPlaySoundEffect(3);

        unk_2C->unk_3a[previous] = 0;
        unk_2C->unk_3a[proc->optionIdx] = 1;

        UpdateLinkArenaTeamNamePalettes(proc, gLinkArenaSt.unk_00);
        PutSioText(GetLATeamListHelpTextId(proc), 1);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        if (gLinkArenaSt.unk_00 != 1)
        {
            if (proc->validOptions[proc->optionIdx] != 0)
            {
                proc->selectedOption = ptr[proc->optionIdx].kind;

                if (proc->selectedOption == MULTIARENA_LIST_LINKMENU)
                {
                    SioPlaySoundEffect(1);
                    Proc_Goto(proc, 9);
                    gLinkArenaSt.unk_03 = 0xff;
                    return;
                }

                SioPlaySoundEffect(2);

                Proc_Break(proc);
            }
            else
            {
                SioPlaySoundEffect(0);
            }
        }
        else
        {
            SioPlaySoundEffect(2);

            proc->selectedOption = MULTIARENA_LIST_8;
            proc->selectedTeam = proc->optionIdx;
            proc->unk_44 = 0;

            Proc_Goto(proc, 5);

            return;
        }
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        Proc_Goto(proc, 9);
        gLinkArenaSt.unk_03 = 0xff;
    }

    if (((gKeyStatusPtr->newKeys & START_BUTTON) != 0) && (proc->unk_5c != 0))
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        gLinkArenaSt.unk_03 = 0;
        Proc_Goto(proc, 9);
    }

    return;
}
