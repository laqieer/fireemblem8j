#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

extern EWRAM_DATA ProcPtr gpActiveClassReelSpellProc;
extern EWRAM_DATA ProcPtr gpActiveCRSpellBgColorProc;

//! FE8U = 0x0806F668
void efxopMyrrh_Loop_Main(ProcPtr proc)
{
    struct BattleAnim * banim = banim_data;
    LZ77UnCompWram(banim[197 - 1].pal, gPal_Banim);

    CpuFastCopy(gPal_Banim + 0x10, gPaletteBuffer + 0x120, PLTT_SIZE_4BPP);
    CpuFastCopy(gPal_Banim + 0x10, gPaletteBuffer + 0x130, PLTT_SIZE_4BPP);

    EnablePaletteSync();

    Proc_Break(proc);

    return;
}
