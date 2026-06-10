#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void SetBlendConfig(u16 effect, u8 coeffA, u8 coeffB, u8 blendY)
{
    gLCDControlBuffer.bldcnt.effect = effect;
    gLCDControlBuffer.blendCoeffA = coeffA;
    gLCDControlBuffer.blendCoeffB = coeffB;
    gLCDControlBuffer.blendY = blendY;
}
