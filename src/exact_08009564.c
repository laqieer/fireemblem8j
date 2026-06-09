#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"







void AP_LoadDefinition(struct APHandle* handle, const u16* definition) {
    handle->pDefinition = definition;

    // frame data starts at offset in short 0
    handle->pFrameData = definition + (definition[0]/2);
    
    // anim offset array starts at offset in short 1
    // first entry is default anim index
    // anim data is located by indexing the anim offset array.
    // offset is relative to the anim offset array itself, not the definition!

    handle->pAnimDataStart = (
        (definition + definition[1]/2) +  // anim offset array
        (definition[definition[1]/2]/2)   // default anim offset array index
    );

    handle->pAnimDataCurrent = handle->pAnimDataStart;
}
