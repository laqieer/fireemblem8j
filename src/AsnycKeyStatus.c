#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

struct KeyProc {
    /* 00 */ PROC_HEADER
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

extern struct ProcCmd ProcScr_AsnycKeyStatus[];

void AsnycKeyStatus(int key)
{
    struct KeyProc * kproc = Proc_Start(ProcScr_AsnycKeyStatus, PROC_TREE_1);
    kproc->unk64 = key;
}
