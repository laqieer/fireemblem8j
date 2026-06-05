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
EWRAM_DATA u32 gBonusContentClaimFlags = 0;
EWRAM_DATA u8 gSuspendSaveIdOffset = 0;

void ReadGMMonsterRnState(const void *sram_src)
{
    u32 buf[2];
    ReadSramFast(sram_src, buf, sizeof(buf));
    LoadGMMonsterRnState(buf);
}

void InvalidateSuspendSave(int slot)
{
    struct SaveBlockInfo chunk;
    chunk.kind = SAVEBLOCK_KIND_INVALID;

    WriteSaveBlockInfo(&chunk, slot);

    if (SAVE_ID_SUSPEND == slot)
        WriteSaveBlockInfo(&chunk, SAVE_ID_SUSPEND_ALT);
}

void WriteSuspendSave(int slot)
{
    struct SuspendSaveBlock *dest;
    struct SaveBlockInfo chunk;
    u8 list[MENU_OVERRIDE_MAX];
    struct Dungeon dungeon[2];
    int i, val;
    struct SuspendSavePackedUnit *buf;

    if (PLAY_FLAG_TUTORIAL & gPlaySt.chapterStateBits)
        return;

    if (!IsSramWorking())
        return;

    slot += GetNextSuspendSaveId();
    dest = GetSaveWriteAddr(slot);
    gPlaySt.time_saved = GetGameClock();
    WriteAndVerifySramFast(&gPlaySt, &dest->playSt, sizeof(gPlaySt));
    StoreRNStateToActionStruct();
    WriteAndVerifySramFast(&gActionData, &dest->action, sizeof(struct ActionData));

    buf = (struct SuspendSavePackedUnit *)gGenericBuffer;
    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayBlue[i], buf++);

    WriteSramFast(gGenericBuffer, (u8 *)dest->blueUnits, UNIT_SAVE_AMOUNT_BLUE * sizeof(struct SuspendSavePackedUnit));

    buf = (struct SuspendSavePackedUnit *)gGenericBuffer;
    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayRed[i], buf++);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        EncodeSuspendSavePackedUnit(&gUnitArrayGreen[i], buf++);

    WriteSramFast(gGenericBuffer, (u8 *)dest->redUnits, (UNIT_SAVE_AMOUNT_RED + UNIT_SAVE_AMOUNT_GREEN) * sizeof(struct SuspendSavePackedUnit)); // TODO: maybe pack them into a single struct?

    WritePermanentFlags(dest->permanentFlags);
    WriteChapterFlags(dest->chapterFlags);
    WriteSupplyItems(dest->supplyItems);
    WritePidStats(dest->pidStats);
    WriteChapterStats(dest->chapterStats);
    WriteTraps(dest->traps);

    GetForceDisabledMenuItems(list);
    WriteAndVerifySramFast(list, dest->menuOverride, sizeof(list));

    WriteWorldMapStuff(&dest->wmStuff, &gGMData);

    /**
     * I think this maybe a coincidence that I$ find that gm-generated-monster does not require the suspend save space
     */
    SaveDungeonRecords(dungeon);
    WriteAndVerifySramFast(dungeon, &dest->wmMonsterUnit, sizeof(dungeon));

    SaveDungeonState(dungeon);
    WriteAndVerifySramFast(dungeon, &dest->dungeon, sizeof(struct Dungeon));

    val = GetEventSlotCounter();
    WriteAndVerifySramFast(&val, &dest->eventSlotCnt, sizeof(int));

    chunk.magic32 = SAVEMAGIC32;
    chunk.kind = SAVEBLOCK_KIND_SUSPEND;
    WriteSaveBlockInfo(&chunk, slot);

    gBmSt.just_resumed = false;
    WriteSwappedSuspendSaveId();
}

