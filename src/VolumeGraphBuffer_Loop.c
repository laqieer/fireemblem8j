#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"

extern struct Unknown_08A212DC * gSoundroom_2;
extern struct SoundInfo * gpSoundInfo;
#include "gba/m4a_internal.h"

extern int UpdateVolumeGraphBuffer();
struct VolumeGraphBufferProc { PROC_HEADER; int unk_2c; };
struct Unknown_08A212DC { u8 x; u8 y; } __attribute__((packed));

//! FE8U = 0x080AF22C
void VolumeGraphBuffer_Loop(struct VolumeGraphBufferProc * proc)
{
    int i;

    u8 r7 = 0;
    u8 r5 = 0;
    u8 r8 = -1;
    u8 ip = -1;

    for (i = 0; i < 0xe0; i++)
    {
        gSoundroom_2[i].x = (u8)(gpSoundInfo->pcmBuffer[PCM_DMA_BUF_SIZE + proc->unk_2c] - 0x80) >> 1;
        gSoundroom_2[i].y = 0xf0 - ((u8)((gpSoundInfo->pcmBuffer[proc->unk_2c]) - 0x80) >> 1);

        r5 = r5 > gSoundroom_2[i].x ? r5 : gSoundroom_2[i].x;
        ip = ip < gSoundroom_2[i].x ? ip : gSoundroom_2[i].x;

        r7 = r7 > gSoundroom_2[i].y ? r7 : gSoundroom_2[i].y;
        r8 = r8 < gSoundroom_2[i].y ? r8 : gSoundroom_2[i].y;

        proc->unk_2c++;
        if (proc->unk_2c >= PCM_DMA_BUF_SIZE)
        {
            proc->unk_2c -= PCM_DMA_BUF_SIZE;
        }
    }

    r5 = (r5 - ip) < 0x3f ? r5 - ip : 0x3f;
    r7 = (r7 - r8) < 0x3f ? r7 - r8 : 0x3f;

    UpdateVolumeGraphBuffer(0, (r5 * 3) / 4);
    UpdateVolumeGraphBuffer(1, (r7 * 3) / 4);

    return;
}
