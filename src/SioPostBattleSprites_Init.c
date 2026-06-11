#include "global.h"
#include "face.h"
#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmio.h"
#include "prepscreen.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

// clang-format on

//! FE8U = 0x08045208
void SioPostBattleSprites_Init(struct SioPostBattleSpritesProc * proc)
{
    UnpackFaceChibiSprGraphics(proc->fid, proc->oam2 * 8 + 0x180, proc->oam2 + 10);
    proc->timer = 0;
    proc->y = -38;
    return;
}