void ReadSuspendSave(int slot)
{
    int i, val;
    u8 list[MENU_OVERRIDE_MAX];
    struct Dungeon dungeon[2];
    struct SuspendSaveBlock *src = GetSaveReadAddr(slot + gSuspendSaveIdOffset);

    ReadSramFast(&src->playSt, &gPlaySt, sizeof(gPlaySt));
    SetGameTime(gPlaySt.time_saved);

    ReadSramFast(&src->action, &gActionData, sizeof(struct ActionData));
    LoadRNStateFromActionStruct();
    InitUnits();

    for (i = 0; i < UNIT_SAVE_AMOUNT_BLUE; i++)
        ReadSuspendSavePackedUnit(&src->blueUnits[i], &gUnitArrayBlue[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_RED; i++)
        ReadSuspendSavePackedUnit(&src->redUnits[i], &gUnitArrayRed[i]);

    for (i = 0; i < UNIT_SAVE_AMOUNT_GREEN; i++)
        ReadSuspendSavePackedUnit(&src->greenUnits[i], &gUnitArrayGreen[i]);

    ReadPidStats(src->pidStats);
    ReadChapterStats(src->chapterStats);
    ReadSupplyItems(src->supplyItems);
    ReadPermanentFlags(src->permanentFlags);
    ReadChapterFlags(src->chapterFlags);
    ReadTraps(src->traps);

    ReadSramFast(src->menuOverride, list, sizeof(list));
    SetForceDisabledMenuItems(list);

    ReadWorldMapStuff(&src->wmStuff, &gGMData);

    ReadSramFast(&src->wmMonsterUnit, dungeon, sizeof(dungeon));
    LoadDungeonRecords(dungeon);

    ReadSramFast(&src->dungeon, dungeon, sizeof(struct Dungeon));
    LoadDungeonState(dungeon);

    ReadSramFast(&src->eventSlotCnt, &val, sizeof(int));
    SetEventSlotCounter(val);

    SetBonusContentClaimFlags(LoadSavedBonusClaimFlags(gPlaySt.gameSaveSlot));
}

u8 IsValidSuspendSave(int slot)
{
    if (!IsSramWorking())
        return false;

    if (SAVE_ID_SUSPEND != slot)
        return false;

    gSuspendSaveIdOffset = GetLastSuspendSaveId();
    if (ReadSaveBlockInfo(NULL, gSuspendSaveIdOffset + 3))
        return true;

    gSuspendSaveIdOffset = GetNextSuspendSaveId();
    if (ReadSaveBlockInfo(NULL, gSuspendSaveIdOffset + 3))
        return true;
    
    gSuspendSaveIdOffset = 0x7F;
    return false;
}

void ReadSuspendSavePlaySt(int slot, struct PlaySt *buf)
{
    ReadGameSavePlaySt(slot + gSuspendSaveIdOffset, buf);
}

void EncodeSuspendSavePackedUnit(struct Unit *unit, void *buf)
{
    u8 ai1_byte;
    int i;
    struct SuspendSavePackedUnit *unit_su = buf;

    if (NULL == unit->pCharacterData) {
        unit_su->pid = 0;
        return;
    }
    
    unit_su->pid = UNIT_CHAR_ID(unit);
    unit_su->jid = unit->pClassData->number;
    unit_su->level = unit->level;
    unit_su->exp = unit->exp;
    unit_su->state = unit->state;
    unit_su->xPos = unit->xPos;
    unit_su->yPos = unit->yPos;
    unit_su->maxHP = unit->maxHP;
    unit_su->curHP = unit->curHP;
    unit_su->pow = unit->pow;
    unit_su->skl = unit->skl;
    unit_su->spd = unit->spd;
    unit_su->def = unit->def;
    unit_su->res = unit->res;
    unit_su->lck = unit->lck;
    unit_su->conBonus = unit->conBonus;
    unit_su->statusIndex_l = unit->statusIndex;
    unit_su->statusDuration = unit->statusDuration;
    unit_su->torchDuration = unit->torchDuration;
    unit_su->barrierDuration = unit->barrierDuration;
    unit_su->rescue = unit->rescue;
    unit_su->movBonus = unit->movBonus;

    unit_su->ballistaIndex = 
                  (0x7F & unit->ballistaIndex) | (0x01 & unit->supportBits) << 0x07;
    unit_su->item1 = (0x3FFF & unit->items[0]) | (0x06 & unit->supportBits) << 0x0D;
    unit_su->item2 = (0x3FFF & unit->items[1]) | (0x18 & unit->supportBits) << 0x0B;
    unit_su->item3 = (0x3FFF & unit->items[2]) | (0x60 & unit->supportBits) << 0x09;
    unit_su->item4 = unit->items[3];
    unit_su->item5 = unit->items[4];

    for (i = 0; i < 8; i++)
        unit_su->ranks[i] = unit->ranks[i];
    
    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit_su->supports[i] = unit->supports[i];

    unit_su->ai1 =  unit->ai1;

    ai1_byte = unit->ai1 & 0x7F;
    if (unit->statusIndex & 8)
        ai1_byte |= 0x80;

    unit_su->ai1 = ai1_byte;
    unit_su->ai_a_pc = unit->ai_a_pc;
    unit_su->ai2 = unit->ai2;
    unit_su->ai_b_pc = unit->ai_b_pc;
    unit_su->ai_config = unit->ai_config;
    unit_su->ai_counter = unit->ai_counter;
    unit_su->aiFlags = unit->aiFlags; 
}

void ReadSuspendSavePackedUnit(const void *sram_src, struct Unit *unit)
{
    int i;

    struct SuspendSavePackedUnit unit_su;

    ReadSramFast(sram_src, &unit_su, sizeof(unit_su));

    unit->pCharacterData = GetCharacterData(unit_su.pid);
    unit->pClassData = GetClassData(unit_su.jid);
    unit->level = unit_su.level;
    unit->exp = unit_su.exp;
    unit->state = unit_su.state;
    unit->xPos = unit_su.xPos;
    unit->yPos = unit_su.yPos;

    unit->maxHP = unit_su.maxHP;
    unit->curHP = unit_su.curHP;
    unit->pow = unit_su.pow;
    unit->skl = unit_su.skl;
    unit->spd = unit_su.spd;
    unit->def = unit_su.def;
    unit->res = unit_su.res;
    unit->lck = unit_su.lck;
    unit->conBonus = unit_su.conBonus;

    unit->statusIndex = unit_su.statusIndex_l;
    unit->statusIndex |= (unit_su.ai1 & 0x80) ? 8 : 0;
    unit->statusDuration = unit_su.statusDuration;
    unit->torchDuration = unit_su.torchDuration;
    unit->barrierDuration = unit_su.barrierDuration;

    unit->rescue = unit_su.rescue;
    unit->movBonus = unit_su.movBonus;
    unit->ballistaIndex = unit_su.ballistaIndex & 0x7F;

    unit->items[0] = unit_su.item1 & 0x3FFF;
    unit->items[1] = unit_su.item2 & 0x3FFF;
    unit->items[2] = unit_su.item3 & 0x3FFF;
    unit->items[3] = unit_su.item4;
    unit->items[4] = unit_su.item5;

    unit->supportBits = (unit_su.ballistaIndex & 0x80) >> 7 |
                        (unit_su.item1 & 0xC000) >> 0x0D |
                        (unit_su.item2 & 0xC000) >> 0x0B |
                        (unit_su.item3 & 0xC000) >> 0x09;

    for (i = 0; i < 8; i++)
        unit->ranks[i] = unit_su.ranks[i];

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
        unit->supports[i] = unit_su.supports[i];

    unit->ai1 = unit_su.ai1 & 0x7F;
    unit->ai_a_pc = unit_su.ai_a_pc;
    unit->ai2 = unit_su.ai2;
    unit->ai_b_pc = unit_su.ai_b_pc;
    unit->ai_config = unit_su.ai_config;
    unit->ai_counter = unit_su.ai_counter;
    unit->aiFlags = unit_su.aiFlags;

    if (0x7F == unit->exp)
        unit->exp = -1;

    if (0x3F == unit->xPos)
        unit->xPos = -1;

    if (0x3F == unit->yPos)
        unit->yPos = -1;
}
