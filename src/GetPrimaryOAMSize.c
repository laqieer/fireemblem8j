#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

int GetPrimaryOAMSize(void)
{
    return sOamLo.count;
}
