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
void SioTeamList_EraseTeam(struct SioTeamListProc * proc);

//! FE8U = 0x08044430
void SioTeamList_EraseTeam_KeyHandler(struct SioTeamListProc * proc)
{
    PutLinkArenaChoiceBannerSprite(96, proc->unk_58 * 8 + 24);

    if (((gKeyStatusPtr->newKeys & DPAD_LEFT) != 0) && (proc->unk_55 == 1))
    {
        proc->unk_55 = 0;
        SioPlaySoundEffect(3);
    }

    if (((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0) && (proc->unk_55 == 0))
    {
        proc->unk_55 = 1;
        SioPlaySoundEffect(3);
    }

    DisplayUiHand(proc->unk_55 * 40 + 112, proc->unk_58 * 8 + 32);

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);

        Proc_End(proc->pSioHoldProc);

        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, proc->unk_58 + 4), 12, 2, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        Proc_Break(proc);
    }
    else if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        Proc_End(proc->pSioHoldProc);

        if (proc->unk_55 == 0)
        {
            SioTeamList_EraseTeam(proc);
            SioPlaySoundEffect(2);
        }
        else
        {
            SioPlaySoundEffect(1);
        }

        TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 15, proc->unk_58 + 4), 12, 2, 0);
        BG_EnableSyncByMask(BG0_SYNC_BIT);

        Proc_Break(proc);
    }

    return;
}
