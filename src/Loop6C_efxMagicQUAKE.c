#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

//! FE8U = 0x0805BCC4
void Loop6C_efxMagicQUAKE(struct ProcEfxMagicQuake * proc)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    BG_SetPosition(2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    BG_SetPosition(0, gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x, gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);

    EkrGauge_Setxy323A(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    EkrDispUP_SetPositionSync(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
    {
        BG_SetPosition(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    }

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
    {
        x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }
    else
    {
        x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y1 = (gEkrYPosReal[0] - gEkrBg2QuakeVec.y);
    }

    x2 = ((gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition);
    y2 = (gEkrYPosReal[1] - gEkrBg2QuakeVec.y);

    SetEkrFrontAnimPostion(0, x1, y1);
    SetEkrFrontAnimPostion(1, x2, y2);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;

        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);

        if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
        {
            BG_SetPosition(BG_3, 0, 0);
        }

        x1 = (gEkrXPosReal[0] - gEkrBgPosition);
        y1 = gEkrYPosReal[0];

        x2 = (gEkrXPosReal[1] - gEkrBgPosition);
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        Proc_End(proc->pQuakePureProc);

        Proc_Break(proc);
    }

    return;
}
