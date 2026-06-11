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

//! FE8U = 0x0804CD90
ProcPtr StartNameEntrySpriteDraw(ProcPtr parent, int x, int y)
{
    struct NameEntrySpriteDrawProc * proc;

    Proc_EndEach(ProcScr_NameEntrySpriteDraw);
    proc = Proc_Start(ProcScr_NameEntrySpriteDraw, parent);

    proc->xNew = x;
    proc->xCurrent = x;

    proc->yNew = y;
    proc->yCurrent = y;

    proc->cursorKind = 0;
    proc->xPointer = 0;
    proc->unk_44 = 1;

    return proc;
}
