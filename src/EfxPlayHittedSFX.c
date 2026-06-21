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

//! FE8U = 0x08074934
void EfxPlayHittedSFX(struct Anim * anim)
{
    struct Anim * animr = GetAnimAnotherSide(anim);
    int songid = -1;
    s16 _songid;

    EfxPlayCriticalHittedSFX(anim);

    if (GetEfxHpChangeType(animr) != EFX_HPT_NOT_CHANGE && (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE))
    {
        _songid = SONG_3CF;
        EfxPlaySE(_songid, 0x100);
        M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
    }

    switch (GetEfxHpChangeType(anim)) {
    case EFX_HPT_CHANGED:
        songid = SONG_D4;
        break;

    case EFX_HPT_DEFEATED:
        songid = SONG_D5;
        break;

    case EFX_HPT_NOT_CHANGE:
        songid = SONG_2CE;
        break;

    default:
        break;
    }

    if (songid != -1)
    {
        EfxPlaySE(songid, 0x100);
        M4aPlayWithPostionCtrl(songid, anim->xPosition, 1);
    }
}
