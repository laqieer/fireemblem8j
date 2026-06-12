#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "ctc.h"
#include "sysutil.h"
#include "bmsave.h"
#include "soundroom.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_SoundRoom_DrawSprites[];

// clang-format on

//! FE8U = 0x080B0444
ProcPtr DrawSoundRoomSprites(ProcPtr parent)
{
    return Proc_Start(gProcScr_SoundRoom_DrawSprites, parent);
}
