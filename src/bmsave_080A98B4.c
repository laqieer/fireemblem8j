#include "global.h"

#include "bmitem.h"
#include "agb_sram.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmdifficulty.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "event.h"
#include "bmtrick.h"
#include "functions.h"
#include "bmreliance.h"
#include "bmunit.h"
#include "bmsave.h"
#include "sram-layout.h"
#include "eventinfo.h"

void WriteNewGameSave(int index, int isDifficult, int mode, int isTutorial)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GameSavePackedUnit unitp;

    struct GameSaveBlock *dest = GetSaveWriteAddr(index);

    if (0 == mode)
        mode = gPlaySt.chapterModeIndex;

    if (isTutorial < 0)
        isTutorial = gPlaySt.config.controller;

    SetGameTime(0);
    InitPlayConfig(isDifficult, isTutorial);
    InitUnits();
    ClearSupplyItems();
    ResetPermanentFlags();
    InvalidateSuspendSave(SAVE_ID_SUSPEND);

    gPlaySt.unk_2C_1 = 0;
    gPlaySt.unk_2C_04 = 0;
    CpuFill16(0, &gPlaySt.unk_30, sizeof(gPlaySt.unk_30));
    gPlaySt.unk_2C_0D = 0;
    gPlaySt.chapterModeIndex = mode;
    gPlaySt.unk_2B_00 = 1;
    gPlaySt.playerName[0] = '\0';
    gPlaySt.chapterIndex = 0;
    gPlaySt.playthroughIdentifier = GetNewPlaythroughId();
    gPlaySt.gameSaveSlot = index;
    gPlaySt.unk_2C_2 = GetGlobalCompletionCount();

    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    SetBonusContentClaimFlags(0);
    WriteBonusContentClaimFlags(dest);

    CpuFill16(0, &unitp, sizeof(unitp));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++) {
        WriteAndVerifySramFast(&unitp, &dest->units[i], sizeof(unitp));
    }
    WriteAndVerifySramFast(&unitp, &dest->gmUnit, sizeof(unitp));

    WriteSupplyItems(dest->supplyItems);
    ClearPidChStatsSaveData(dest);
    WritePermanentFlags(dest->permanentFlags);
    ClearWorldMapStuff(&dest->wmStuff);

    chunk.magic32 = SAVEMAGIC32;
    chunk.kind = SAVEBLOCK_KIND_GAME;
    WriteSaveBlockInfo(&chunk, index);
    WriteLastGameSaveId(index);
}
