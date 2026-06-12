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

void PutBanimBgIMG(int index)
{
    int _i = index * 3;
    LZ77UnCompVram(gBattleBGDataTable[_i], (void *)BG_VRAM + 0x8000);
}
