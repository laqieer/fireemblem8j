#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"





static struct APHandle sAPArray[AP_MAX_COUNT];

struct APHandle* AP_Find(const u16* definition) {
    int i = 0;
    struct APHandle* result = sAPArray;

    for (i = 0; i < AP_MAX_COUNT; ++i) {
        if (result->pDefinition == definition)
            return result;
        
        result++;
    }

    return NULL;
}
