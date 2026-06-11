#include "global.h"
#include "constants/characters.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "bmio.h"
#include "mu.h"
#include "bm.h"
#include "bmsave.h"
#include "popup.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "savemenu.h"
#include "spline.h"
#include "sysutil.h"
#include "bmdifficulty.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

void DrawDungeonRecordUiText(ProcPtr proc) {
    int time;
    struct Dungeon currentDungeon;
    struct Dungeon recordDungeon;
    struct Text text;

    CpuCopy32(&gDungeonState.current, &currentDungeon, sizeof(struct Dungeon));

    CpuCopy32(&gDungeonState.dungeon[gDungeonState.type], &recordDungeon, sizeof(struct Dungeon));

    time = GetGameClock();
    SetGameTime(gBmdifficulty_2);

    UpdateDungeonStats(&currentDungeon);

    SetGameTime(time);

    ResetTextFont();

    InitTextFont(&gBmdifficulty_1, (void *)(VRAM + 0x20) + GetBackgroundTileDataOffset(0), 1, 0);
    SetTextFont(&gBmdifficulty_1);
    InitSystemTextFont();

    StartGreenText(proc);

    DrawDungeonRecordUiLabels(&text);

    DrawNumberText(
        &gBmdifficulty_4[5],
        recordDungeon.clearCount,
        3,
        0x1A,
        7,
        2
    );

    DrawNumberText(
        &gBmdifficulty_3[0].text[0][8 - gBmdifficulty_6.current[0].numDigits],
        currentDungeon.enemiesDefeated,
        gBmdifficulty_6.current[0].numDigits, // 5
        gBmdifficulty_6.current[0].x,
        gBmdifficulty_6.current[0].y,
        2
    );

    DrawNumberText(
        &gBmdifficulty_3[1].text[0][8 - gBmdifficulty_6.record[0].numDigits],
        recordDungeon.enemiesDefeated,
        gBmdifficulty_6.record[0].numDigits, // 5
        gBmdifficulty_6.record[0].x,
        gBmdifficulty_6.record[0].y,
        2
    );

    DrawNumberText(
        &gBmdifficulty_3[0].text[1][8 - gBmdifficulty_6.current[1].numDigits],
        currentDungeon.expEarned,
        gBmdifficulty_6.current[1].numDigits, // 5
        gBmdifficulty_6.current[1].x,
        gBmdifficulty_6.current[1].y,
        2
    );

    DrawNumberText(
        &gBmdifficulty_3[1].text[1][8 - gBmdifficulty_6.record[1].numDigits],
        recordDungeon.expEarned,
        gBmdifficulty_6.record[1].numDigits, // 5
        gBmdifficulty_6.record[1].x,
        gBmdifficulty_6.record[1].y,
        2
    );

    DrawNumberText(
        &gBmdifficulty_3[0].text[2][8 - gBmdifficulty_6.current[2].numDigits],
        currentDungeon.unitsUsed,
        gBmdifficulty_6.current[2].numDigits, // 3
        gBmdifficulty_6.current[2].x,
        gBmdifficulty_6.record[2].y, // BUG?
        2
    );

    DrawNumberText(
        &gBmdifficulty_3[1].text[2][8 - gBmdifficulty_6.record[2].numDigits],
        recordDungeon.unitsUsed,
        gBmdifficulty_6.record[2].numDigits, // 3
        gBmdifficulty_6.record[2].x,
        gBmdifficulty_6.record[2].y,
        2
    );

    DrawNumberText(
        &gBmdifficulty_3[0].text[3][8 - gBmdifficulty_6.current[3].numDigits],
        currentDungeon.turnCount,
        gBmdifficulty_6.current[3].numDigits, // 3
        gBmdifficulty_6.current[3].x,
        gBmdifficulty_6.current[3].y,
        2
    );

    DrawNumberText(
        &gBmdifficulty_3[1].text[3][8 - gBmdifficulty_6.record[3].numDigits],
        recordDungeon.turnCount,
        gBmdifficulty_6.record[3].numDigits, // 3
        gBmdifficulty_6.record[3].x,
        gBmdifficulty_6.record[3].y,
        2
    );

    DrawTimeText(
        &gBmdifficulty_3[0].text[4][0],
        currentDungeon.mapTime,
        gBmdifficulty_6.x,
        gBmdifficulty_6.y,
        2
    );

    DrawTimeText(
        &gBmdifficulty_3[1].text[4][0],
        recordDungeon.mapTime,
        gBmdifficulty_6.x2,
        gBmdifficulty_6.y2,
        2
    );

    return;
}
