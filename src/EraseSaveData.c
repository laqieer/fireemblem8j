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

//! FE8U = 0x08048838
void EraseSaveData(void)
{
    InitGlobalSaveInfodata();

    EraseSaveRankData();
    EraseSoundRoomSaveData();
    EraseLinkArenaStruct2();

    return;
}
