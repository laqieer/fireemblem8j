#include "global.h"
#include "worldmap.h"
#include "agb_sram.h"
#include "bmsave.h"

//! FE8U = 0x080A71F8
void LoadGMMonsterRnState(void* rngState) {
    SetGmRNState(&gGMData, rngState);
    return;
}
