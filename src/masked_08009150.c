#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"





static struct APHandle sAPArray[AP_MAX_COUNT];

void AP_ClearAll(void) {
    struct APHandle* it;

    const struct APHandle* base = sAPArray;
    const void*  nullDefinition = NULL;

    it = sAPArray + AP_MAX_COUNT - 1;

    do {
        (it--)->pDefinition = nullDefinition;
    } while ((int)it >= (int)base); // casts are needed for match
}
