#include "global.h"
#include "hardware.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "icon.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrpopup.h"
#include "ekrlevelup.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "constants/songs.h"




void MakeBattlePopupTileMapFromTSA(u16 *tm, u16 width)
{
    u32 i;
    u16 *ekrTsaBuf = gEkrTsaBuffer;
    s32 constant = 0x1100;

    tm[0x00] = ekrTsaBuf[0x00] + constant;
    tm[0x20] = ekrTsaBuf[0x1A] + constant;
    tm[0x40] = ekrTsaBuf[0x34] + constant;
    tm[0x60] = ekrTsaBuf[0x4E] + constant;

    tm[0x01] = ekrTsaBuf[0x01] + constant;
    tm[0x21] = ekrTsaBuf[0x1B] + constant;
    tm[0x41] = ekrTsaBuf[0x35] + constant;
    tm[0x61] = ekrTsaBuf[0x4F] + constant;

    for (i = 0; i < width; i++) {
  
        tm[0x02 + i] = ekrTsaBuf[0x02 + i] + constant;
        tm[0x22 + i] = ekrTsaBuf[0x1C + i] + constant;
        tm[0x42 + i] = ekrTsaBuf[0x36 + i] + constant;
        tm[0x62 + i] = ekrTsaBuf[0x50 + i] + constant;
    }

    tm[0x02 + i] = ekrTsaBuf[0x18] + constant;
    tm[0x22 + i] = ekrTsaBuf[0x32] + constant;
    tm[0x42 + i] = ekrTsaBuf[0x4C] + constant;
    tm[0x62 + i] = ekrTsaBuf[0x66] + constant;

    tm[0x03 + i] = ekrTsaBuf[0x19] + constant;
    tm[0x23 + i] = ekrTsaBuf[0x33] + constant;
    tm[0x43 + i] = ekrTsaBuf[0x4D] + constant;
    tm[0x63 + i] = ekrTsaBuf[0x67] + constant;
}
