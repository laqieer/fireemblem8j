#include "global.h"

#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"

#include "constants/songs.h"

//! JP = 0x080936B0 (region-different: plays 0x6a if solo-anim turned on, else 0x6b)
void UnitList_ToggleSoloAnimState(struct Unit * unit, int step)
{
    int animState;

    if ((UNIT_CATTRIBUTES(unit) & CA_SUPPLY) != 0)
    {
        PlaySoundEffect(SONG_6C);
        return;
    }

    animState = (unit->state & US_SOLOANIM) >> 14;
    animState = (animState + step + 3) % 3;
    animState = animState << 14;

    unit->state = (unit->state & ~US_SOLOANIM) | animState;

    if ((animState & US_SOLOANIM) != 0)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
    }
    else
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    }

    return;
}
