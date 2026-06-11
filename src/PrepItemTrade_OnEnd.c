#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "icon.h"
#include "bmitemuse.h"
#include "face.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "sysutil.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809BE24
void PrepItemTrade_OnEnd(void) {
    EndMuralBackground_();
    EndFaceById(0);
    EndFaceById(1);
    return;
}
