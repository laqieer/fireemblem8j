#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "sioerror.h"
#include "constants/songs.h"

//! FE8U = 0x0808DC74
void OnVBlank_SioError(void);
void OnMain_SioError(void);

void StartSioErrorScreen(void) {
    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = 1;
    REG_DISPCNT = DISPCNT_MODE_0;

    SetInterrupt_LCDVBlank(OnVBlank_SioError);
    SetMainUpdateRoutine(OnMain_SioError);

    return;
}
