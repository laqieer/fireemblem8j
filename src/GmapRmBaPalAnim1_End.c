#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"

void GmapRmBaPalAnim1_End(struct ProcGmapRmBaPalAnim * proc)
{
    int val = GetWMFaceBlendAmt();
    SetBlendConfig(0, val, 0x10 - val, 0);
}
