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



/* prototypes for same-file helpers called by this run */
void BlendWmDotPalette(int a, int b, const u16 * srcA, const u16 * srcB, u16 * dst);

//! FE8U = 0x080C2D44
void WmDotPalAnim_Loop1(struct ProcGmapRmBaPalAnim * proc)
{
    proc->timer++;

    if (proc->timer < 30)
    {
        /* srcB (Pal_WmPlaceDot_Standard - 0x10) is the adjacent Pal_WmPlaceDot_Highlight; the
         * offset is hardcoded because agbcc reuses the Standard base register, so there is no
         * byte-identical symbol form. Keep the two palettes adjacent if the layout is edited. */
        BlendWmDotPalette(proc->timer, 30, Pal_WmPlaceDot_Standard, Pal_WmPlaceDot_Standard - 0x10, gPaletteBuffer + 0x150);
        proc->flag = 0;
    }
    else
    {
        CpuCopy16(Pal_WmPlaceDot_Highlight, gPaletteBuffer + 0x150, PLTT_SIZE_4BPP);
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C2DA4
void WmDotPalAnim_Loop2(struct ProcGmapRmBaPalAnim * proc)
{
    proc->timer++;

    if (proc->timer < 30)
    {
        /* srcB (Pal_WmPlaceDot_Highlight + 0x10) is the adjacent Pal_WmPlaceDot_Standard; the
         * offset is hardcoded because agbcc reuses the Highlight base register, so there is no
         * byte-identical symbol form. Keep the two palettes adjacent if the layout is edited. */
        BlendWmDotPalette(proc->timer, 30, Pal_WmPlaceDot_Highlight, Pal_WmPlaceDot_Highlight + 0x10, gPaletteBuffer + 0x150);
    }
    else
    {
        CpuCopy16(Pal_WmPlaceDot_Standard, gPaletteBuffer + 0x150, PLTT_SIZE_4BPP);
        proc->timer = 0;
        proc->flag = 1;
        Proc_Break(proc);
    }

    return;
}

// clang-format on

//! FE8U = 0x080C2E04
ProcPtr StartWmDotPalAnim(ProcPtr parent)
{
    if (parent != NULL)
    {
        Proc_StartBlocking(ProcScr_WmDotPalAnim, parent);
    }
    else
    {
        Proc_Start(ProcScr_WmDotPalAnim, PROC_TREE_3);
    }

    // return; // BUG
}

//! FE8U = 0x080C2E28
void EndAllWmDotPalAnim(void)
{
    Proc_EndEach(ProcScr_WmDotPalAnim);
    return;
}

//! FE8U = 0x080C2E38
bool IsWmDotPalAnimActive(void)
{
    return Proc_Find(ProcScr_WmDotPalAnim) ? true : false;
}

//! FE8U = 0x080C2E50
s8 GetWmDotPalAnimFlag(void)
{
    struct ProcGmapRmBaPalAnim * proc = Proc_Find(ProcScr_WmDotPalAnim);

    if (proc != NULL)
    {
        return proc->flag;
    }

    return 0;
}
