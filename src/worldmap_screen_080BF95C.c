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

/* prototypes for same-file helpers called by this run */
u32 GMapScreen_FillBg3TileIndices(void);
void GMapScreen_ApplyTilePalettes(struct GmScreenProc * proc);
void GMapScreenVSync_RequestFullCopy(ProcPtr proc, int a, int b);
void GMapScreen_UpdateScroll(struct GmScreenProc * proc);

//! FE8U = 0x080BAB0C
void GMapScreen_Loop(struct GmScreenProc * proc)
{
    if (!(proc->flags_0))
    {
        return;
    }

    proc->x = gGMData.xCamera;
    proc->y = gGMData.yCamera;

    if (gGMData.xCamera < 0)
    {
        proc->x = 0;
    }
    else if (gGMData.xCamera > 0xf0)
    {
        proc->x = 0xf0;
    }

    if (proc->y < 0)
    {
        proc->y = 0;
    }

    proc->unk_2d = proc->x / 8;
    proc->unk_2e = proc->y / 8;

    if (proc->unk_2a & 4)
    {
        ApplyPalettes(gWorldmapGmap_2, 9, 4);
        proc->unk_2a &= ~4;
    }

    if (proc->unk_2a & 2)
    {
        GMapScreenVSync_RequestFullCopy(proc->unk_48, proc->unk_2d, proc->unk_2e);
        proc->unk_2a &= ~2;
    }

    if (proc->unk_2a & 1)
    {
        GMapScreen_FillBg3TileIndices();
        GMapScreen_ApplyTilePalettes(proc);
        proc->unk_2a &= ~1;
    }

    GMapScreen_UpdateScroll(proc);
    BG_SetPosition(BG_3, proc->x, proc->y);

    proc->unk_38 = proc->x;
    proc->unk_3a = proc->y;

    return;
}
