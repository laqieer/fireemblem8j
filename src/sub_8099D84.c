#include "global.h"
#include "proc.h"
#include "prepscreen.h"
struct SallyCirProc * StartSallyCirProc(ProcPtr parent, int unk) {
    int uu = (s8)unk;
    struct SallyCirProc * proc = Proc_StartBlocking((const struct ProcCmd *)0x08A94584, parent);
    proc->unk_2a = uu;
    return proc;
}
