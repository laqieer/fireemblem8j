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

/* variables */
extern EWRAM_DATA u32 gBonusContentClaimFlags;
extern EWRAM_DATA u8 gSuspendSaveIdOffset;

/* prototypes for same-file helpers called by this run */
void WriteBonusContentClaimFlags(struct GameSaveBlock *sram_dest);
void ReadBonusContentClaimFlags(const struct GameSaveBlock *sram_src);
void WriteLastGameSaveId(int num);
void WriteGameSavePackedUnit(struct Unit *unit, void *sram_dest);
void LoadSavedUnit(const void *sram_src, struct Unit *unit);
void WriteGMMonsterRnState(void *sram_dest);
void ReadGMMonsterRnState(const void *sram_src);
void InvalidateSuspendSave(int slot);

void WriteGameSave(int slot)
{
    int i;
    struct SaveBlockInfo chunk;
    struct GlobalSaveInfo info;
    struct Dungeon dungeon[2];

    struct GameSaveBlock *dest = GetSaveWriteAddr(slot);
    InvalidateSuspendSave(SAVE_ID_SUSPEND);
    gPlaySt.gameSaveSlot = slot;
    gPlaySt.time_saved = GetGameClock();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        WriteGameSavePackedUnit(&gUnitArrayBlue[i], &dest->units[i]);

    ReadGlobalSaveInfo(&info);
    
    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        SGM_SetCharacterKnown(UNIT_CHAR_ID(&gUnitArrayBlue[i]), &info);

    WriteGlobalSaveInfo(&info);
    WriteGMMonsterRnState(&dest->gmUnit);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteBonusContentClaimFlags(dest);
    WritePermanentFlags(dest->permanentFlags);
    WriteWorldMapStuff(&dest->wmStuff, &gGMData);
    SaveDungeonRecords(dungeon);
    WriteAndVerifySramFast(dungeon, dest->dungeons, sizeof(dungeon));

    chunk.magic32 = SAVEMAGIC32;
    chunk.kind = SAVEBLOCK_KIND_GAME;
    WriteSaveBlockInfo(&chunk, slot);
    WriteLastGameSaveId(slot);
}

void ReadGameSave(int slot)
{
    int i;
    struct Dungeon dungeon[2];
    struct GameSaveBlock *src = GetSaveReadAddr(slot);

    if (!(PLAY_FLAG_HARD & gBmSt.gameStateBits))
        InvalidateSuspendSave(SAVE_ID_SUSPEND);

    ReadSramFast(src, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);
    gPlaySt.gameSaveSlot = slot;

    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        LoadSavedUnit(src->units + i, &gUnitArrayBlue[i]);

    ReadGMMonsterRnState(&src->gmUnit);
    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadBonusContentClaimFlags(src);
    ReadWorldMapStuff(&src->wmStuff, &gGMData);
    ReadSramFast(src->dungeons, dungeon, sizeof(dungeon));
    LoadDungeonRecords(dungeon);
    WriteLastGameSaveId(slot);
}
