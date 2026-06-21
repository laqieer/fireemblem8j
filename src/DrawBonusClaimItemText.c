#include "global.h"

#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"

//! FE8U = 0x080B54AC
void DrawBonusClaimItemText(int idx) {
    int unk1;
    int claimable;
    int unk3;
    int itemId;
    int color;
    struct BonusClaimEnt* ent;
    struct BonusClaimEnt* ent2;

    struct Text* th = gpBonusClaimText + ((idx % 6) << 1);

    unk1 = idx * 2;
    unk1 &= 0x1f;

    claimable = gpBonusClaimItemList[idx].claimable;
    unk3 = gpBonusClaimItemList[idx].unk_00;

    ent = gpBonusClaimData;
    ent += unk3;

    itemId = ent->itemId;

    color = TEXT_COLOR_SYSTEM_WHITE;

    TileMap_FillRect(gBG2TilemapBuffer + ((unk1) * 0x20), 0x14, 1, 0);

    ClearText(th);

    if (idx >= 0x20) {
        return;
    }

    ent2 = &gpBonusClaimData[unk3];
    if ((ent2->unseen & 3) == 0) {
        return;
    }

    if ((ent2->unseen & 3) == 1) {
        color = TEXT_COLOR_SYSTEM_GREEN;
    }

    if (claimable == 0) {
        color = TEXT_COLOR_SYSTEM_GRAY;
    }

    switch (gpBonusClaimData[unk3].kind) {
        case BONUSKIND_ITEM0:
        case BONUSKIND_ITEM1:
            PutDrawText(
                th,
                gBG2TilemapBuffer + (unk1 * 0x20) + 2,
                color,
                0,
                0,
                GetItemName(itemId)
            );

            PutNumberOrBlank(
                gBG2TilemapBuffer + (unk1 * 0x20) + 0xA,
                color == 0 ? TEXT_COLOR_SYSTEM_BLUE : color,
                GetItemMaxUses(itemId)
            );

            DrawIcon(gBG2TilemapBuffer + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);

            break;

        case BONUSKIND_MONEY:
            PutDrawText(
                th,
                gBG2TilemapBuffer + (unk1 * 0x20) + 2,
                color,
                0,
                0,
                GetItemName(itemId)
            );

            DrawIcon(gBG2TilemapBuffer + (unk1 * 0x20), GetItemIconId(itemId), 0x4000);

            break;
    }

    th++;

    ClearText(th);

    PutDrawText(
        th,
        gBG2TilemapBuffer + 12 + unk1 * 0x20,
        color == 0 ? TEXT_COLOR_SYSTEM_GOLD : color,
        0,
        0,
        gpBonusClaimData[unk3].str
    );

    BG_EnableSyncByMask(4);

    return;
}
