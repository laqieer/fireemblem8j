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
extern char gUnk_Sio_14[][15];

//! FE8U = 0x080437C0
int DrawLinkArenaTeamListMenu(u8 mode, struct SioTeamListProc * proc)
{
    int color;

    int i = 0;
    struct LATeamListConfig * ptr = gSioTeamListConfigLut[mode];

    if (mode == 1)
    {
        for (i = 0; i < gLinkArenaSt.unk_05 + 2; i++)
        {
            SioStrCpy(GetStringFromIndex(0x58), gUnk_Sio_14[i]); // "Empty"
            ClearText(&gLinkArenaSt.unk_64[i]);
            PutDrawTextCentered(&gLinkArenaSt.unk_64[i], 1, i * 3 + 5, gUnk_Sio_14[i], 10);
        }

        return gLinkArenaSt.unk_05 + 2;
    }

    while (1)
    {
        if (ptr[i].menuTextId == 0)
        {
            return i;
        }

        proc->validOptions[i] = 1;
        color = TEXT_COLOR_SYSTEM_WHITE;

        if (ptr[i].isValidFunc != NULL && !ptr[i].isValidFunc())
        {
            proc->validOptions[i] = 0;
            color = TEXT_COLOR_SYSTEM_GRAY;
        }

        ClearText(&gUnk_Sio_7[i]);
        Text_SetColor(&gUnk_Sio_7[i], color);
        PutDrawTextCentered(&gUnk_Sio_7[i], 1, i * 2 + 5, GetStringFromIndex(ptr[i].menuTextId), 7);

        i++;
    }
}
