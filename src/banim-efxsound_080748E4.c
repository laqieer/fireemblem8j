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

extern EWRAM_OVERLAY(banim) int gEkrMainBgmPlaying;
extern EWRAM_OVERLAY(banim) int gEfxSoundSeExist;

extern CONST_DATA struct ProcCmd ProcScr_efxSoundSE[];

s16 GetEfxHpChangeType(struct Anim * anim)
{
    int offset, hp1, hp2;
    offset = gEfxHpLutOff[GetAnimPosition(anim)];
    offset = offset * 2 + GetAnimPosition(anim);

    hp1 = GetEfxHp(offset);
    hp2 = GetEfxHp(offset + 2);

    if (hp1 != hp2)
    {
        /* Hurt */
        if (hp2 != 0)
            return EFX_HPT_CHANGED;

        /* Defeated */
        return EFX_HPT_DEFEATED;
    }
    /* Hp not change */
    return EFX_HPT_NOT_CHANGE;
}
