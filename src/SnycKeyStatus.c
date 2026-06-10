#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

// unreferenced
void SnycKeyStatus(struct KeyStatusBuffer *keyStatus)
{
    keyStatus->newKeys = 0;
    keyStatus->repeatedKeys = 0;
    keyStatus->heldKeys = 0;
}
