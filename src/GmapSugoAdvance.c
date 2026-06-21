#include "global.h"
#include "proc.h"
#include "ap.h"
#include "bmlib.h"
#include "hardware.h"
#include "mapanim.h"
#include "soundwrapper.h"
#include "worldmap.h"
#include "constants/songs.h"

//! FE8U = 0x080C61AC
bool GmapSugoAdvance(s16 x, s16 y, s16 * outx, s16 * outy)
{
    int _xi = x;
    int _yi = y;
    short _x, _y;
    *&_x = GM_SCREEN->x;
    *&_y = GM_SCREEN->y;

    *outx = _xi - _x;
    *outy = _yi - _y;

    if ((u16)((_yi - _y) + 0x20) < 0xE0 && (u16)(*outx + 0x20) < 0x130)
        return true;

    return false;
}
