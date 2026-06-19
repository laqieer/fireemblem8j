#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"
extern struct ProcCmd gMapanimEventcall_18[];

// clang-format on

//! FE8U = 0x08080474
void StartDemonKingSummonAnim(ProcPtr parent)
{

    if (parent != NULL)
    {
        Proc_StartBlocking(gMapanimEventcall_18, parent);
    }
    else
    {
        Proc_Start(gMapanimEventcall_18, PROC_TREE_3);
    }

    return;
}
