#include "global.h"
#include "bmfx.h"
#include "ap.h"
#include "proc.h"
#include "bmlib.h"
#include "bmunit.h"
#include "mapanim.h"
#include "hardware.h"
#include "constants/songs.h"

void ShinningStonefx_InitGfx(struct ProcShinningStonefx * proc)
{
    PlaySeSpacial(SONG_8D, proc->x);
    Decompress(Img_MapAnimUnlockObjfx, OBJ_VRAM0 + 0x3800);
    ApplyPalette(Pal_MapAnimUnlockObjfx, 0x14);
    proc->timer = 1;
}

void ShinningStonefx_CreateSpriteAnim(struct ProcShinningStonefx * proc)
{
    if (++proc->timer > 0x1D)
    {
        proc->timer = 0;
        Proc_Break(proc);

        APProc_Create(ApConf_MapanimTorchAnim_0, proc->x, proc->y, 0x41C0, 0, 2);
        APProc_Create(ApConf_MapanimTorchAnim_0, proc->x, proc->y, 0x41C0, 1, 2);
    }
}

void ShinningStonefx_Delay(struct ProcShinningStonefx * proc)
{
    if (++proc->timer > 0x1D)
        Proc_Break(proc);
}
