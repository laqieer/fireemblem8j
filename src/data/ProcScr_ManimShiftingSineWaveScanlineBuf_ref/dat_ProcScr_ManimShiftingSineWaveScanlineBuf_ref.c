#include "global.h"
#include "proc.h"

extern void sub_80848F0();
extern void ManimShiftingSineWaveScanlineBuf_Loop();

struct ProcCmd ProcScr_ManimShiftingSineWaveScanlineBuf[] __attribute__((section(".data.residue.08A15984"))) = {
    PROC_CALL(sub_80848F0),
    PROC_REPEAT(ManimShiftingSineWaveScanlineBuf_Loop),
    PROC_END,
};
