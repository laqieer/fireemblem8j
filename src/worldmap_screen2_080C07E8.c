#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

ProcPtr StartGmNodeIconDisplay(ProcPtr parent, int chr, int palId, int unk, ProcPtr pScreenProc)
{
    struct GmNodeIconDisplayProc * proc = Proc_Start(ProcScr_GmNodeIconDisplay, parent);

    proc->chr = chr;
    proc->pal = palId;
    proc->unk_31 = unk;
    proc->pScreenProc = pScreenProc;
    proc->merge_next_node = false;
    proc->nodeId = 0;

    proc->ap = AP_Create(Sprite_0, 11);
    AP_SwitchAnimation(proc->ap, 1);
    proc->ap->tileBase = ((proc->chr + 0x1000) / CHR_SIZE) + OAM2_PAL(proc->pal) + OAM2_LAYER(2);
    return proc;
}
