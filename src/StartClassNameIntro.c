#include "global.h"
#include "classchg.h"

extern struct ProcCmd gProcScr_opinfoenter[];

ProcPtr StartClassNameIntro(ProcPtr parent, struct ClassReelEnt* entry) {
    struct OpInfoEnterProc* proc = Proc_Start(gProcScr_opinfoenter, parent);
    proc->parentProc = parent;
    proc->classReelEnt = entry;
    return proc;
}
