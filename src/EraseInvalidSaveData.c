#include "global.h"
#include "bmlib.h"
#include "sram-layout.h"
#include "bmdifficulty.h"
#include "bonusclaim.h"
#include "bmsave.h"



extern u8 sGameStartSaveBuf[0x8000];
void CopyGlobalSaveInfo(struct GlobalSaveInfo * src, struct GlobalSaveInfo * dst);
void CopySuspendSaveBlock(struct SuspendSaveBlockEwram * src, struct SuspendSaveBlock * dst);
void CopyGameSaveBlock(struct GameSaveBlockEwram* src, struct GameSaveBlock* dst);
void CopyGameRankSaveData(struct GameRankSaveDataPacks* src, struct GameRankSaveDataPacks* dst);
void CopySoundRoomSaveData(struct SoundRoomSaveData * src, struct SoundRoomSaveData * dst);
void CopyLinkArenaStruct2(struct bmsave_unkstruct2* src, struct bmsave_unkstruct2* dst);
void CopyBonusClaimSaveData(struct BonusClaimSaveData* src, struct BonusClaimSaveData* dst);
void SetGlobalSaveInfoPtr(struct SaveBlockInfo* src, struct SaveBlockInfo* dst);

void EraseInvalidSaveData(void)
{
    int i;
    struct SaveBlocksEwram * ewram;
    struct SaveBlocks * sram;
    struct SaveBlocksEwram * ewram_;

    ewram = (void *)EWRAM_ENTRY;
    sram = (void *)CART_SRAM;

    ReadSramFast(&sram->globalSaveInfo, ewram, sizeof(struct GlobalSaveInfo));

    /* Yeah this is FE8U's magic! */
    if (ewram->globalSaveInfo.magic32 == SAVEMAGIC32)
        return;

    ewram_ = ewram;

    ReadSramFast(sram, ewram_, 0x8000);

    /* Which game holds magic32 = 0x040603? */
    if (ewram_->globalSaveInfo.magic32 != 0x00040603)
        return;

    /* Erase the GlobalSaveInfo */
    CpuFastFill(0, (void *)ewram + 0x8000, sizeof(struct GlobalSaveInfo));
    CopyGlobalSaveInfo(&ewram_->globalSaveInfo, &((struct SaveBlocksEwram*)((void *)ewram + 0x8000))->globalSaveInfo);
    WriteGlobalSaveInfo(&((struct SaveBlocksEwram*)((void *)ewram + 0x8000))->globalSaveInfo);

    /* Erase the suspand data */
    for (i = 0; i < 2; i++)
    {
        CpuFastFill(0, (void *)ewram + 0x8000, sizeof(struct SuspendSaveBlock));
        CopySuspendSaveBlock(&ewram_->suspendSaveBlocks[i], (void *)ewram + 0x8000);
        WriteAndVerifySramFast((void *)ewram + 0x8000, &sram->suspendSaveBlocks[i], sizeof(struct SuspendSaveBlock));
    }

    /* Erase the save data */
    for (i = 0; i < 3; i++)
    {
        CpuFastFill(0, sGameStartSaveBuf, sizeof(struct GameSaveBlock));
        CopyGameSaveBlock(&ewram_->gameSaveBlocks[i], (struct GameSaveBlock*)sGameStartSaveBuf);
        WriteAndVerifySramFast(sGameStartSaveBuf, &sram->gameSaveBlocks[i], sizeof(struct GameSaveBlock));
    }

    // GameRankSaveDataPacks
    CpuFastFill(0, sGameStartSaveBuf, sizeof(struct GameRankSaveDataPacks));
    CopyGameRankSaveData(&ewram_->gameRankSave, (struct GameRankSaveDataPacks*)sGameStartSaveBuf);
    SaveRankings(sGameStartSaveBuf);

    CpuFastFill(0, sGameStartSaveBuf, sizeof(struct SoundRoomSaveData));
    CopySoundRoomSaveData(&ewram_->soundRoomSave, (struct SoundRoomSaveData*)sGameStartSaveBuf);
    WriteSoundRoomSaveData((struct SoundRoomSaveData *)sGameStartSaveBuf);

    // "bmsave_unkstruct2", flags for viewing CGs?
    CpuFastFill(0, sGameStartSaveBuf, sizeof(struct bmsave_unkstruct2));
    CopyLinkArenaStruct2(&ewram_->unkstruct2, (struct bmsave_unkstruct2*)sGameStartSaveBuf);
    WriteLinkArenaStruct2((struct bmsave_unkstruct2*)sGameStartSaveBuf);

    CpuFastFill(0, sGameStartSaveBuf, sizeof(struct BonusClaimSaveData));
    CopyBonusClaimSaveData(&ewram_->bonusClaim, (struct BonusClaimSaveData*)sGameStartSaveBuf);
    SaveBonusContentData(sGameStartSaveBuf);

    for (i = 0; i < SAVE_ID_MAX; i++)
    {
        CpuFastFill(0, sGameStartSaveBuf, sizeof(struct SaveBlockInfo));
        SetGlobalSaveInfoPtr(&ewram_->saveBlockInfo[i], (struct SaveBlockInfo*)sGameStartSaveBuf);
        WriteSaveBlockInfo((struct SaveBlockInfo *)sGameStartSaveBuf, i);
    }
}
