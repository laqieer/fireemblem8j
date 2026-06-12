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
/* TU-private data externs bound at their JP addresses */
extern EventScr EventScr_EraseSaveInfo[];

// clang-format on

//! FE8U = 0x08009A00
void CallEraseSaveEvent(void)
{
    CallEvent((void *)EventScr_EraseSaveInfo, EV_EXEC_QUIET);
    return;
}
