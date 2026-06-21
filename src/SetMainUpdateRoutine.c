#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

//! FE8U = 0x0800012D8
void SetMainUpdateRoutine(void (*func)(void))
{
    gMainCallback = func;
}
