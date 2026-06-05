#include "global.h"
#include "hardware.h"
#include "icon.h"
#include "bmlib.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"





void NewEfxSpellCast(void)
{
    struct ProcEfxSpellCast *proc;

    if (GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL)
        return;
    
    proc = Proc_Start(ProcScr_efxSpellCast, PROC_TREE_4);
    proc->done = 0;
    proc->timer = 0;
    proc->terminator = 4;

    if (NULL == gpProcEfxSpellCast)
        CpuFastCopy(PAL_BG(0x6), gPal_Banim, 0x140);
    else
        Proc_End(gpProcEfxSpellCast);

    gpProcEfxSpellCast = proc;
}

void RegisterEfxSpellCastEnd(void)
{
    if (NULL == gpProcEfxSpellCast)
        return;
    
    gpProcEfxSpellCast->done = true;
}

void EndEfxSpellCast(void)
{
    ProcPtr proc = gpProcEfxSpellCast;

    if (NULL == proc)
        return;
    
    gpProcEfxSpellCast = NULL;

#if BUGFIX
    Proc_End(proc);
#else
    /* What a horrible bug.... */
    Proc_End(NULL);
#endif
}

void efxSpellCast_Loop_A(struct ProcEfxSpellCast *proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 0x8, proc->timer, proc->terminator);
    
    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}

void efxSpellCast_Loop_B(struct ProcEfxSpellCast *proc)
{
    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, 0x8);

    if (true == proc->done) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void efxSpellCast_Loop_C(struct ProcEfxSpellCast *proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0x8, 0, proc->timer, proc->terminator);

    CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
    EfxPalBlackInOut(PAL_BG(0x0), 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->timer == (proc->terminator + 1)) {
        gpProcEfxSpellCast = NULL;
        CpuFastCopy(gPal_Banim, PAL_BG(0x6), 0x140);
        EnablePaletteSync();
        Proc_Break(proc);
    }
}
