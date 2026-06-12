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

void EfxPlaySound5AVol100(void)
{
    EfxPlaySE(SONG_5A, 0x100);
}
