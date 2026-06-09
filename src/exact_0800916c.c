#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"







/* prototypes for same-file helpers called by this run */
void AP_Init(struct APHandle* handle, const u16* definition, u16 objLayer);
struct APHandle* AP_Find(const u16* definition);

struct APHandle* AP_Create(const void* apDefinition, u16 aObjNode) {
    struct APHandle* result;

    if (!(result = AP_Find(NULL)))
        return NULL;

    AP_Init(result, apDefinition, aObjNode);
    return result;
}

void AP_Delete(struct APHandle* handle) {
    if (handle && handle->pDefinition)
        handle->pDefinition = NULL;
}
