extern int ClearWmTextVram();
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

// clang-format on

//! FE8U = 0x080C3624
void ShowWmText(u8 atBottom)
{
    struct GMapTextProc * proc = Proc_Find(ProcScr_WorldMapTextHandler);

    if (proc != NULL)
    {
        ClearWmTextVram();
        gWmHblankStatus &= ~1;
        proc->drawAtBottom = atBottom;
        proc->visible = 1;
    }

    return;
}
