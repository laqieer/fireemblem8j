#include "global.h"
#include "proc.h"
#include "hardware.h"

struct KeyProc {
    /* 00 */ PROC_HEADER
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

void AsnycKeyStatusExt(struct KeyProc * proc)
{
    gKeyStatusPtr->newKeys = proc->unk64;
    gKeyStatusPtr->repeatedKeys = proc->unk64;
    gKeyStatusPtr->heldKeys = proc->unk64;
}
