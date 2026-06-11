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

int IsAnimSoundInPositionMaybe(struct Anim * anim)
{
    int sound_pos = GetProperAnimSoundLocation(anim) + anim->xPosition;
    if (GetAnimPosition(anim) == POS_L)
    {
        if (sound_pos > 0x58)
            return false;
        else
            return true;
    }
    else
    {
        if (sound_pos <= 0x97)
            return false;
        else
            return true;
    }
}
