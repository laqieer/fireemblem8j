#include "global.h"
#include "proc.h"

extern struct ProcCmd gProcScr_GmapEffect[];
void Proc_EndEach(const struct ProcCmd *script);

void EndGmapEffect(void)
{
    Proc_EndEach(gProcScr_GmapEffect);
    return;
}
