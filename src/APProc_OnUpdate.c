#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"

void APProc_OnUpdate(struct APProc* proc) {
    // Update AP, and end proc if the AP was freed (aka the animation ended)
    if (!AP_Update(proc->pHandle, proc->xPosition, proc->yPosition))
        if (!proc->pHandle || !proc->pHandle->pDefinition)
            Proc_End(proc);
}
