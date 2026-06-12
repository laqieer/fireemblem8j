#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void SetObjAffine(int index, s16 pa, s16 pb, s16 pc, s16 pd)
{
    gOam[index * 16 + 3] = pa;
    gOam[index * 16 + 7] = pb;
    gOam[index * 16 + 11] = pc;
    gOam[index * 16 + 15] = pd;
}
