#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void ResetKeyStatus(struct KeyStatusBuffer *keyStatus)
{
    keyStatus->repeatDelay = 12;
    keyStatus->repeatInterval = 4;
    keyStatus->prevKeys = 0;
    keyStatus->heldKeys = 0;
    keyStatus->newKeys = 0;
    keyStatus->repeatTimer = 0;
    keyStatus->TimeSinceStartSelect = 0;
    gKeyStatusIgnoredSt = 0;
}
