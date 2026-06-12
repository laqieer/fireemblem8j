#include "global.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"
#include "uiutils.h"
#include "bmlib.h"
#include "bm.h"

void EkrHenseiEnd_Init(struct ProcEkrHensei *proc)
{
    CpuFastCopy(PAL_BG(0), gEfxPal, 0x400);

    proc->timer = 0;
    proc->terminator = 0x10;

    Proc_Break(proc);
}
