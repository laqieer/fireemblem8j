#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDarkGradoMapFadeOut[];

// clang-format on

//! FE8U = 0x08068D78
void StartSubSpell_efxDarkGradoMapFadeOut(void)
{
    struct ProcEfx * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoMapFadeOut, PROC_TREE_3);
    proc->timer = 0;

    return;
}
