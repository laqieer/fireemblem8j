#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "icon.h"
#include "hardware.h"
#include "mapanim.h"
#include "helpbox.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "sysutil.h"
#include "constants/songs.h"

void PrepItemUseBooster_IDLE(struct ProcPrepItemUseBooster * proc)
{
    PrepItemDrawPopupBox(proc->xpos, proc->ypos, proc->width, proc->height, 0xA440);

    if (--proc->timer == 0 || gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
        Proc_Break(proc);
}
