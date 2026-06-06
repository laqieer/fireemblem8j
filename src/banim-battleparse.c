#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "spellassoc.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "constants/classes.h"
#include "constants/items.h"

int GetBanimBackgroundIndex(u16 terrain, u16 tileset)
{
    switch (tileset) {
    case 0x01:
        return gBanimBGLut01[terrain];

    case 0x02:
        return gBanimBGLut02[terrain];

    case 0x03:
        return gBanimBGLut03[terrain];

    case 0x04:
        return gBanimBGLut04[terrain];

    case 0x05:
        return gBanimBGLut05[terrain];

    case 0x06:
        return gBanimBGLut06[terrain];

    case 0x07:
        return gBanimBGLut07[terrain];

    case 0x08:
        return gBanimBGLut08[terrain];

    case 0x09:
        return gBanimBGLut09[terrain];

    case 0x0A:
        return gBanimBGLut0A[terrain];

    case 0x0B:
        return gBanimBGLut0B[terrain];

    case 0x0C:
        return gBanimBGLut0C[terrain];

    case 0x0D:
        return gBanimBGLut0D[terrain];

    case 0x0E:
        return gBanimBGLut0E[terrain];

    case 0x0F:
        return gBanimBGLut0F[terrain];

    case 0x10:
        return gBanimBGLut10[terrain];

    case 0x11:
        return gBanimBGLut11[terrain];

    case 0x12:
        return gBanimBGLut12[terrain];

    case 0x13:
        return gBanimBGLut13[terrain];

    case 0x14:
        return gBanimBGLut14[terrain];

    case 0:
    default:
        return gBanimBGLutDefault[terrain];
    }
}
