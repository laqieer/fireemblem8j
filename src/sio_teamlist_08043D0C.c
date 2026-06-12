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

extern struct ProcCmd ProcScr_SioTeamList[];

struct LinkArenaTeamEnt
{
    /* 00 */ char name[MULTIARENA_TEAMNAME_SIZE + 1];
    /* 0F */ u8 unk_0f;
    /* 10 */ u8 unk_10;
    /* 11 */ STRUCT_PAD(0x11, 0x14);
};

extern struct LinkArenaTeamEnt gLinkArenaTeamList[];

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

// Forward declarations

int DrawLinkArenaTeamListMenu(u8, struct SioTeamListProc *);
bool CanBuildNewLinkArenaTeam(void);
bool AnyLinkArenaTeamExists(void);

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

// clang-format off





extern struct LATeamListConfig * CONST_DATA gSioTeamListConfigLut[];

// clang-format on

extern char gUnk_Sio_14[][MULTIARENA_TEAMNAME_SIZE + 1];
extern struct Text gUnk_Sio_7[];

/* prototypes for same-file helpers called by this run */
void SioTeamList_SwapTeams(struct SioTeamListProc * proc);
int AreAllLinkArenaTeamsSelected(void);

//! FE8U = 0x08043D8C
void SioTeamList_0(struct SioTeamListProc * proc)
{
    int unk_40 = proc->unk_40;
    struct SioProc85AAA78 * unk_2C = proc->unk_2c;

    if ((IsKeyInputSequenceComplete(gSioList_SioMain2_1)) && ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0))
    {
        Proc_Goto(proc, 8);
        return;
    }

    unk_2C->unk_44 = 0;
    unk_2C->unk_48 = (proc->unk_40 - proc->unk_48) * 16 + 40;

    if (proc->unk_4c > 0)
    {
        proc->yBg1 -= 4;
        proc->unk_4c--;

        BG_SetPosition(BG_1, 0, proc->yBg1);

        if (proc->pSioHoldProc != NULL)
        {
            MoveSioHold(proc->pSioHoldProc, +4);
        }

        ScrollMultiArenaTeamSprites(+4);

        DisplayUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);
        UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

        return;
    }
    else if (proc->unk_4c < 0)
    {
        proc->yBg1 += 4;
        proc->unk_4c++;

        BG_SetPosition(BG_1, 0, proc->yBg1);

        if (proc->pSioHoldProc != NULL)
        {
            MoveSioHold(proc->pSioHoldProc, -4);
        }

        ScrollMultiArenaTeamSprites(-4);

        DisplayUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);
        UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

        return;
    }

    DisplayUiHand(80, (proc->unk_40 - proc->unk_48) * 16 + 40);

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        switch (proc->selectedOption)
        {
            case MULTIARENA_LIST_BUILDTEAM:
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) != 0)
                {
                    SioPlaySoundEffect(2);
                    gLinkArenaSt.unk_03 = proc->unk_40;
                    Proc_Break(proc);

                    return;
                }

                SioPlaySoundEffect(0);

                break;

            case MULTIARENA_LIST_SELECTTEAM:
                SioPlaySoundEffect(2);
                gLinkArenaSt.unk_03 = gLinkArenaTeamList[unk_40].unk_0f;
                Proc_Break(proc);

                return;

            case MULTIARENA_LIST_UNITLIST:
                // Unit List
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0)
                {
                    SioPlaySoundEffect(2);
                    Proc_Goto(proc, 4);
                    return;
                }

                SioPlaySoundEffect(0);

                break;

            case MULTIARENA_LIST_SWAP:
                if (proc->unk_38 > 1)
                {
                    SioPlaySoundEffect(2);

                    proc->selectedTeam = unk_40;
                    proc->pSioHoldProc =
                        StartSioHold(proc, 80, (proc->selectedTeam - proc->unk_48) * 16 + 40, 0x88, 0x27);

                    if (unk_40 + 1 < proc->unk_38)
                    {
                        gKeyStatusPtr->repeatedKeys |= DPAD_DOWN;
                    }
                    else
                    {
                        gKeyStatusPtr->repeatedKeys |= DPAD_UP;
                    }

                    proc->selectedOption = MULTIARENA_LIST_CONFIRMSWAP;
                }

                break;

            case MULTIARENA_LIST_LINKMENU:
                break;

            case MULTIARENA_LIST_CONFIRMSWAP:
                SioPlaySoundEffect(2);
                SioTeamList_SwapTeams(proc);

                break;

            case MULTIARENA_LIST_DISBAND:
                if ((gLinkArenaTeamList[unk_40].unk_0f & 0x80) == 0)
                {
                    SioPlaySoundEffect(2);
                    proc->pSioHoldProc = StartSioHold(proc, 80, (unk_40 - proc->unk_48) * 16 + 40, 0x88, 0x27);
                    Proc_Goto(proc, 7);
                }
                else
                {
                    SioPlaySoundEffect(0);
                }

                break;

            case MULTIARENA_LIST_8:
                // Team selected (Practice or Battle)
                SioPlaySoundEffect(2);

                SioStrCpy(gLinkArenaTeamList[unk_40].name, gUnk_Sio_14[proc->selectedTeam]);

                gLinkArenaSt.unk_06[proc->selectedTeam] = gLinkArenaTeamList[unk_40].unk_0f;

                ClearText(&gLinkArenaSt.unk_64[proc->selectedTeam]);
                PutDrawTextCentered(
                    &gLinkArenaSt.unk_64[proc->selectedTeam], 1, proc->selectedTeam * 3 + 5,
                    gUnk_Sio_14[proc->selectedTeam], 10);

                proc->unk_5c = AreAllLinkArenaTeamsSelected();

                if ((proc->unk_5c != 0) && (unk_2C->unk_40 == 0))
                {
                    unk_2C->unk_40 = 8;
                }

                proc->unk_44 = 0;

                Proc_Goto(proc, 6);

                break;
        }
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        if (proc->selectedOption == MULTIARENA_LIST_CONFIRMSWAP)
        {
            proc->selectedOption = MULTIARENA_LIST_SWAP;
            Proc_End(proc->pSioHoldProc);
            return;
        }

        if (proc->selectedOption != MULTIARENA_LIST_8)
        {
            Proc_Goto(proc, 2);
        }
        else
        {
            proc->unk_44 = 0;
            Proc_Goto(proc, 6);
        }
    }

    if (((gKeyStatusPtr->newKeys & START_BUTTON) != 0) && (proc->unk_5c != 0))
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        gLinkArenaSt.unk_03 = 0;
        Proc_Goto(proc, 9);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0)
    {
        if ((proc->unk_48 != 0) && ((proc->unk_40 - proc->unk_48) < 2))
        {
            proc->yBg1 -= 4;

            if (proc->pSioHoldProc != NULL)
            {
                MoveSioHold(proc->pSioHoldProc, +4);
            }

            ScrollMultiArenaTeamSprites(+4);

            proc->unk_48--;
            proc->unk_4c = +3;
            proc->unk_40--;

            BG_SetPosition(BG_1, 0, proc->yBg1);

            UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);
        }
        else
        {
            if (proc->unk_40 > 0)
            {
                proc->unk_40--;
            }
        }
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0)
    {
        if (((proc->unk_38 > 6) && ((proc->unk_48 + 6) < proc->unk_38)) && ((proc->unk_40 - proc->unk_48) > 3))
        {
            proc->yBg1 += 4;

            if (proc->pSioHoldProc != 0)
            {
                MoveSioHold(proc->pSioHoldProc, -4);
            }

            ScrollMultiArenaTeamSprites(-4);

            proc->unk_48++;
            proc->unk_4c = -3;
            proc->unk_40++;

            BG_SetPosition(BG_1, 0, proc->yBg1);

            UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);
        }
        else
        {
            if (proc->unk_40 < proc->unk_38 - 1)
            {
                proc->unk_40++;
            }
        }
    }

    if (unk_40 != proc->unk_40)
    {
        SioPlaySoundEffect(3);
    }

    return;
}
