#include "global.h"

#include "bmlib.h"
#include "sram-layout.h"
#include "bmdifficulty.h"
#include "bonusclaim.h"
#include "bmsave.h"



//! FE8U = 0x080A720C
void CopyGlobalSaveInfo(struct GlobalSaveInfo * src, struct GlobalSaveInfo * dst)
{
    CpuCopy32(src, dst, sizeof(struct GlobalSaveInfo));
    CopyString(dst->name, "AGB-FE9");
    dst->magic32 = SAVEMAGIC32;
    dst->magic16 = SAVEMAGIC16;

    return;
}

//! FE8U = 0x080A723C
void SetGlobalSaveInfoPtr(struct SaveBlockInfo* src, struct SaveBlockInfo* dst)
{
    *dst = *src;
    dst->magic32 = SAVEMAGIC32;
    return;
}

//! FE8U = 0x080A7258
void SetPlayStPtrWithChIndexModify(struct PlaySt * src, struct PlaySt * dst)
{
    *dst = *src;

    if (dst->chapterIndex > 0x04) {
        dst->chapterIndex++;
    }

    if (dst->chapterIndex > 0x15) {
        dst->chapterIndex++;
    }

    if (dst->chapterIndex > 0x22) {
        dst->chapterIndex++;
    }

    return;
}

//! FE8U = 0x080A7298
void CopyGMapSaveInfo(const u32* src, u32* dst)
{
    memcpy(dst, src, 0x1d); // TODO: where does the 0x1D come from?
}

//! FE8U = 0x080A72B0
void CopySuspendSaveBlock(struct SuspendSaveBlockEwram * src, struct SuspendSaveBlock * dst)
{
    memcpy(&dst->action, src->buffer_58, sizeof(src->buffer_58));
    SetPlayStPtrWithChIndexModify(&src->playSt, &dst->playSt);
    CopyGMapSaveInfo(src->buffer_1F1C, (void*)&dst->wmStuff);

    return;
}

//! FE8U = 0x080A72EC
void CopyGameSaveBlock(struct GameSaveBlockEwram* src, struct GameSaveBlock* dst) {
    memcpy(dst->units, src->buffer_58, sizeof(src->buffer_58));
    SetPlayStPtrWithChIndexModify(&src->playSt, &dst->playSt);
    CopyGMapSaveInfo(src->buffer_D74, (void*)&dst->wmStuff);
    return;
}

//! FE8U = 0x080A7328
void CopyBonusClaimSaveData(struct BonusClaimSaveData* src, struct BonusClaimSaveData* dst) {
    *dst = *src;
    return;
}

//! FE8U = 0x080A733C
void CopyLinkArenaStruct2(struct bmsave_unkstruct2* src, struct bmsave_unkstruct2* dst) {
    *dst = *src;
    return;
}

//! FE8U = 0x080A734C
void CopySoundRoomSaveData(struct SoundRoomSaveData * src, struct SoundRoomSaveData * dst)
{
    *dst = *src;
    return;
}
