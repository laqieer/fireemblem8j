#include "global.h"

#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

ProcPtr ResetSysHandCursor(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_SysHandCtrl));
    return Proc_Start(ProcScr_SysHandCtrl, parent);
}

void DisplaySysHandCursorTextShadow(u32 vobj_offset, u32 pal)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
    {
        proc->enable_bmshadow = false;
        proc->chr = (vobj_offset << 0xF) >> 0x14;
        proc->pal_bank = pal & 0xF;
        Decompress(Img_PrepTextShadow, OBJ_VRAM0 + vobj_offset);
    }
}

void SetSysHandCursorXPos(int x)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
        proc->x = x;
}

void SetSysHandCursorYPos(int y)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
        proc->y = y;
}
