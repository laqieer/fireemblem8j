#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void SetKeyStatus_IgnoreMask(int a)
{
    gKeyStatusIgnoredSt = a;
}
