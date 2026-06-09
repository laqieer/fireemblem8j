#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x080668DC
void efxMaohFlashBG2_FillTilemapRightEdge(void)
{
    int ix;
    int iy;

    for (iy = 0; iy < 16; iy++)
    {
        for (ix = 0; ix < 3; ix++)
        {
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + ix, iy)] = gBG1TilemapBuffer[TILEMAP_INDEX(28, iy)];
        }
    }

    return;
}
