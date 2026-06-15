#include "global.h"
#include "proc.h"

extern struct ProcCmd ProcScr_PromoSelect[];

ProcPtr StartPromoClassSelect(ProcPtr parent)
{
    return Proc_StartBlocking(ProcScr_PromoSelect, parent);
}
