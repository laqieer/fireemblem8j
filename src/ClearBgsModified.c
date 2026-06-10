#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void ClearBgsModified(int a)
{
    sModifiedBGs &= ~a;
}
