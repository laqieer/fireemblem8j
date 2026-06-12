#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"
#include "constants/songs.h"

//! FE8U = 0x080C5400
void OpSubtitle_FadeOutBgm(void) {
    Sound_FadeOutBGM(4);

    return;
}
