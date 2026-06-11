#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "phasechangefx.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/songs.h"

// clang-format on

//! FE8U = 0x0804D7DC
ProcPtr StartLinkArenaResultBanner(int x, int y, ProcPtr parent)
{
    struct SioProc85AABD8 * proc;

    Proc_EndEach(ProcScr_SioUiutils_1);
    proc = Proc_Start(ProcScr_SioUiutils_1, parent);

    proc->x = x;
    proc->y = y;

    return proc;
}

//! FE8U = 0x0804D80C
void LoadLinkArenaChoiceBoxGfx(void)
{
    Decompress(gGfx_SupportMenu, (void *)(0x06016800));
    ApplyPalette(gPal_SupportMenu, 0x12);
    return;
}
