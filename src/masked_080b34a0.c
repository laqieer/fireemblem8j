#include "global.h"

#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

int GetBgXOffset(int bg)
{
    switch (bg) {
    case BG_0:
        return gLCDControlBuffer.bgoffset[BG_0].x;

    case BG_1:
        return gLCDControlBuffer.bgoffset[BG_1].x;

    case BG_2:
        return gLCDControlBuffer.bgoffset[BG_2].x;

    case BG_3:
        return gLCDControlBuffer.bgoffset[BG_3].x;
    }
}

int GetBgYOffset(int bg)
{
    switch (bg) {
    case BG_0:
        return gLCDControlBuffer.bgoffset[BG_0].y;

    case BG_1:
        return gLCDControlBuffer.bgoffset[BG_1].y;

    case BG_2:
        return gLCDControlBuffer.bgoffset[BG_2].y;

    case BG_3:
        return gLCDControlBuffer.bgoffset[BG_3].y;
    }
}
