#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"
#include "constants/songs.h"

//! FE8U = 0x080C6090
void Title_Loop_MainLogoZoom(struct TitleScreenProc* proc) {

    Title_SetBg2AffineScale(Interpolate(1, 32, 256, proc->timer, 16));

    if (proc->timer == 16) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}
