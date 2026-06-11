#include "global.h"
#include "m4a.h"
#include "proc.h"
#include "bmsave.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/songs.h"

void Sound_SetDefaultMaxNumChannels(void)
{
    Sound_SetMaxNumChannels(7);
    gSoundSt.maxChannels = -1;
}

void Sound_SetMaxNumChannels(int maxchn)
{
    gSoundSt.maxChannels = maxchn;
    m4aSoundMode(maxchn << SOUND_MODE_MAXCHN_SHIFT);
}
