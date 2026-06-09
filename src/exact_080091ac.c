#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"







/* prototypes for same-file helpers called by this run */
void AP_Display(struct APHandle* handle, int x, int y);
s8 AP_ExecFrame(struct APHandle* handle);

s8 AP_Update(struct APHandle* handle, int x, int y) {
    if (!handle || !handle->pDefinition)
        return FALSE;
    
    AP_Display(handle, x, y);
    return AP_ExecFrame(handle);
}
