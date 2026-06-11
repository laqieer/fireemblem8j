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

//! FE8U = 0x080A06F0
void WmSell_OnEnd(void) {
    EndMuralBackground_();
    EndFaceById(0);
    SetPrimaryHBlankHandler(NULL);
    EndDrawPrepFundsSprite();

    return;
}
