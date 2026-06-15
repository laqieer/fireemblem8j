#include "global.h"
#include "proc.h"
#include "worldmap.h"

struct GMapAutoMuProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 kind;
};

void GmapAutoMu_2(struct GMapAutoMuProc * proc)
{
    switch (proc->kind)
    {
        case 0:
        default:
            Proc_Goto(proc, 1);
            break;

        case 1:
            Proc_Goto(proc, 2);
            break;
    }

    return;
}
