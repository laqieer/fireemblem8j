#include "global.h"
#include "proc.h"

void Proc_SetMark(ProcPtr proc, int mark)
{
    struct Proc* casted = (struct Proc*) proc;

    casted->proc_mark = mark;
}
