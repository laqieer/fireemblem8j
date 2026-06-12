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

/* prototypes for same-file helpers called by this run */
void PutBanimBgIMG(int index);
void PutBanimBgTSA(int index);
void PutBanimBgPAL(int index);

void PutBanimBG(int index)
{
    PutBanimBgIMG(index);
    CpuFastFill16(0, (void *)BG_VRAM + BG_VRAM_SIZE - 0x20, 0x20);
    PutBanimBgTSA(index);
    PutBanimBgPAL(index);

    PAL_BG_COLOR(0, 0) = RGB(0, 0, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    EnablePaletteSync();
}
