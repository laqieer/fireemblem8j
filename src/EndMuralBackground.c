#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

//! FE8U = 0x08086DBC
void EndMuralBackground(void) {
    Proc_EndEach(ProcScr_SlidingWallBg);
    return;
}
