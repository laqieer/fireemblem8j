#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"







/* prototypes for same-file helpers called by this run */
s8 AP_ExecFrame(struct APHandle* handle);

void AP_ExecDummyFrame(struct APHandle* handle) {
    int tmp;

    // needed to match (and apparently even a thing in the source cf FE6:08013050)
    handle->frameTimer = 0;

    tmp = handle->frameInterval;

    // This sequence may have been a macro in the original source
    handle->frameTimer    = 0;
    handle->frameInterval = 0x100;

    AP_ExecFrame(handle);

    handle->frameInterval = tmp;
}
