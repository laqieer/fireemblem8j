#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

/* prototypes for same-file helpers called by this run */
void Sio_StartBoxTransitionClose(int a, ProcPtr parent);

//! FE8U = 0x0804BE88
void Sio_StartBoxTransitionCloseDefault(ProcPtr parent)
{
    Sio_StartBoxTransitionClose(0x40, parent);
    return;
}
