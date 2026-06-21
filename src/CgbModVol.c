#include "global.h"
#include "gba/m4a_internal.h"

static inline int CgbPan(struct CgbChannel *chan)
{
    u32 rightVolume = chan->rightVolume;
    u32 leftVolume = chan->leftVolume;

    if ((rightVolume = (u8)rightVolume) >= (leftVolume = (u8)leftVolume))
    {
        if (rightVolume / 2 >= leftVolume)
        {
            chan->pan = 0x0F;
            return 1;
        }
    }
    else
    {
        if (leftVolume / 2 >= rightVolume)
        {
            chan->pan = 0xF0;
            return 1;
        }
    }

    return 0;
}

//! FE8U = 0x080D59C0
void CgbModVol(struct CgbChannel *chan)
{
    if (!CgbPan(chan))
    {
        chan->pan = 0xFF;
        chan->eg = (chan->rightVolume + chan->leftVolume) / 16u;
    }
    else
    {
        chan->eg = (chan->rightVolume + chan->leftVolume) / 16u;
        if (chan->eg > 15)
            chan->eg = 15;
    }
    chan->sg = (chan->eg * chan->su + 15) >> 4;
    chan->pan &= chan->panMask;
}
