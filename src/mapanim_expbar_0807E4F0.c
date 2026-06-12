#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "m4a.h"

#include "mapanim.h"
#include "constants/songs.h"

void ProcMAExpBar_FrameAdvance(struct MAExpBarProc* proc)
{
    // TODO: SetWin0PtA macro?
    gLCDControlBuffer.win0_left   = 0;
    gLCDControlBuffer.win0_top    = 76 - proc->timer;

    // TODO: SetWin0PtB macro?
    gLCDControlBuffer.win0_right  = 240; // TODO: SCREEN_WIDTH?
    gLCDControlBuffer.win0_bottom = 76 + proc->timer;

    proc->timer += 2;

    if (proc->timer > 12) {
        SetWinEnable(0, 0, 0);
        Proc_Break(proc);
    }
}
