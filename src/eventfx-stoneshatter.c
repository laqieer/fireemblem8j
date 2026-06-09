#include "global.h"

#include "hardware.h"
#include "bm.h"

//! FE8U = 0x08012CE4
void StoneShatterEvent_OnEnd(void)
{
    SetBlendConfig(0, 0, 0x10, 0);
    InitBmBgLayers();
}
