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

int CheckRound2(s16 type)
{
    switch(type) {
    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
        return true;

    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    default:
        return false;
    }
}
