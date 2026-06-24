#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"

#include "worldmap.h"

//! FE8U = 0x080BA628
void GMScreenVSync_Loop(struct GMapScreenVSyncProc * proc)
{
    int i;

    if (proc->unk_38 == 0)
    {
        return;
    }

    for (i = 0; i < proc->unk_38; i++)
    {
        s8 j;

        struct Unknown_3001DA8 * ptr = &proc->unk_3c[i];

        int unk_00 = ptr->unk_00 * 8;
        int unk_02 = ptr->unk_02 & 0x1f;
        int size = (ptr->unk_04 * 0x20);

        for (j = 0; j < ptr->unk_05; j++)
        {
            void * vram = (void *)0x06008000 + (unk_02 * 0x20);
            int unk_03 = (ptr->unk_03 + j) & 0x1f;
            int unk_01 = (ptr->unk_01 + j);

            void * src = (proc->unk_2c + (((unk_01 * 0x10) - unk_01)) * 0x80) + (unk_00 * 4);
            void * dst;

            unk_03 = (unk_03 << 9);
            dst = vram + unk_03 + unk_03;

            CpuFastCopy(src, dst, size);
        }
    }

    proc->unk_38 = 0;

    return;
}
