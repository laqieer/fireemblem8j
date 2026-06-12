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


extern EWRAM_OVERLAY(banim) int gEkrPopupEnded;

void PutBanimBgTSA(int index)
{
    int _i = index * 3 + 1;
    LZ77UnCompWram(gBattleBGDataTable[_i], gEkrTsaBuffer);
    EfxTmCpyBG(gEkrTsaBuffer, gBG3TilemapBuffer, 0x1E, 0x14, 0x6, 0x0);
}
