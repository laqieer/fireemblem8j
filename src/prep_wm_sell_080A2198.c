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

//! FE8U = 0x0809FEFC
void WmSell_DrawSellOptionSpriteText(void) {
    PrepItemDrawPopupBox(160, 91, 8, 4, 0x8840);

    PutSpriteExt(4, 176, 94, gObject_32x16, 0xB088);
    PutSpriteExt(4, 208, 94, gObject_32x16, 0xB08C);
    PutSpriteExt(4, 168, 110, gObject_32x16, 0xB080);
    PutSpriteExt(4, 200, 110, gObject_32x16, 0xB084);

    return;
}
