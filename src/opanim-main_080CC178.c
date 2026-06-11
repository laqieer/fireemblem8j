#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"

#include "opanim.h"

/* prototypes for same-file helpers called by this run */
void OpAnim1_UpdateScrollOneLine(s16 index);

void OpAnim1_UpdateScroll(int new, int old)
{
    int i;
    for (i = (old >> 3) + 0x15; i < ((new >> 3) + 0x15); i++)
        OpAnim1_UpdateScrollOneLine(i);

    BG_SetPosition(2, 0, 0x60 - new);
}
