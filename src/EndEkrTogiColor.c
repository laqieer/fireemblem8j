#include "global.h"
#include "proc.h"

extern ProcPtr gpProcEkrTogiColor;

void EndEkrTogiColor(void)
{
    Proc_End(gpProcEkrTogiColor);
    return;
}
