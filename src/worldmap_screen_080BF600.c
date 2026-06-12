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
ProcPtr NewMapScreenVSync(u8 * arg0, u16 * arg1, u8 * arg2, void * arg3, void * arg4);

//! FE8U = 0x080BA764
void MapScreen_Init(struct GmScreenProc * proc)
{
    proc->flags_0 = 1;
    proc->unk_2a = 0;
    proc->y = 0;
    proc->x = 0;
    proc->unk_3a = 0;
    proc->unk_38 = 0;

    proc->unk_3c = gWorldmapGmap_0;

    proc->unk_40 = BG_GetMapBuffer(BG_3);

    Decompress(gWorldmapGmap_3, gUnk_3);
    proc->unk_44 = gUnk_3;
    proc->unk_2c = 0;
    proc->unk_2b = 0;
    proc->unk_2e = 0;
    proc->unk_2d = 0;
    proc->unk_30 = 0;
    proc->unk_2f = 0;
    proc->unk_32 = 0;
    proc->unk_31 = 0;

    ApplyPalettes(gWorldmapGmap_2, 9, 4);
    EnablePaletteSync();

    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);

    proc->unk_48 =
        NewMapScreenVSync(proc->unk_3c, proc->unk_40, proc->unk_44, gUnk_59, gUnk_60);

    return;
}
