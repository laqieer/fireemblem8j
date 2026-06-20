#include "global.h"

#include "hardware.h"
#include "uimenu.h"

extern inline void SyncMenuBgs(struct MenuProc * proc)
{
    BG_EnableSyncByMask(BG_SYNC_BIT(proc->backBg) + BG_SYNC_BIT(proc->frontBg));
}

void ClearMenuBgs(struct MenuProc * proc)
{
    BG_Fill(BG_GetMapBuffer(proc->frontBg), 0);
    BG_Fill(BG_GetMapBuffer(proc->backBg), 0);

    SyncMenuBgs(proc);
}
