#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"

//! FE8U = 0x08008464
void InitTalkTextWin(int x, int y, int width, int height) {
    SetWinEnable(1, 0, 0);

    SetWin0Box((x + 1) * 8, (y + 1) * 8, (x + width - 1) * 8, (y + height - 1) * 8);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 1, 1, 1, 1);

    return;
}
