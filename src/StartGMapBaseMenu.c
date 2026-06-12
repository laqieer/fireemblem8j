#include "global.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapBaseMenu[];

// clang-format on

//! FE8U = 0x080C400C
ProcPtr StartGMapBaseMenu(int kind, ProcPtr parent)
{
    struct GMapBaseMenuProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapBaseMenu, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapBaseMenu, PROC_TREE_3);
    }

    proc->kind = kind;

    // return; BUG
}
