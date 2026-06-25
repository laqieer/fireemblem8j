#include "global.h"
#include "proc.h"

// JP-only augury/CG-viewer text setup @ 0x080A467C

struct CgTextProc2
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
};

extern void sub_80913FC(int a, int b, int c, int d, int e, void* f, int g, int h);
extern int GetCgTextFlags(void);
extern void SetCgTextFlags(int flags);

void sub_80A467C(struct CgTextProc2* proc)
{
    proc->unk2C = 0x7B1;
    sub_80913FC(0x16, 0x10, -1, -1, 0x7B1, (void*)0x06011000 /* VRAM */, -1, 0);
    SetCgTextFlags(GetCgTextFlags() | 0x4004E);
}
