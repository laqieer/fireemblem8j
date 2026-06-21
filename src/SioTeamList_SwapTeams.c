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

#define MULTIARENA_LIST_SWAP 4

struct LinkArenaTeamEnt {
    /* 00 */ char name[15];
    /* 0F */ u8 unk_0f;
    /* 10 */ u8 unk_10;
    /* 11 */ STRUCT_PAD(0x11, 0x14);
};

extern struct LinkArenaTeamEnt gLinkArenaTeamList[];


//! FE8U = 0x080436C0
void SioTeamList_SwapTeams(struct SioTeamListProc * proc)
{
    int tmp;

    int teamB = proc->unk_40;
    int teamA = proc->selectedTeam;

    SwapMultiArenaSaveTeams(gLinkArenaTeamList[teamA].unk_0f & 0x7f, gLinkArenaTeamList[teamB].unk_0f & 0x7f);

    tmp = gLinkArenaTeamList[teamA].unk_10;
    gLinkArenaTeamList[teamA].unk_10 = gLinkArenaTeamList[teamB].unk_10;
    gLinkArenaTeamList[teamB].unk_10 = tmp;

    if (ReadMultiArenaSaveTeam(teamA, GetUnit(teamA * 5 + 1), gLinkArenaTeamList[teamA].name) == 0)
    {
        SioStrCpy(GetStringFromIndex(0x61), gLinkArenaTeamList[teamA].name); // "NO DATA"
        gLinkArenaTeamList[teamA].unk_0f = teamA | 0x80;
    }
    else
    {
        gLinkArenaTeamList[teamA].unk_0f = teamA;
    }

    if (ReadMultiArenaSaveTeam(teamB, GetUnit(teamB * 5 + 1), gLinkArenaTeamList[teamB].name) == 0)
    {
        SioStrCpy(GetStringFromIndex(0x61), gLinkArenaTeamList[teamB].name); // "NO DATA"
        gLinkArenaTeamList[teamB].unk_0f = teamB | 0x80;
    }
    else
    {
        gLinkArenaTeamList[teamB].unk_0f = teamB;
    }

    DrawLinkArenaTeamName(teamB);
    DrawLinkArenaTeamName(teamA);

    UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

    Proc_End(proc->pSioHoldProc);

    proc->selectedOption = MULTIARENA_LIST_SWAP;

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}
