#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_EfxmagicShadowshot_0[];

// clang-format on

//! FE8U = 0x0806B4E4
void StartSubSpell_efxDarkLongMonsFadeToBlack(void)
{
    Proc_Start(ProcScr_EfxmagicShadowshot_0, PROC_TREE_VSYNC);
    return;
}
