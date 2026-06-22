#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

void StartSpellAnimation(struct Anim *anim)
{
    int index = gEkrSpellAnimIndex[GetAnimPosition(anim)];

#if BUGFIX
    if (gEkrSpellAnimLut[index](anim) == NULL)
        return;
#endif

    gEkrSpellAnimLut[index](anim);
}
