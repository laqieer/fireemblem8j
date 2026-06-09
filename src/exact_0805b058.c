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
int GetAnimPosition(struct Anim * anim);

struct Anim *GetAnimAnotherSide(struct Anim * anim)
{
    return gAnims[(1 ^ GetAnimPosition(anim)) * 2];
}
