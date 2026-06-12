#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "constants/songs.h"

//! FE8U = 0x080C540C
void OpSubtitle_ResetBg1Position(void) {
    BG_SetPosition(1, 0, 0);

    return;
}
