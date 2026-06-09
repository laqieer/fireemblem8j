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

//! FE8U = 0x080BA6DC
s8 GMapScreenVSync_AddCopyRequest(struct GMapScreenVSyncProc * proc, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6)
{
    struct Unknown_3001DA8 * ptr;

    if (proc->unk_38 > 7)
    {
        return 1;
    }

    ptr = &proc->unk_3c[proc->unk_38];

    ptr->unk_00 = arg1;
    ptr->unk_01 = arg2;
    ptr->unk_02 = arg3;
    ptr->unk_03 = arg4;
    ptr->unk_04 = arg5;
    ptr->unk_05 = arg6;

    proc->unk_38++;

    return 0;
}
