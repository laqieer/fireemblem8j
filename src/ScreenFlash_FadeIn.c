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

void ScreenFlash_FadeIn(struct ProcScreenFlashing * proc)
{
    int r, b, g;
    proc->timer += proc->speed_fadein;

    if (proc->timer < 0x100)
    {
        r = (((0x100 - proc->timer) * 0x100) + proc->timer * proc->r) / 0x100;
        g = (((0x100 - proc->timer) * 0x100) + proc->timer * proc->g) / 0x100;
        b = (((0x100 - proc->timer) * 0x100) + proc->timer * proc->b) / 0x100;
    }
    else
    {
        r = (proc->r * (0x200 - proc->timer) + ((proc->timer - 0x100) * 0x100)) / 0x100;
        g = (proc->g * (0x200 - proc->timer) + ((proc->timer - 0x100) * 0x100)) / 0x100;
        b = (proc->b * (0x200 - proc->timer) + ((proc->timer - 0x100) * 0x100)) / 0x100;
    }

    WriteFadedPaletteFromArchive(r, g, b, proc->mask);

    if (proc->timer == 0x100)
    {
        proc->duration--;

        if (proc->duration < 1)
        {
            proc->timer = 0;
            Proc_Break(proc);
        }
    }
    else if (proc->timer == 0x200)
        proc->timer = 0;
}
