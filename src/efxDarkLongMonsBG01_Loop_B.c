#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0806B11C
void efxDarkLongMonsBG01_Loop_B(struct ProcEfxBG * proc)
{
    SetPrimaryHBlankHandler(NULL);
    Proc_Break(proc);
    return;
}
