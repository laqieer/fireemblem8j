#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

/* prototypes for same-file helpers called by this run */
void Sio_SwapBoxTransitionBuffers(void);
void Sio_RasterRotatedBoxToWinBuf(s16 * a, int b, int c, int d, int e, int f, int g, int h, int i, s16 j, u16 k);

//! FE8U = 0x0804BBA0
void Sio_BoxTransitionOpen_Loop(struct SioProc85AA7B4 * proc)
{
    int a;
    int b;

    if (proc->unk_4c == proc->unk_64)
    {
        SetPrimaryHBlankHandler(NULL);
        Proc_Break(proc);
        return;
    }

    a = Interpolate(INTERPOLATE_LINEAR, 0xa0, 0xc0, proc->unk_4c, proc->unk_64);
    b = Interpolate(INTERPOLATE_SQUARE, 0x10, 0x110, proc->unk_4c, proc->unk_64);

    InitWindowScanlineBounds(gUnk_Sio_4);
    Sio_RasterRotatedBoxToWinBuf(gUnk_Sio_4, 0, 0, DISPLAY_WIDTH, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, 0, DISPLAY_HEIGHT, a, b);
    Sio_SwapBoxTransitionBuffers();

    proc->unk_4c++;

    return;
}
