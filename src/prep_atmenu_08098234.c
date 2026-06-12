#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "uichapterstatus.h"
#include "bmio.h"
#include "mu.h"
#include "bmudisp.h"
#include "bm.h"
#include "helpbox.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "eventcall.h"
#include "sysutil.h"
#include "sio.h"
#include "constants/songs.h"

s8 CheckInLinkArena();

void AtMenu_DrawSubmenuOptions(struct ProcAtMenu * proc)
{
    int i, unk2F, tile;

    struct Text *th = &gPrepMainMenuTexts[1];
    int height = Prep_CountSupportMenuItems(proc->unk_2F);
    DrawUiFrame2(3, 5, 9, 2 * height + 2, 1);

    i = 0;
    tile = 0x180;
    for (; i < 4; i++) {
        unk2F = proc->unk_2F >> i;

        if (1 & unk2F) {
            ClearText(th);
            PutDrawText(
                th,
                (void*)TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 0) + tile,
                TEXT_COLOR_SYSTEM_WHITE,
                0, 0, GetStringFromIndex(gUnkData_59[i]));

            th++;
            tile += 0x80;
        }
    }

    BG_EnableSyncByMask(0x3);
}
