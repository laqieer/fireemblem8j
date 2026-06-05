

#include "global.h"

#include "hardware.h"
#include "bmsave.h"
#include "bmlib.h"
#include "fontgrp.h"

#include "constants/msg.h"

#include "sio_core.h"
#include "sio.h"

//! FE8U = 0x0804766C
void LoadLinkArenaRuleSettings(u8 * buf)
{
    buf[0] = gLinkArenaSt.unk_ec.unk_0_0;
    buf[1] = gLinkArenaSt.unk_ec.unk_0_1;
    buf[2] = gLinkArenaSt.unk_ec.unk_0_2;

    return;
}

//! FE8U = 0x0804768C
void SaveLinkArenaRuleSettings(u8 * buf)
{
    struct LinkArenaStMaybe * las = &gLinkArenaSt;
    struct LinkArenaStMaybe_ec * unk_ec = &las->unk_ec;

    { u32 r4 = 1; ++r4; --r4; }

    unk_ec->unk_0_0 = buf[0] % 2;
    unk_ec->unk_0_1 = buf[1] % 2;
    unk_ec->unk_0_2 = buf[2] % 2;

    return;
}

//! FE8U = 0x080476CC
void SioRuleSettings_DrawRuleOptions(int idx, int state)
{
    int i;

    // clang-format off

    const int textColorLut[2] =
    {
        TEXT_COLOR_SYSTEM_BLUE,
        TEXT_COLOR_SYSTEM_GRAY,
    };

    // clang-format on

    for (i = 0; i < 2; i++)
    {
        ClearText(&gUnk_Sio_7[(idx << 1) + i]);
        Text_SetColor(&gUnk_Sio_7[(idx << 1) + i], textColorLut[(state + i) & 1]);
        Text_DrawString(&gUnk_Sio_7[(idx << 1) + i], GetStringFromIndex(gLinkArenaRuleData[idx].optionTextId[i]));
        PutText(
            &gUnk_Sio_7[(idx << 1) + i],
            TILEMAP_LOCATED(gBG0TilemapBuffer, gLinkArenaRuleData[idx].xPos[i], 6 + idx * 3));
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
