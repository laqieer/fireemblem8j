

#include "global.h"

#include "fontgrp.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmsave.h"
#include "scene.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "agb_sram.h"
#include "sram-layout.h"
#include "face.h"
#include "event.h"

#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

/**
 * Contains Link Arena functions that are called by events
 */



//! FE8U = 0x08048260
void StartTacticianNameEntry(ProcPtr parent)
{
    struct ProcTactician * proc = Proc_StartBlocking(ProcScr_TacticianNameSelection, parent);
    proc->unk33 = 7;
    proc->unk32 = 0;

    return;
}

//! FE8U = 0x08048280
void StartTacticianNameSelect(ProcPtr parent)
{
    struct ProcTactician * proc;

    LoadLegacyUiFrameGraphics();
    UnsetBmStLinkArenaFlag();

    InitTextFont(&Font_0, (void *)(0x06001800), 0xc0, 0);

    gLinkArenaSt.unk_05 = 0;
    gLinkArenaSt.unk_03 = 0;
    gLinkArenaSt.unk_01 = 0;

    gPlaySt.config.windowColor = 0;

    proc = Proc_StartBlocking(ProcScr_TacticianNameSelection, parent);
    proc->unk33 = 5;
    proc->unk32 = 1;

    return;
}
