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

static inline s8 _GetBanimTerrainGround(u16 terrain, u16 tileset)
{
    switch (tileset) {
    case 0x01:
        return BanimTerrainGround_Tileset01[terrain];

    case 0x02:
        return BanimTerrainGround_Tileset02[terrain];

    case 0x03:
        return BanimTerrainGround_Tileset03[terrain];

    case 0x04:
        return BanimTerrainGround_Tileset04[terrain];

    case 0x05:
        return BanimTerrainGround_Tileset05[terrain];

    case 0x06:
        return BanimTerrainGround_Tileset06[terrain];

    case 0x07:
        return BanimTerrainGround_Tileset07[terrain];

    case 0x08:
        return BanimTerrainGround_Tileset08[terrain];

    case 0x09:
        return BanimTerrainGround_Tileset09[terrain];

    case 0x0A:
        return BanimTerrainGround_Tileset0A[terrain];

    case 0x0B:
        return BanimTerrainGround_Tileset0B[terrain];

    case 0x0C:
        return BanimTerrainGround_Tileset0C[terrain];

    case 0x0D:
        return BanimTerrainGround_Tileset0D[terrain];

    case 0x0E:
        return BanimTerrainGround_Tileset0E[terrain];

    case 0x0F:
        return BanimTerrainGround_Tileset0F[terrain];

    case 0x10:
        return BanimTerrainGround_Tileset10[terrain];

    case 0x11:
        return BanimTerrainGround_Tileset11[terrain];

    case 0x12:
        return BanimTerrainGround_Tileset12[terrain];

    case 0x13:
        return BanimTerrainGround_Tileset13[terrain];

    case 0x14:
        return BanimTerrainGround_Tileset14[terrain];

    case 0:
    default:
        return BanimTerrainGroundDefault[terrain];
    }
}

//! FE8U = 0x08058BF4
int GetBanimTerrainGround(u16 terrain, u16 tileset)
{
    int ret = _GetBanimTerrainGround(terrain, tileset);
    return ret - 1;
}
