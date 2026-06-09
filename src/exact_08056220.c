#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

/* prototypes for same-file helpers called by this run */
void StartBattleAnimHitEffects(struct Anim *anim, int type, int a, int b);

void StartBattleAnimHitEffectsDefault(struct Anim *anim, int type)
{
    StartBattleAnimHitEffects(anim, type, 3, 4);
}
