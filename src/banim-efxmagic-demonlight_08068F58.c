#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off



//! FE8U = 0x08066BBC
void efxMaohFlashWOUT_Loop_B(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    Proc_Break(proc);
    return;
}
