#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"



u8 CONST_DATA sOamTileSizeLut[] =
{
    1, 1,
    2, 2,
    4, 4,
    8, 8,

    2, 1,
    4, 1,
    4, 2,
    8, 4,

    1, 2,
    1, 4,
    2, 4,
    4, 8,
};

static struct APHandle sAPArray[AP_MAX_COUNT];

/* prototypes for same-file helpers called by this run */
void AP_Delete(struct APHandle* handle);
void AP_LoadDefinition(struct APHandle* handle, const u16* definition);
void AP_ExecDummyFrame(struct APHandle* handle);

s8 AP_ExecFrame(struct APHandle* handle) {
    int tmp; // needed to match

    if (!handle || !handle->pDefinition)
        return FALSE;
    
    if (!handle->frameInterval)
        return TRUE;
    
    // timer going down
    if (handle->frameTimer != 0) {
        if ((handle->frameTimer = handle->frameTimer-1) > 0)
            return TRUE;
        
        handle->frameTimer = 0;
        handle->pAnimDataCurrent += 2;
    }

    // handle animation end
    if (!handle->pAnimDataCurrent[0]) {
        switch (handle->pAnimDataCurrent[1]) {
        case (u16)(-1): // loop back to start
            handle->pAnimDataCurrent = handle->pAnimDataStart;
            return AP_ExecFrame(handle);
        
        case 1: // delete handle
            AP_Delete(handle);
        case 0: // end animation
            return FALSE;
        }
    }

    // Increasing the subframe clock
    tmp = (handle->pAnimDataCurrent[0] * handle->frameInterval);
    handle->subframeTimer += tmp;

    // Check if next frame wasn't reached yet
    if (handle->subframeTimer < 0x100) {
        handle->frameTimer = 1;
        return AP_ExecFrame(handle);
    }

    // Setting clock values depending on subframe clock
    handle->frameTimer    = (handle->subframeTimer >> 8);
    handle->subframeTimer = (handle->subframeTimer & 0xFF);

    // Setting new frame
    handle->pCurrentObjData = handle->pFrameData + handle->pFrameData[handle->pAnimDataCurrent[1]]/2;

    // Handling RotScale data (if any)
    if (handle->pCurrentObjData[0] & 0x8000) {
        handle->pCurrentRotScale  = handle->pCurrentObjData;
        handle->pCurrentObjData += (handle->pCurrentObjData[0] & 0x7FFF)*3 + 1;
    } else {
        handle->pCurrentRotScale = NULL;
    }

    // Gfx needs update
    handle->gfxNeedsUpdate = TRUE;
    return TRUE;
}

void AP_QueueObjRotScale(struct APHandle* handle) {
    int i, count;
    const u16* it;

    if (!handle || !handle->pDefinition)
        return;
    
    if (!handle->pCurrentRotScale)
        return;
    
    count = handle->pCurrentRotScale[0] & 0x7FFF; // rotscale data count
    it    = handle->pCurrentRotScale + 1;         // rotscale data start

    for (i = 0; i < count; it += 3, i++) {
        SetObjAffine(
            handle->rotScaleIndex + i,  // oam rotscale index

            Div(+COS(it[0])*16, it[1]), // pa
            Div(-SIN(it[0])*16, it[2]), // pb
            Div(+SIN(it[0])*16, it[1]), // pc
            Div(+COS(it[0])*16, it[2])  // pd
        );
    }
}

void AP_SwitchAnimation(struct APHandle* handle, int index) {
    const u16* animDataList;

    if (!handle || !handle->pDefinition)
        return;
    
    // anim data offset array is defined by there
    // its entries are offsets relative to the table itself
    animDataList = handle->pDefinition + handle->pDefinition[1]/2;

    handle->pAnimDataStart   = animDataList + animDataList[index]/2;
    handle->pAnimDataCurrent = handle->pAnimDataStart;

    AP_ExecDummyFrame(handle);
}

void AP_SetDefinition(struct APHandle* handle, const u16* definition) {
    if (!handle || !handle->pDefinition)
        return;
    
    AP_LoadDefinition(handle, definition);
    AP_ExecDummyFrame(handle);
}

void AP_QueueObjGraphics(struct APHandle* handle) {
    const u16* itGfxData;
    const u16* itObjData;
    u32 tileOffset;
    int i;

    if (!handle || !handle->pDefinition)
        return;
    
    i = handle->pCurrentObjData[0];

    itObjData = handle->pCurrentObjData + 1;
    itGfxData = handle->pCurrentObjData + 1 + i*3;
    
    tileOffset = 0;

    // This expression is used a lot here, so using helper macro for readability
    #define OBJ_SIZE_TABLE_INDEX(aIt) ((((aIt[0] & 0xC000)>>12)+((aIt[1] & 0xC000)>>14))*2)

    while ((i--) > 0) {
        Register2dChrMove(
            handle->pGraphics + (*itGfxData & 0x3FF) * 0x20,              // source location
            OBJ_VRAM0 + ((handle->tileBase & 0x3FF) * 0x20) + tileOffset, // target location
            sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)+0],        // x size (tiles)
            sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)+1]         // y size (tiles)
        );

        if (!gLCDControlBuffer.dispcnt.obj1dMap)
            // Adding (width * sizeof(Tile4bpp))
            tileOffset += (sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)]) * 0x20;
        else
            // Using the square of the width here?
            // Maybe it's bugged, since I don't think the obj1dMap flag is ever set
            tileOffset += ((
                (sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)]) *
                (sOamTileSizeLut[OBJ_SIZE_TABLE_INDEX(itObjData)])
            )& 0x3FF) * 0x20;

        itObjData += 3;
        itGfxData += 1;
    }

    #undef OBJ_SIZE_TABLE_INDEX

    handle->gfxNeedsUpdate = FALSE;
}
