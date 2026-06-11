#include "global.h"
#include "bmlib.h"
#include "sram-layout.h"
#include "bmdifficulty.h"
#include "bonusclaim.h"
#include "bmsave.h"

//! FE8U = 0x080A7360
void CopyGameRankSaveData(struct GameRankSaveDataPacks* src, struct GameRankSaveDataPacks* dst) {
    *dst = *src;
    return;
}
