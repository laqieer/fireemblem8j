#include "global.h"
#include "variables.h"
#include "functions.h"
#include "proc.h"
#include "bmmap.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "bmfx.h"
#include "constants/songs.h"




void EndEventEarthQuake(void)
{
    struct ProcBmFx * proc;
    proc = Proc_Find(ProcScr_EventEarthQuake);
    if (!proc)
        return;

    switch (proc->type) {
    case 0:
        (u16)gBmSt.camera.x &= 0xFFFC;
        (u16)gBmSt.camera.y &= 0xFFFC;
        break;

    case 1:
        BG_SetPosition(3, 0, 0);
    }

    Proc_EndEach(ProcScr_EventEarthQuake);
    Sound_FadeOutSE(4);
}
