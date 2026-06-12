#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"
#include "efxbattle.h"

//! FE8U = 0x08053618
void EfxUpdateBg2Scroll(int xPos)
{
    u16 * p;
    int a;
    int x;

    if ((GetBanimDragonStatusType() == EKRDRGON_TYPE_DEMON_KING) || (GetBattleAnimArenaFlag() != 0))
    {
        return;
    }

    a = (xPos >> 3);
    x = xPos & 7;
    BG_SetPosition(BG_2, x, 0);

    p = gTmA_Banim + 33 + a;
    EfxTmCpyExt(p + 132, 66, gBG2TilemapBuffer, 32, 32, 20, -1, -1);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
