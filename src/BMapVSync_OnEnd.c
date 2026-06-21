#include "global.h"
#include "proc.h"
#include "hardware.h"

//! FE8U = 0x08030088
void BMapVSync_OnEnd(struct Proc* proc)
{
    SetSecondaryHBlankHandler(NULL);
}
