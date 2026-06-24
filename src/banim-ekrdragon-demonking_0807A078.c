#include "gbafe.h"

void EkrDragonSetBgAndFrontPos(s16 x, s16 y)
{
    s16 ix1, iy1;
    s16 ix2, iy2;

    BG_SetPosition(BG_2, x, y);
    BG_SetPosition(BG_0, x + gEkrBg0QuakeVec.x, y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(
        -(x + gEkrBg0QuakeVec.x),
        -(y + gEkrBg0QuakeVec.y));

    EkrDispUP_SetPositionSync(
        -(x + gEkrBg0QuakeVec.x),
        -(y + gEkrBg0QuakeVec.y));

    BG_SetPosition(BG_3, x, y);

    ix1 = gEkrXPosReal[0] - x - gEkrBgPosition;
    iy1 = gEkrYPosReal[0] - y;
    ix2 = gEkrXPosReal[1] + x - gEkrBgPosition;
    iy2 = gEkrYPosReal[1] - y;

    SetEkrFrontAnimPostion(0, ix1, iy1);
    SetEkrFrontAnimPostion(1, ix2, iy2);
}
