#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/faces.h"
#include "constants/songs.h"

//! FE8U = 0x0809FF74
void WmSell_DrawValueSpriteText(void) {
    PutSpriteExt(4, 136, 72, gObject_32x16, 0xB090);
    PutSpriteExt(4, 168, 72, gObject_8x16, 0xB094);
    return;
}
