#include "global.h"
#include "proc.h"

extern struct ProcCmd ProcScr_GmScrollManage[];

ProcPtr GmScrollManageExist(void)
{
    return Proc_Find(ProcScr_GmScrollManage);
}
