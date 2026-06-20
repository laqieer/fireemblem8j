#include "global.h"
void OnMain_SioErrorWait(void);
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "sioerror.h"
#include "constants/songs.h"

void PutSioErrorMessage(void);

//! FE8U = 0x0808DBC8
void OnMain_SioError(void) {
    SetupBackgrounds(NULL);

    m4aSoundInit();
    Proc_Init();

    BG_SetPosition(0, 0, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetDefaultColorEffects();
    SetPrimaryHBlankHandler(NULL);

    gLCDControlBuffer.mosaic = 0;

    FlushLCDControl();

    {
        u32 s = gLCDControlBuffer.mosaic & 0x10000; // any 16-bit variable for producing zero
        CpuFastFill(s, (void*)0x06000000, 0x20);
        CpuFastFill(s, (void*)0x06008000, 0x20);
    }

    PutSioErrorMessage();

    PlaySoundEffect(SONG_7B);

    SetMainUpdateRoutine(OnMain_SioErrorWait);

    return;
}
