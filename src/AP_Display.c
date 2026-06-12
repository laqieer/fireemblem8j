#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"

void AP_Display(struct APHandle* handle, int x, int y) {
    int rotScaleMask = 0;

    if (!handle || !handle->pDefinition)
        return;

    if (handle->pCurrentRotScale) {
        AP_QueueObjRotScale(handle);
        rotScaleMask = (handle->rotScaleIndex << 9);
    }

    PutSpriteExt(
        handle->objLayer,
        x | rotScaleMask, y,
        handle->pCurrentObjData,
        handle->tileBase
    );

    if (handle->pGraphics && handle->gfxNeedsUpdate)
        AP_QueueObjGraphics(handle);
}
