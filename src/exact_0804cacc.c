#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

/* prototypes for same-file helpers called by this run */
void Sio_StartBoxTransitionOpen(int a, ProcPtr parent);

//! FE8U = 0x0804BD2C
void Sio_StartBoxTransitionOpenDefault(ProcPtr parent)
{
    Sio_StartBoxTransitionOpen(0x40, parent);
    return;
}
