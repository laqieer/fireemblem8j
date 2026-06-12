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
extern struct ProcCmd ProcScr_EfxmagicGleipnir_0[];

// clang-format on

//! FE8U = 0x080696F0
void StartSubSpell_efxDarkGradoPalFlash(void)
{
    Proc_Start(ProcScr_EfxmagicGleipnir_0, PROC_TREE_VSYNC);
    return;
}
