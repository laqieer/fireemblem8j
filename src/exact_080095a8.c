#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"







/* prototypes for same-file helpers called by this run */
s8 AP_ExecFrame(struct APHandle* handle);
void AP_LoadDefinition(struct APHandle* handle, const u16* definition);

void AP_Init(struct APHandle* handle, const u16* definition, u16 objLayer) {
    AP_LoadDefinition(handle, definition);

    handle->pGraphics  = NULL;
    handle->tileBase   = 0;
    handle->frameTimer = 0;

    handle->objLayer = objLayer;

    handle->pCurrentRotScale = NULL;
    handle->rotScaleIndex    = 0;

    // this is the second time this exact pattern shows. (Macro?)
    handle->frameTimer    = 0;
    handle->frameInterval = 0x100;

    handle->subframeTimer = 0;

    AP_ExecFrame(handle);
}
