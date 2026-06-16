#include "global.h"
#include "proc.h"
#include "bmlib.h"

extern struct ProcCmd gBmlib_1[];

struct Proc8599FD4 {
    PROC_HEADER;

    int unk2C, unk30, unk34, unk38, unk3C, unk40, unk44, unk48, unk4C;
};

void StartMapPaletteBrightnessFade(int a, int b, int c, int d, int e, int f, int g, int h, ProcPtr parent)
{
    struct Proc8599FD4 *proc = Proc_Start(gBmlib_1, parent);

    proc->unk2C = a;
    proc->unk30 = b;
    proc->unk34 = c;
    proc->unk38 = d;
    proc->unk3C = e;
    proc->unk40 = f;
    proc->unk48 = h;
    proc->unk4C = g;
}
