#include "gbafe.h"

void EkrDragonQuakeMain(struct ProcEkrDragonQuake * proc)
{
    s16 x1, y1;
    s16 x2, y2;

    struct EkrDragonQuakePriv * priv = proc->priv;

    BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
    BG_SetPosition(
        BG_0,
        gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x,
        gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);
    EkrGauge_Setxy323A(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    EkrDispUP_SetPositionSync(
        -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x),
        -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
    BG_SetPosition(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);

    x1 = (gEkrXPosReal[POS_L] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
    y1 = gEkrYPosReal[POS_L] - gEkrBg2QuakeVec.y;
    x2 = (gEkrXPosReal[POS_R] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
    y2 = gEkrYPosReal[POS_R] - gEkrBg2QuakeVec.y;

    SetEkrFrontAnimPostion(POS_L, x1, y1);
    SetEkrFrontAnimPostion(POS_R, x2, y2);

    if (priv)
    {
        priv->unk32 = x1;
        priv->unk3A = y1;
    }

    if (++proc->unk2C > proc->unk2E)
    {
        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
        EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        BG_SetPosition(BG_3, 0, 0);

        x1 = gEkrXPosReal[POS_L] - gEkrBgPosition;
        y1 = gEkrYPosReal[POS_L];
        x2 = gEkrXPosReal[POS_R] - gEkrBgPosition;
        y2 = gEkrYPosReal[POS_R];

        SetEkrFrontAnimPostion(POS_L, x1, y1);
        SetEkrFrontAnimPostion(POS_R, x2, y2);

        if (priv)
        {
            priv->unk32 = x1;
            priv->unk3A = y1;
        }

        Proc_End(proc->subproc);
        Proc_Break(proc);
    }
}
