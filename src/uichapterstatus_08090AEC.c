#include "global.h"
#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u16 Sprite_ChapterStatus_ChapterBanner[];
extern u16 Sprite_ChapterStatus_ChapterName[];
extern u16 Sprite_ChapterStatus_EnemyLabel[];
extern u16 Sprite_ChapterStatus_FactionSelector[];
extern u16 Sprite_ChapterStatus_FundsLabel[];
extern u16 Sprite_ChapterStatus_ObjectiveLabel[];
extern u16 Sprite_ChapterStatus_PlayCountLabel[];
extern u16 Sprite_ChapterStatus_PlayerLabel[];
extern u16 Sprite_ChapterStatus_PlaytimeBanner[];
extern u16 Sprite_ChapterStatus_TurnLabel[];

//! FE8U = 0x0808E818
void StatusScreenSpriteDraw_Loop(struct ChapterStatusProc * proc)
{
    int i;

    struct ChapterStatusProc * parent = proc->proc_parent;

    PutSprite(4, 4, 3, Sprite_ChapterStatus_ChapterBanner, OAM2_CHR(0x180) + OAM2_LAYER(1) + OAM2_PAL(8));
    PutSprite(4, 150, 124, Sprite_ChapterStatus_PlaytimeBanner, OAM2_CHR(0x180) + OAM2_LAYER(1) + OAM2_PAL(9));

    if (parent->unk_3f == 0)
    {
        PutSprite(4, 4, 11, Sprite_ChapterStatus_ChapterName, OAM2_CHR(0x380) + OAM2_LAYER(1) + OAM2_PAL(3));
    }

    // Draw rectangle around current selected faction
    PutSprite(
        4, parent->unitIndex * 56, 44, Sprite_ChapterStatus_FactionSelector, OAM2_CHR(0x180) + OAM2_LAYER(1) + OAM2_PAL(7));

    PutSprite(4, 8, 37, Sprite_ChapterStatus_PlayerLabel, 0);
    PutSprite(4, 64, 37, Sprite_ChapterStatus_EnemyLabel, 0);
    PutSprite(4, 18, 115, Sprite_ChapterStatus_TurnLabel, 0);
    PutSprite(4, 18, 131, Sprite_ChapterStatus_FundsLabel, 0);
    PutSprite(4, 28, 67, Sprite_ChapterStatus_ObjectiveLabel, 0);

    // Draw unit name
    for (i = 0; i < 2; i++)
    {
        PutSprite(4, 160 + (i * 32), 60, gObject_32x16, OAM2_CHR(0x3C0) + OAM2_PAL(10) + (i * 4));
    }

    // Draw unit level
    PutSprite(4, 180, 75, gObject_32x16, OAM2_CHR(0x3D0) + OAM2_PAL(10));

    // Draw unit HP
    for (i = 0; i < 2; i++)
    {
        PutSprite(4, 156 + (i * 32), 91, gObject_32x16, OAM2_CHR(0x3D4) + OAM2_PAL(10) + (i * 4));
    }

    PutTime(TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 16), TEXT_COLOR_SYSTEM_BLUE, GetGameClock(), 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    if (parent->units[parent->unitIndex] != NULL)
    {
        PutUnitSprite(4, 136, 61, parent->units[parent->unitIndex]);
    }

    SyncUnitSpriteSheet();

    if (parent->timesCompleted != 0)
    {
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME))
        {
            PutSprite(4, 219, 3, Sprite_ChapterStatus_PlayCountLabel, 0);
        }
    }

    UpdateStatusFactionSelectorGlow(parent);

    return;
}
