#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"







/* prototypes for same-file helpers called by this run */
void AP_Delete(struct APHandle* handle);

void APProc_OnEnd(struct APProc* proc) {
    // Free AP when proc ends
    AP_Delete(proc->pHandle);
}

void APProc_SetParameters(struct APProc* proc, int x, int y, int tileBase) {
    // Set position
    proc->xPosition = x;
    proc->yPosition = y;

    // Set tile base if asked to
    if (tileBase != -1)
        proc->pHandle->tileBase = tileBase;
}
