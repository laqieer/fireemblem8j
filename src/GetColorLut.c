#include "global.h"

extern u16 *s2bppTo4bppLutTable[];

u16 *GetColorLut(int color)
{
    return s2bppTo4bppLutTable[color];
}
