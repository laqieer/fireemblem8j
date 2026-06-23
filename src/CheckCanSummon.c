#include "global.h"
#include "bmunit.h"
#include "mapanim.h"
#include "proc.h"

s8 CheckCanSummon(struct SumProc* proc)
{
    s8 count = 0;
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i) {
        struct Unit* unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (count >= 40) {
                Proc_Goto(proc, PROC_LABEL_SUMDK_LOAD_TERMINAL);
                do { return TRUE; } while (0);
            }
            count++;
        }
    }
    if (proc->counter < 8 && proc->monsters < 4)
        return FALSE;
    Proc_Goto(proc, PROC_LABEL_SUMDK_LOAD_TERMINAL);
    return TRUE;
}
