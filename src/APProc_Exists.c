#include "global.h"
extern struct ProcCmd ProcScr_ApProc[];
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"

bool APProc_Exists(void) {
    return Proc_Find(ProcScr_ApProc) ? TRUE : FALSE;
}
