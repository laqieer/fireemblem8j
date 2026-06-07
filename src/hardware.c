#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"











void (* EWRAM_DATA gMainCallback)(void) = NULL;








struct KeyProc {
    /* 00 */ PROC_HEADER
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

void ExecMainUpdate(void)
{
    if (gMainCallback != NULL)
        gMainCallback();
}
