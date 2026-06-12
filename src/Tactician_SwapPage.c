#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"

//! FE8U = 0x0804503C
void Tactician_SwapPage(struct ProcTactician * proc)
{
    proc->text_idx++;
    proc->text_idx &= 1;

    Tactician_DrawCharGrid(proc);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    proc->unk3A = 0;

    return;
}
