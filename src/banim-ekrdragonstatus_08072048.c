#include "global.h"
#include "gbafe.h"

int GetEkrDragonStatusUnk1(void)
{
    return gEkrDragonStatusLeft.unk01;
}

void SetEkrDragonStatusUnk1(int unk1)
{
    gEkrDragonStatusLeft.unk01 = unk1;
}

u32 GetBanimDragonStatusType(void)
{
    int ret;

    ret = GetEkrDragonStatusType(gEkrDragonStatusLeft.anim);
    if (ret)
        return ret;

    ret = GetEkrDragonStatusType(gEkrDragonStatusRight.anim);
    if (ret)
        return ret;

    return 0;
}

void EkrDragonTmCpyHFlip(int x, int y)
{
    int ix, iy;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL || GetBanimDragonStatusType() == EKRDRGON_TYPE_MYRRH)
        return;

    ix = x >> 3;
    iy = y >> 3;

    EfxTmCpyExtHFlip(gEkrTsaBuffer, -1,
        EFX_TILEMAP_LOC(gTmB_Banim, ix, iy),
        EFX_BG_WIDTH,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, 6, 0);
}

void EkrDragonTmCpyExt(int x, int y)
{
    int _x, _y;
    int tmp1, tmp2, tmp3;
    u16 *buf;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL)
        return;

    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_MYRRH)
        return;
    
    if (GetBanimDragonStatusType() == EKRDRGON_TYPE_DEMON_KING) {
        tmp1 = x - 0x70;
        x = tmp1 - gEkrXQuakeOff;

        tmp2 = y + 0x08;
        y = tmp2 - gEkrYQuakeOff;
    }

    _x = x >> 3;
    tmp3 = 7;
    _y = y >> 3;

    BG_SetPosition(BG_3, x & tmp3, y & tmp3);

    buf = gTmB_Banim + 0x21 + _x;
    buf += 66 * _y;

    EfxTmCpyExt(
        buf,
        EFX_BG_WIDTH,
        gBG3TilemapBuffer,
        TILE_SIZE_4BPP, TILE_SIZE_4BPP, 32, -1, -1);

    BG_EnableSyncByMask(BG3_SYNC_BIT);
}
