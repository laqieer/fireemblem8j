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

struct LATeamListConfig CONST_DATA gSioTeamListConfig_1[] =
{
    [0] =
    {
        .kind = MULTIARENA_LIST_BUILDTEAM,
        .helpTextId = MSG_73C, // "Build a new team."
        .unk_04 = 1,
        .unk_05 = 0,
        .menuTextId = MSG_766, // "Build Team"
        .isValidFunc = CanBuildNewLinkArenaTeam,
    },
    [1] =
    {
        .kind = MULTIARENA_LIST_UNITLIST,
        .helpTextId = MSG_73D, // "View all units on team."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_767, // Unit List"
        .isValidFunc = AnyLinkArenaTeamExists,
    },
    [2] =
    {
        .kind = MULTIARENA_LIST_SWAP,
        .helpTextId = MSG_73E, // "Switch teams."
        .unk_04 = 0,
        .unk_05 = 0,
        .menuTextId = MSG_768, // "Swap"
        .isValidFunc = NULL,
    },
    [3] =
    {
        .kind = MULTIARENA_LIST_DISBAND,
        .helpTextId = MSG_73F, // "Disband teams."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_769, // "Disband"
        .isValidFunc = AnyLinkArenaTeamExists,
    },
    [4] =
    {
        .kind = MULTIARENA_LIST_LINKMENU,
        .helpTextId = MSG_740, // "Return to link menu."
        .unk_04 = 0,
        .unk_05 = 0,
        .menuTextId = MSG_76A, // "Link Menu"
        .isValidFunc = NULL,
    },
    [5] =
    {
        .kind = MULTIARENA_LIST_NONE,
        .helpTextId = 0,
        .unk_04 = 0,
        .unk_05 = 0,
        .menuTextId = 0,
        .isValidFunc = NULL,
    },
};

struct LATeamListConfig CONST_DATA gSioTeamListConfig_2[] =
{
    [0] =
    {
        .kind = MULTIARENA_LIST_SELECTTEAM,
        .helpTextId = MSG_741, // "Select team for battle."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_76C, // "Team"
        .isValidFunc = NULL,
    },
    [1] =
    {
        .kind = MULTIARENA_LIST_UNITLIST,
        .helpTextId = MSG_73D, // "View all units on team."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_767, // "Unit List"
        .isValidFunc = NULL,
    },
    [2] =
    {
        .kind = MULTIARENA_LIST_LINKMENU,
        .helpTextId = MSG_740, // "Return to link menu."
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = MSG_76A, // "Link Menu"
        .isValidFunc = NULL,
    },
    [3] =
    {
        .kind = MULTIARENA_LIST_NONE,
        .helpTextId = 0,
        .unk_04 = 0,
        .unk_05 = 1,
        .menuTextId = 0,
        .isValidFunc = NULL,
    },
};

struct LATeamListConfig * CONST_DATA gSioTeamListConfigLut[] =
{
    gSioTeamListConfig_1,
    gSioTeamListConfig_2,
    gSioTeamListConfig_2,
};

// clang-format on

extern char gUnk_Sio_14[][MULTIARENA_TEAMNAME_SIZE + 1];
extern struct Text gUnk_Sio_7[];

//! FE8U = 0x08043548
void UpdateLinkArenaTeamNamePalettes(struct SioTeamListProc * proc, u8 mode)
{
    int i;

    struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    for (i = 0; i < proc->unk_38; i++)
    {
        if ((gLinkArenaTeamList[i].unk_0f & 0x80) == 0)
        {
            gLinkArenaTeamList[i].unk_10 = ptr[proc->optionIdx].unk_04;
        }
        else
        {
            gLinkArenaTeamList[i].unk_10 = ptr[proc->optionIdx].unk_05;
        }

        gLinkArenaSt.texts[i].chr_position =
            (gLinkArenaSt.texts[i].chr_position & 0xFFF) | ((gLinkArenaTeamList[i].unk_10 & 0xf) << 0xc);
        PutText(&gLinkArenaSt.texts[i], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, i * 2));
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}
