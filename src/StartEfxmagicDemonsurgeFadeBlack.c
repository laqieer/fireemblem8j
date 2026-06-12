#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_EfxmagicDemonsurge_1[];

// clang-format on

//! FE8U = 0x0806BBDC
void StartEfxmagicDemonsurgeFadeBlack(void)
{
    Proc_Start(ProcScr_EfxmagicDemonsurge_1, PROC_TREE_VSYNC);
    return;
}
