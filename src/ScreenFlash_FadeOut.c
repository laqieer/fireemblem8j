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

void ScreenFlash_FadeOut(struct ProcScreenFlashing * proc)
{
    proc->timer += proc->speed_fadeout;

    WriteFadedPaletteFromArchive(
        ((0x100 - proc->timer) * proc->r + (proc->timer * 0x100)) / 0x100,
        ((0x100 - proc->timer) * proc->g + (proc->timer * 0x100)) / 0x100,
        ((0x100 - proc->timer) * proc->b + (proc->timer * 0x100)) / 0x100,
        proc->mask
    );

    if (proc->timer == 0x100)
        Proc_Break(proc);
}
