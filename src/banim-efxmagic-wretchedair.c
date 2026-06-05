#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x08068AFC
void SpellFx_WriteBgMapFillEdges(struct Anim * anim, u16 * tsaL, u16 * tsaR, u8 unk)
{
    SpellFx_WriteBgMap(anim, tsaL, tsaR);

    if (GetAnimPosition(anim) == 0)
    {
        unk = (unk + 1) & 1;
    }

    if (unk != 0)
    {
        int i;

        for (i = 0; i < 20; i++)
        {
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + 1, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(29 + 0, i)];
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + 2, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(29 + 0, i)];

            if (gEkrDistanceType != 0)
            {
                gBG1TilemapBuffer[TILEMAP_INDEX(0, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(29 + 0, i)];
            }
        }
    }
    else
    {
        int i;

        for (i = 0; i < 20; i++)
        {
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + 1, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(0, i)];
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + 2, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(0, i)];

            if (gEkrDistanceType != 0)
            {
                gBG1TilemapBuffer[TILEMAP_INDEX(29, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(0, i)];
            }
        }
    }

    return;
}
