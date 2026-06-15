#include "global.h"
#include "worldmap.h"
#include "agb_sram.h"
#include "bmsave.h"

//! FE8U = 0x080A71E4
void StoreGMMonsterRnState(void* rngState) {
    GetGmRNState(&gGMData, rngState);
    return;
}
