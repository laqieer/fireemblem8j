#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"
#include "efxbattle.h"

//! FE8U = 0x08053BBC
void efxHitQuake_Loop(struct ProcEfxQuake * proc)
{
    int x1;
    int y1;
    int x2;
    int y2;

    const s16 * vec = proc->vec;

    if (vec[proc->timer * 2 + 0] == INT16_MAX)
    {
        SetEkrBg2QuakeVec(0, 0);

        switch (gEkrDistanceType)
        {
            case EKR_DISTANCE_CLOSE:
                BG_SetPosition(BG_2, 0, 0);

                if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
                {
                    BG_SetPosition(BG_3, 0, 0);
                }
                break;

            case EKR_DISTANCE_FAR:
            case EKR_DISTANCE_FARFAR:
                if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
                {
                    BG_SetPosition(BG_3, 0, 0);
                }

                EfxUpdateBg2Scroll(gEkrBgPosition);

                break;
        }

        if (proc->unk_64 != NULL)
        {
            AnimDelete(proc->unk_64);
            RegisterBanimTerrainTm(&gEkrbattle_9);
        }

        x1 = gEkrXPosReal[0] - gEkrBgPosition;
        y1 = gEkrYPosReal[0];
        x2 = gEkrXPosReal[1] - gEkrBgPosition;
        y2 = gEkrYPosReal[1];

        SetEkrFrontAnimPostion(0, x1, y1);
        SetEkrFrontAnimPostion(1, x2, y2);

        gEfxHitQuakeExist = 0;

        if (proc->quake_ui == 1)
        {
            if (GetBanimDragonStatusType() != 0)
            {
                BG_SetPosition(BG_3, 0, 0);
            }

            BG_SetPosition(BG_0, gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);
            EkrGauge_Setxy323A(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
            EkrDispUP_SetPositionSync(-gEkrBg0QuakeVec.x, -gEkrBg0QuakeVec.y);
        }

        Proc_End(proc);
    }
    else
    {
        int x;
        int y;

        if ((proc->timer == 0) && (proc->unk_64 != NULL))
        {
            FillBGRect(GetAnimPosition(proc->anim_l) * 15 + gBG2TilemapBuffer + 0x160, 0xf, 5, 0, 0);
        }

        x = vec[proc->timer * 2 + 0];
        y = vec[proc->timer * 2 + 1];

        SetEkrBg2QuakeVec(x, y);

        proc->timer++;

        if (proc->unk_64 != NULL)
        {
            int hm = (s16)(gEkrBgPosition - gEkrXPosBase[GetAnimPosition(proc->anim_l)]);

            struct Anim * anim = proc->unk_64;

            anim->xPosition = (proc->unk_36 + gEkrBg2QuakeVec.x) - hm;
            anim->yPosition = proc->unk_3e - gEkrBg2QuakeVec.y;
        }
        else
        {
            BG_SetPosition(BG_2, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
        }

        if (proc->quake_ui == 1)
        {
            if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
            {
                BG_SetPosition(BG_3, -x, y);
            }

            BG_SetPosition(BG_0, gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x, gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y);
            EkrGauge_Setxy323A(-(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
            EkrDispUP_SetPositionSync(
                -(gEkrBg2QuakeVec.x + gEkrBg0QuakeVec.x), -(gEkrBg2QuakeVec.y + gEkrBg0QuakeVec.y));
        }

        if (GetBanimDragonStatusType() != 0)
        {
            BG_SetPosition(BG_3, gEkrBg2QuakeVec.x, gEkrBg2QuakeVec.y);
        }

        if (GetBanimDragonStatusType() != 0)
        {
            x1 = (gEkrXPosReal[0] - gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }
        else
        {
            x1 = (gEkrXPosReal[0] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
            y1 = gEkrYPosReal[0] - gEkrBg2QuakeVec.y;
        }

        x2 = (gEkrXPosReal[1] + gEkrBg2QuakeVec.x) - gEkrBgPosition;
        y2 = gEkrYPosReal[1] - gEkrBg2QuakeVec.y;

        switch (gEkrDistanceType)
        {
            case EKR_DISTANCE_CLOSE:
                SetEkrFrontAnimPostion(0, x1, y1);
                SetEkrFrontAnimPostion(1, x2, y2);

                break;

            case EKR_DISTANCE_FAR:
            case EKR_DISTANCE_FARFAR:
                if (GetAnimPosition(proc->anim_l) == 0)
                {
                    SetEkrFrontAnimPostion(0, x1, y1);
                }
                else
                {
                    SetEkrFrontAnimPostion(1, x2, y2);
                }
                break;
        }
    }

    return;
}
