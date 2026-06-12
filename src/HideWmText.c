#include "global.h"
#include "ctc.h"
#include "scene.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldMapTextHandler[];

struct GMapTextProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 drawAtBottom;
    /* 2A */ u8 visible;
};

//! FE8U = 0x0800CDC8
void HideWmText(void)
{
    struct GMapTextProc * proc = Proc_Find(ProcScr_WorldMapTextHandler);

    if (proc != NULL)
    {
        gWmHblankStatus &= ~1;
        proc->visible = 0;
    }

    return;
}
