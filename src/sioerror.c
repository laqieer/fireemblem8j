

#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"

#include "sioerror.h"
#include "constants/songs.h"

//! FE8U = 0x0808DAE4
void OnVBlank_SioError(void) {
    INTR_CHECK = 1;

    FlushLCDControl();
    FlushBackgrounds();
    FlushTiles();
    m4aSoundVSync();
    m4aSoundMain();

    return;
}

//! FE8U = 0x0808DB08
void OnMain_SioErrorWait(void) {
    UpdateKeyStatus(gKeyStatusPtr);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON)) {
        SoftReset(0xff);
    }

    VBlankIntrWait();

    return;
}
