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







// clang-format on

extern char gUnk_Sio_14[][MULTIARENA_TEAMNAME_SIZE + 1];
extern struct Text gUnk_Sio_7[];

//! FE8U = 0x080434B4
void DrawLinkArenaTeamName(int idx)
{
    ClearText(&gLinkArenaSt.texts[idx]);
    Text_SetColor(&gLinkArenaSt.texts[idx], TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(&gLinkArenaSt.texts[idx], gLinkArenaTeamList[idx].name);

    gLinkArenaSt.texts[idx].chr_position =
        (gLinkArenaSt.texts[idx].chr_position & 0xFFF) | ((gLinkArenaTeamList[idx].unk_10 & 0xf) << 0xc);

    PutText(&gLinkArenaSt.texts[idx], TILEMAP_LOCATED(gBG1TilemapBuffer, 11, idx * 2));

    return;
}
