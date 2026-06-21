#include "global.h"
#include "proc.h"
#include "prepscreen.h"

extern u8 data_08A94584[];
struct SallyCirProc * StartSallyCirProc(ProcPtr parent, int unk) {
    int uu = (s8)unk;
    struct SallyCirProc * proc = Proc_StartBlocking((const struct ProcCmd *)data_08A94584, parent);
    proc->unk_2a = uu;
    return proc;
}
