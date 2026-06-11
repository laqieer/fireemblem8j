#include "global.h"
#include "ap.h"
#include "ctc.h"
#include "proc.h"
#include "bmlib.h"
#include "hardware.h"

void APProc_Delete(struct APProc* proc) {
    // delet
    Proc_End(proc);
}
