#include "global.h"
#include "hardware.h"

void sub_8009D88(void)
{
    SetBlendConfig(3, 0, 0, 0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
}
