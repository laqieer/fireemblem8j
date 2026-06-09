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

// FIXME - param
//! FE8U = 0x0804CDD0
void UpdateNameEntrySpriteDraw(void * proc, int xNew, int yNew, int xPointer, int cursorKind, int f)
{
    struct NameEntrySpriteDrawProc * param_1 = proc;

    param_1->xNew = xNew;
    param_1->yNew = yNew;
    param_1->cursorKind = cursorKind;
    param_1->xPointer = xPointer;
    param_1->unk_44 = f;

    return;
}
