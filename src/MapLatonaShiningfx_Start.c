#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"
#include "constants/songs.h"

void MapLatonaShiningfx_Start(struct MAAnotherProc * proc)
{
    PutTmRectSequential(
        gBG2TilemapBuffer,
        proc->x, proc->y,
        TILEREF(0x140 /* JP: banim CHR base relocated 0x160->0x140 */, BM_BGPAL_BANIM_UNK4),
        proc->unk54, proc->unk54);

    BG_EnableSyncByMask(BG2_SYNC_BIT);
    SetBlendConfig(1, 0, 0x10, 0);
    proc->timer2 = 0;
}
