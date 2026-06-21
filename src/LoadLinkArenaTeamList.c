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

//! FE8U = 0x080433C0
int LoadLinkArenaTeamList(int activeOption, u8 mode)
{
    int i;
    int count = 0;
    char buf[16];

    struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    InitUnits();

    switch (mode)
    {
        case 0:
            for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
            {
                if (ReadMultiArenaSaveTeamName(i, gLinkArenaTeamList[i].name) == 1)
                {
                    gLinkArenaTeamList[i].unk_10 = ptr[activeOption].unk_04;
                    gLinkArenaTeamList[i].unk_0f = i;
                }
                else
                {
                    SioStrCpy(GetStringFromIndex(0x61), gLinkArenaTeamList[i].name); // "NO DATA"
                    gLinkArenaTeamList[i].unk_10 = ptr[activeOption].unk_05;
                    gLinkArenaTeamList[i].unk_0f = i | 0x80;
                }

                ReadMultiArenaSaveTeam(i, GetUnit(i * 5 + 1), buf);
            }

            count = i;

            break;

        case 1:
        case 2:
            for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
            {
                if (ReadMultiArenaSaveTeamName(i, gLinkArenaTeamList[count].name) == 1)
                {
                    gLinkArenaTeamList[count].unk_10 = ptr[activeOption].unk_04;
                    gLinkArenaTeamList[count].unk_0f = i;
                    ReadMultiArenaSaveTeam(i, GetUnit(count * 5 + 1), buf);

                    count++;
                }
            }

            break;
    }

    return count;
}
