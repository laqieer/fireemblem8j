#include "global.h"
#include "proc.h"
#include "ctc.h"

void PutObjectAffine(int id, int pa, int pb, int pc, int pd)
{
    gOam[id*0x10 + 0x03] = pa;
    gOam[id*0x10 + 0x07] = pb;
    gOam[id*0x10 + 0x0B] = pc;
    gOam[id*0x10 + 0x0F] = pd;
}
