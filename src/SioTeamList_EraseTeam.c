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

struct LinkArenaTeamEnt {
    /* 00 */ char name[15];
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

extern struct LATeamListConfig * gSioTeamListConfigLut[];

//! FE8U = 0x080435F0
void SioTeamList_EraseTeam(struct SioTeamListProc * proc)
{
    int team = proc->unk_40;

    struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    struct Unit * unit = GetUnit(team * 5 + 1);

    WipeMultiArenaSaveTeam(gLinkArenaTeamList[team].unk_0f & 0x7f);
    ReadMultiArenaSaveTeam(team, unit, gLinkArenaTeamList[team].name);

    SioStrCpy(GetStringFromIndex(0x61), gLinkArenaTeamList[team].name); // "NO DATA"

    gLinkArenaTeamList[team].unk_10 = ptr[proc->optionIdx].unk_05;
    gLinkArenaTeamList[team].unk_0f = team | 0x80;
    DrawLinkArenaTeamName(team);

    if (!AnyLinkArenaTeamExists())
    {
        DrawLinkArenaTeamListMenu(gLinkArenaSt.unk_00, proc);
        Proc_Goto(proc, 2);
    }
    else if (proc->validOptions[0] == 0)
    {
        DrawLinkArenaTeamListMenu(gLinkArenaSt.unk_00, proc);
    }

    UpdateLinkArenaMenuScrollBar(proc->unk_38, proc->yBg1 + 40);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}
