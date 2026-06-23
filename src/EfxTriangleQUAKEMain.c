#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"

void EfxTriangleQUAKEMain(struct ProcEfxTriagnleQUAKE * proc)
{
    s16 ix1, iy1;
    s16 ix2, iy2;

    BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    BG_SetPosition(BG_0,
        gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x,
        gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    EkrDispUP_SetPositionSync(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    ix1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    iy1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
    ix2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    iy2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

    SetEkrFrontAnimPostion(0, ix1, iy1);
    SetEkrFrontAnimPostion(1, ix2, iy2);

    if (++proc->timer > proc->terminator)
    {
        gEfxBgSemaphore = gEfxBgSemaphore - 1;
        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);

        ix1 = gEkrXPosReal[0] - gEkrBgPosition;
        iy1 = gEkrYPosReal[0];
        ix2 = gEkrXPosReal[1] - gEkrBgPosition;
        iy2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, ix1, iy1);
        SetEkrFrontAnimPostion(1, ix2, iy2);

        Proc_End(proc->qproc);
        Proc_Break(proc);
    }
}
