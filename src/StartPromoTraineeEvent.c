#include "global.h"
#include "proc.h"

extern struct ProcCmd ProcScr_PromoSelectEvent[];

ProcPtr StartPromoTraineeEvent(ProcPtr proc)
{
    return Proc_StartBlocking(ProcScr_PromoSelectEvent, proc);
}
