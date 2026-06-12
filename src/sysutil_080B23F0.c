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

ProcPtr NewSysGrayBox(u32 vobj_offset, u32 pal, ProcPtr parent)
{
    struct ProcSysGrayBox * proc =
        Proc_Start(ProcScr_SysGrayBox, parent);

    Decompress(Img_SysGrayBox, OBJ_VRAM0 + vobj_offset);
    ApplyPalette(PAL_BG(1), pal + 0x10);
    proc->chr = (vobj_offset << 0xF) >> 0x14;
    proc->pal = pal;
    return proc;
}
