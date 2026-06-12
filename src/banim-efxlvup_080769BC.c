#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrlevelup.h"
#include "hardware.h"
#include "mapanim.h"
#include "ctc.h"
#include "bmlib.h"

ProcPtr NewEfxPartsofScroll(void)
{
    struct ProcEfx * proc =
        Proc_Start(ProcScr_EfxPartsofScroll, PROC_TREE_3);

    proc->timer = 0;
    proc->step = 0;
    return proc;
}
