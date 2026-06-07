#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "ctc.h"

#include "efxbattle.h"

// clang-format off



ProcPtr NewEfxHitQuakePure(void)
{
    return Proc_Start(ProcScr_EfxHitQuakePure, PROC_TREE_3);
}
