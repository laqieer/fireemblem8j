

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

//! FE8U = 0x0809FDA0
void WmSell_DrawSupplyDialogueSpriteText(void) {
    int i;

    for (i = 0; i < 4; i++) {
        PutSpriteExt(4, 48 + i * 32, 16, gObject_32x16, 0xDF80 + i * 4);
    }

    return;
}
