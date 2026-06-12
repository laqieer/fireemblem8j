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

s16 GetAnimRoundTypeAnotherSide(struct Anim * anim)
{
    return GetBattleAnimRoundType((anim->nextRoundId - 1) * 2 + (1 ^ GetAnimPosition(anim)));
}
