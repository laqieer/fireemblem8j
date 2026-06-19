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
struct LinkArenaTeamEnt
{
    /* 00 */ char name[MULTIARENA_TEAMNAME_SIZE + 1];
    /* 0F */ u8 unk_0f;
    /* 10 */ u8 unk_10;
    /* 11 */ STRUCT_PAD(0x11, 0x14);
};
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
extern struct LATeamListConfig *  gSioTeamListConfigLut[];

u16 GetLATeamListHelpTextId(struct SioTeamListProc * proc)
{
    struct LATeamListConfig * ptr = gSioTeamListConfigLut[gLinkArenaSt.unk_00];

    if (gLinkArenaSt.unk_00 != 1)
    {
        return ptr[proc->optionIdx].helpTextId;
    }

    if (proc->optionIdx == 0)
    {
        return 0x6cd; // "Select your own team."
    }
    else
    {
        return 0x6ce; // "Select team to battle."
    }
}
