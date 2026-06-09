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















/* prototypes for same-file helpers called by this run */
void InitLeftAnim(int round_type);
void InitRightAnim(int round_type);

void InitBattleAnimFrame(int round_type_left, int round_type_right)
{
    gAnims[0] = NULL;
    gAnims[1] = NULL;
    gAnims[2] = NULL;
    gAnims[3] = NULL;

    if (gBanimValid[EKR_POS_L] == true)
        InitLeftAnim(round_type_left);

    if (gBanimValid[EKR_POS_R] == true)
        InitRightAnim(round_type_right);

    /* Hide the left anim on init promotion */
    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION) {
        gAnims[0]->state |= ANIM_BIT_HIDDEN;
        gAnims[1]->state |= ANIM_BIT_HIDDEN;
    }
}
