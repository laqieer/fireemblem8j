#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ctc.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "banim_data.h"
#include "constants/classes.h"















int GetAISLayerId(struct Anim * anim)
{
    if (!(anim->state2 & ANIM_BIT2_FRONT_FRAME))
        return 0;

    return 1;
}

int GetAnimPosition(struct Anim * anim)
{
    if (!(anim->state2 & ANIM_BIT2_POS_RIGHT))
        return EKR_POS_L;

    return EKR_POS_R;
}
