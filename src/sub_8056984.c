#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SetEkrFrontAnimPostion(int pos, s16 x, s16 y)
{
    struct Anim * anim;

    if (EKR_POS_L == pos) {
        anim = gAnims[0];
        anim->xPosition = x;
        anim->yPosition = y;

        anim = gAnims[1];
        anim->xPosition = x;
        anim->yPosition = y;
    } else {
        anim = gAnims[2];
        anim->xPosition = x;
        anim->yPosition = y;

        anim = gAnims[3];
        anim->xPosition = x;
        anim->yPosition = y;
    }
}
