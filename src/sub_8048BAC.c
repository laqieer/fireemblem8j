#include "global.h"

#include "sio.h"
#include "sio_core.h"
#include "statscreen.h"

void sub_8048BAC(void)
{
    Proc_EndEach(ProcScr_SIOVSYNC);
    Proc_EndEach(ProcScr_SIOMAIN);
    Proc_EndEach(ProcScr_SIOCON);

    SioReleaseIrq();
    CloseHelpBox();
    Sio_ResetState();

    return;
}
