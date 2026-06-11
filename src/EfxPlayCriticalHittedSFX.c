#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "m4a.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

void EfxPlayCriticalHittedSFX(struct Anim * anim)
{
    struct Anim * animr = GetAnimAnotherSide(anim);

    switch (GetEfxHpChangeType(anim)) {
    case EFX_HPT_CHANGED:
    case EFX_HPT_DEFEATED:
        if (CheckRoundCrit(animr) == true)
        {
            EfxPlaySE(SONG_D8, 0x100);
            M4aPlayWithPostionCtrl(SONG_D8, anim->xPosition, 1);
        }
        break;
    }
}
