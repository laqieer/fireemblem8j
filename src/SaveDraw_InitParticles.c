#include "global.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "savemenu.h"

//! FE8U = 0x080B0004
void SaveDraw_InitParticles(void) {
    int i;

    for (i = 0; i <= 0x13; i++) {
        gSavedraw_0[i].unk_0e = 0;
        gSavedraw_0[i].unk_04 = 0xa0;
        gSavedraw_0[i].unk_00 = 0xa0;
        gSavedraw_0[i].unk_0a = 0;
        gSavedraw_0[i].unk_08 = 0;
    }

    return;
}
