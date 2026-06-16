#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmlib.h"
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

void MapLatonafx_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(2, 0, 0);

    Decompress(
        gMapanimBattleinfo_2,
        (void *)(VRAM) + GetBackgroundTileDataOffset(2) + 0x140 * 0x20);

    SetBlendConfig(1, 16, 16, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    proc->frame = 0;
    proc->timer = 0;

    if (GetItemIndex(gManimSt.actor[0].bu->weaponBefore) == ITEM_STAFF_LATONA)
        StartPaletteAnimatorReverse(Pal_MapAnimBerserkfx_2, 0x80, 0x20, 2, (struct Proc*) proc);
    else
        StartPaletteAnimatorReverse(Pal_MapAnimBerserkfx_1, 0x80, 0x20, 2, (struct Proc*) proc);
}
