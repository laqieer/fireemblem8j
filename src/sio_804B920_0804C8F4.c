#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

//! FE8U = 0x0804BB54
void Sio_BoxTransition_Init(struct SioProc85AA7B4 * proc)
{
    gUnk_Sio_3 = gUnk_Sio_2;

    gUnk_Sio_4 = gUnk_Sio_2 - 320;
    gUnk_Sio_5 = gUnk_Sio_2;

    InitWindowScanlineBounds(gUnk_Sio_3);
    InitWindowScanlineBounds(gUnk_Sio_4);

    proc->unk_4c = 0;

    SetPrimaryHBlankHandler(Sio_BoxTransitionHBlankHandler);

    return;
}
