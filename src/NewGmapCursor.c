#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapCursor[];

// clang-format on

//! FE8U = 0x080BBBC4
ProcPtr NewGmapCursor(ProcPtr parent, int chr, int pal, ProcPtr pScreenProc)
{
    struct GmapCursorProc * proc = Proc_Start(gProcScr_GmapCursor, parent);

    proc->chr = chr;
    proc->pal = pal;
    proc->pScreenProc = pScreenProc;

    return proc;
}
