#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarena.h"
#include "mu.h"
#include "bmshop.h"
#include "hardware.h"
#include "face.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "uiutils.h"
#include "event.h"
#include "bm.h"
#include "bmio.h"
#include "bmmind.h"
#include "bmsave.h"
#include "bmlib.h"
#include "scene.h"
#include "mapanim.h"
#include "constants/songs.h"

//! FE8U = 0x080B5D5C
void WriteSuspendPlayerIdle(void) {
    gActionData.suspendPointType = SUSPEND_POINT_PLAYERIDLE;
    WriteSuspendSave(SAVE_ID_SUSPEND);
    return;
}
