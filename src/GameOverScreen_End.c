#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "gbaio.h"
#include "mu.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "constants/video-global.h"
#include "uiutils.h"
#include "bmlib.h"
#include "constants/songs.h"

struct ProcGameOverScreen {
    PROC_HEADER;

    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s16 counter1;
    /* 4E */ s16 counter2;
};

void GameOverScreen_End(struct ProcGameOverScreen *proc)
{
    SetPrimaryHBlankHandler(NULL);
    SetSecondaryHBlankHandler(NULL);

    SetDispEnable(0, 0, 0, 0, 0);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();
}
