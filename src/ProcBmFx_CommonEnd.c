#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "bmudisp.h"
#include "bmfx.h"
#include "bmlib.h"
#include "constants/songs.h"

void ProcBmFx_CommonEnd(struct ProcBmFx *proc)
{
    SetDefaultColorEffects();
    BG_Fill(gBG0TilemapBuffer, 0x0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
