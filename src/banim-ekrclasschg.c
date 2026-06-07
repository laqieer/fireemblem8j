#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"



void EfxClasschgCloneCallBack(void)
{
    return;
}

void NewEfxBlackInOutUnit(struct Anim * anim, int duration, int arg)
{
    struct ProcEfxClasschgInOutUnit * proc;
    proc = Proc_Start(ProcScr_efxBlackInOutUnit, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    if (arg == 0)
    {
        proc->start = 0;
        proc->end = 0x10;
    }
    else
    {
        proc->start = 0x10;
        proc->end = 0;
    }
}

void EfxBlackInOutUnitMain(struct ProcEfxClasschgInOutUnit * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, proc->start, proc->end, proc->timer, proc->terminator);
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], PAL_OBJ(0x7), 0x20);
        EfxPalBlackInOut(PAL_BG(0x0), 0x17, 0x1, ret);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], PAL_OBJ(0x9), 0x20);
        EfxPalBlackInOut(PAL_BG(0x0), 0x19, 0x1, ret);
    }

    EnablePaletteSync();

    if (++proc->timer > proc->terminator)
        Proc_Break(proc);
}

void NewEfxWhiteInOutUnit(struct Anim * anim, int duration, int arg)
{
    struct ProcEfxClasschgInOutUnit * proc;
    proc = Proc_Start(ProcScr_efxWhiteInOutUnit, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;

    if (arg == 0)
    {
        proc->start = 0;
        proc->end = 0x10;
    }
    else
    {
        proc->start = 0x10;
        proc->end = 0;
    }
}

void EfxWhiteInOutUnitMain(struct ProcEfxClasschgInOutUnit * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, proc->start, proc->end, proc->timer, proc->terminator);
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_L], PAL_OBJ(0x7), 0x20);
        EfxPalWhiteInOut(PAL_BG(0x0), 0x17, 0x1, ret);
    }
    else
    {
        CpuFastCopy(gpEfxUnitPaletteBackup[EKR_POS_R], PAL_OBJ(0x9), 0x20);
        EfxPalWhiteInOut(PAL_BG(0x0), 0x19, 0x1, ret);
    }

    EnablePaletteSync();

    if (++proc->timer > proc->terminator)
        Proc_Break(proc);
}

void NewEfxClasschgRST(struct Anim * anim, struct ProcSubEkrClasschgRST * subproc, int duration, int start, int end)
{
    struct ProcEkrClasschgRST * proc;
    gEfxBgSemaphore = gEfxBgSemaphore + 1;
    proc = Proc_Start(ProcScr_efxClasschgRST, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duration;
    proc->start = start;
    proc->end = end;
    proc->subproc = subproc;
}

void EfxClasschgRSTMain(struct ProcEkrClasschgRST * proc)
{
    struct ProcSubEkrClasschgRST * subproc = proc->subproc;
    int ret = Interpolate(INTERPOLATE_RSQUARE, proc->start, proc->end, proc->timer, proc->terminator);
    subproc->unk4C = ret;

    if (++proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
