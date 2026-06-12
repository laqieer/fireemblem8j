extern int PutWmDotSprite();
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"

//! FE8U = 0x080C2F9C
void WmPlaceDot_Loop2(struct ProcWmPlaceDot * proc)
{
    PutWmDotSprite(proc);

    if (proc->flag != 0)
    {
        Proc_Break(proc);
    }

    return;
}
