#include "global.h"

#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

/* prototypes for same-file helpers called by this run */
void MixPaletteCore(struct ProcMixPalette * proc, int val);

void MixPalette_Loop(struct ProcMixPalette * proc)
{
    proc->timer += proc->speed;

    if (proc->timer > 0x100)
        proc->timer = 0;

    MixPaletteCore(proc, proc->timer < 0x80 ? proc->timer : 0x100 - proc->timer);
}
