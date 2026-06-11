#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmfx.h"

/**
 * Some white circular fade effect proc. Seems unused
 */


struct ProcWhiteCircleFx {
    PROC_HEADER;

    /* 2C */ int xPos;
    /* 30 */ int yPos;

    /* 34 */ u8 _pad_34[0x4C - 0x34];

    /* 4C */ s16 counter;
};

void ProcWhiteCircleFx_End(struct ProcWhiteCircleFx *proc)
{
    SetBlendConfig(2, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);
    ClearBg0Bg1();
}
