#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"




void efxSPDQuake_Loop2(struct ProcEfxSpdQuake *proc)
{
    int x1 = gEkrXPosReal[0] - gEkrBgPosition;
    int x2 = gEkrYPosReal[0];
    int y1 = gEkrXPosReal[1] - gEkrBgPosition;
    int y2 = gEkrYPosReal[1];

    SetEkrFrontAnimPostion(EKR_POS_L, x1, x2);
    SetEkrFrontAnimPostion(EKR_POS_R, y1, y2);

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        BG_SetPosition(BG_2, 0, 0);
        break;
    
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        EfxUpdateBg2Scroll(gEkrBgPosition);
        break;
    }

    Proc_Break(proc);
}
