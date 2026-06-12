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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WmPlaceDot[];

// clang-format on

//! FE8U = 0x080C2FC0
ProcPtr StartWmPlaceDot(int a, int b, int x, int y, int e, ProcPtr parent)
{
    struct ProcWmPlaceDot * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_WmPlaceDot, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_WmPlaceDot, PROC_TREE_3);
    }

    proc->unk_2b = a;
    proc->unk_2c = b;
    proc->x = x;
    proc->y = y;
    proc->unk_2a = e;

    if ((e & 2) != 0)
    {
        proc->effectProc = StartGmapEffect(0, 1);
        proc->effectProc->flags_0 = 1;
        proc->effectProc->unk_2c = x;
        proc->effectProc->unk_2e = y;
    }
    else
    {
        proc->effectProc = NULL;
    }

    proc->flag = 0;

    return proc;
}
