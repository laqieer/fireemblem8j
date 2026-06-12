#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

//! FE8U = 0x0805AE58
void RegisterBanimTerrainTm(struct BanimUnkStructComm * buf)
{
    int tmp;
    int offsetC;

    int offsetA = 0;
    int offsetB = 0;

    u16 * tmA = TsaConfs_BanimTmA[buf->distance * 2 + 0];
    u16 * tmB = TsaConfs_BanimTmA[buf->distance * 2 + 1];

    EfxTmFillA(0);

    switch (buf->distance)
    {
        case 0:
        case 4:
            offsetA = 33;
            offsetB = 48;

            offsetC = 0;

            break;

        case 1:
            offsetA = 29;
            offsetB = 48;

            if (gEkrInitPosReal == 1)
            {
                offsetC = 0;
            }
            else
            {
                offsetC = -4;
            }

            break;

        case 2:
            offsetA = 3;
            offsetB = 48;

            if (gEkrInitPosReal == 1)
            {
                offsetC = 0;
            }
            else
            {
                offsetC = -30;
            }

            break;

        case 3:
        default:
            if (buf->terrain_l != -1)
            {
                offsetA = 39;
                offsetB = 3;
            }

            if (buf->terrain_r != -1)
            {
                offsetA = 3;
                offsetB = 42;
            }

            offsetC = 0;

            break;
    }

    tmp = 0x35A;

    EfxTmCpyExt(tmA, -1, gTmA_Banim + 0x35A + offsetA, 0x42, 0xf, 5, buf->pal_l, buf->chr_l);
    EfxTmCpyExt(tmB, -1, gTmA_Banim + 0x35A + offsetB, 0x42, 0xf, 5, buf->pal_r, buf->chr_r);

    EfxTmCpyExt((gTmA_Banim + tmp + offsetC) - 0x2B5, 0x42, gBG2TilemapBuffer, 0x20, 0x20, 0x14, -1, -1);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}
