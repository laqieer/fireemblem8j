#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"

#include "worldmap.h"

extern u8 gUnk_3[];

extern u8 gUnk_59[];
extern u8 gUnk_60[];
extern u8 gUnk_61;

extern u8 gWorldmapGmap_0[];  // FEB: worldmap_big_image Length:76800
extern u16 gWorldmapGmap_2[]; // FEB: worldmap_big_palette Length:128
extern u16 gWorldmapGmap_3[];

//! FE8U = 0x080BA458
u32 GMapScreen_FillBg3TileIndices(void)
{
    int iy;
    int ix;
    u16 unk;
    u16 * bgBuf;

    bgBuf = gBG3TilemapBuffer;
    unk = 0;
    for (iy = 0; iy < 0x20; iy++)
    {
        for (ix = 0; ix < 0x20; ix++)
        {
            *bgBuf = ((unk) | 0x9000);
            unk++;
            bgBuf++;
        }
    }

    // return; BUG?
}

//! FE8U = 0x080BA490
void GMapScreen_LoadTileGfx(struct GmScreenProc * proc)
{
    int i;

    for (i = 0; i < 0x20; i++)
    {
        CpuFastCopy(proc->unk_3c + (i * 0x780), (void*)(0x06008000 + (i * 0x400)), 0x400);
    }

    GMapScreen_FillBg3TileIndices();

    BG_EnableSyncByMask(BG3_SYNC_BIT);

    return;
}

//! FE8U = 0x080BA4D0
void GMapScreen_ApplyTilePalettes(struct GmScreenProc * proc)
{
    int x;
    int y;
    u8 * r5;
    u8 * r8;
    int ix;
    int iy;

    u16 * unk_40 = (proc->unk_40);

    u8 * r3 = proc->unk_44;
    r3 += (proc->unk_2e * 0x20) + (proc->unk_2d / 2);

    if ((proc->unk_2d & 1) != 0)
    {
        for (iy = 0; iy < 0x16; r3 = r8, iy++)
        {
            r5 = r3;
            y = (iy + proc->unk_2e) & 0x1f;
            for (ix = 0, r8 = r5 + 0x20; ix < 0x10; ix++)
            {
                x = (ix * 2 + (proc->unk_2d)) & 0x1f;

                *(unk_40 + (y * 0x20) + x) = (*(unk_40 + (y * 0x20) + x) & 0x00000FFF) | ((*(r5)&0xf0) + 0x90) * 0x100;

                r5++;

                *(unk_40 + (y * 0x20) + ((x + 1) & 0x1f)) =
                    (*(unk_40 + (y * 0x20) + ((x + 1) & 0x1f)) & 0x00000FFF) | (*(r5) + 9) * 0x1000;
            }
        }
    }
    else
    {
        for (iy = 0; iy < 0x16; r3 = r8, iy++)
        {
#ifndef NONMATCHING
            asm("":::"r8");
#endif
            r5 = r3;
            y = (iy + proc->unk_2e) & 0x1f;

            for (ix = 0, r8 = r5 + 0x20; ix < 0x10; ix++)
            {
                x = (ix * 2 + proc->unk_2d) & 0x1f;

                *(unk_40 + (y * 0x20) + x) = (*(unk_40 + (y * 0x20) + x) & 0x00000FFF) | (*r5 + 9) * 0x1000;

                *(unk_40 + (y * 0x20) + ((x + 1) & 0x1f)) =
                    (*(unk_40 + (y * 0x20) + ((x + 1) & 0x1f)) & 0x00000FFF) | ((*r5 & 0xf0) + 0x90) * 0x100;

                r5++;
            }
        }
    }

    BG_EnableSyncByMask(8);

    return;
}
