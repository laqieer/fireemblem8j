#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"

//! FE8U = 0x08008FB4
void SpriteTextScroll_OnIdle(struct TalkDebugProc * proc)
{
    int i;
    int j;

    u32 * vram = (void *)proc->unk_4c;

    for (i = 0; i < proc->unk_54 * 8; i += 8)
    {
        for (j = 0; j <= 0x300; j += 0x100)
        {
            (vram + i + j)[0] = (vram + i + j)[1];
            (vram + i + j)[1] = (vram + i + j)[2];
            (vram + i + j)[2] = (vram + i + j)[3];
            (vram + i + j)[3] = (vram + i + j)[4];
            (vram + i + j)[4] = (vram + i + j)[5];
            (vram + i + j)[5] = (vram + i + j)[6];
            (vram + i + j)[6] = (vram + i + j)[7];

            if (j < 0x300)
            {
                (vram + i + j)[7] = (vram + i + j)[0x100];
            }
            else
            {
                (vram + i + j)[7] = proc->unk_58;
            }
        }
    }

    proc->unk_64++;

    if (proc->unk_64 > 15)
    {
        Proc_Break(proc);
    }

    return;
}
