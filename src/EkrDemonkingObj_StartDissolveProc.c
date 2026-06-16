#include "global.h"
#include "ekrdragon.h"

void EkrDemonkingObj_StartDissolveProc(int ref, ProcPtr parent)
{
    struct Proc08801840 *proc;
    proc = Proc_Start(ProcScr_EkrdragonDemonkingobj_2, parent);
    proc->ref = ref;
}
