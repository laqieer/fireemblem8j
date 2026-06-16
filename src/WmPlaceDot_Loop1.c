#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"

void PutWmDotSprite(ProcPtr proc);
s8 GetWmDotPalAnimFlag(void);

void WmPlaceDot_Loop1(ProcPtr proc)
{
    PutWmDotSprite(proc);

    if (GetWmDotPalAnimFlag() != 0)
    {
        Proc_Break(proc);
    }

    return;
}
