#include "global.h"
#include "proc.h"

// JP-only augury/uranai CG text-panel draw @ 0x080A32C0

struct CgTextProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    /* 30 */ int unk30;
};

extern void sub_8006710(int a, int b, int c);
extern void sub_80913FC(int a, int b, int c, int d, int e, void* f, int g, int h);
extern void SetCgTextFlags(int flags);

void sub_80A32C0(struct CgTextProc* proc)
{
    sub_8006710(0x28, 0, 1);
    sub_80913FC(0x16, 0x13, 0x12, 4, proc->unk30, (void*)0x06011000 /* VRAM */, 0xA, 0);
    SetCgTextFlags(0x4E);
}
