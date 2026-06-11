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

/* prototypes for same-file helpers called by this run */
void EndSysBrownBox(void);

void StartSysBrownBox(int layer, u32 vobj_offset, int pal, u16 oam2, u16 y, ProcPtr parent)
{
    u32 oam2_chr, oam2_pal;
    struct ProcSysBrownBox * proc;

    EndSysBrownBox();
    proc = Proc_Start(ProcScr_SysBrownBox, parent);
    Decompress(Img_SysBrownBox, OBJ_VRAM0 + vobj_offset);
    ApplyPalette(Pal_SysBrownBox, pal + 0x10);

    oam2_chr = (vobj_offset << 0xF) >> 0x14;
    oam2_pal = OAM2_PAL(pal);

    proc->oam2 = oam2 + (oam2_chr + oam2_pal);
    proc->y = y;
    proc->layer = layer;
}

void EnableSysBrownBox(int index, int x, int y, int frame)
{
    struct ProcSysBrownBox * proc =
        Proc_Find(ProcScr_SysBrownBox);

    proc->priv[index].valid = true;
    proc->priv[index].x = x & 0x1FF;
    proc->priv[index].y = y & 0x0FF;
    proc->priv[index].frame = frame;
}

void DisableSysBrownBox(int index)
{
    struct ProcSysBrownBox * proc =
        Proc_Find(ProcScr_SysBrownBox);

    if (proc)
        proc->priv[index].valid = false;
}
