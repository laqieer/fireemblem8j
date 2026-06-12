#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"

extern struct ProcCmd CONST_DATA ProcScr_TacticianNameSelection[];

extern const struct TacticianTextConf gTacticianTextConf[];

extern const s16 SioTacticianIndexMap[];

extern const int gLinkArenaStatusMsg[];

//! FE8U = 0x080451F0
void Tactician_OnEnd(void)
{
    EndMuralBackground();

    if (!CheckInLinkArena())
    {
        Nop_SioUiutils_0();
    }

    return;
}
