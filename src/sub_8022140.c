#include "global.h"
#include "proc.h"
#include "hardware.h"

struct ProcUnk8022140
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 _4c;
};

void sub_8022140(struct ProcUnk8022140 *proc)
{
    u16 *base = gPaletteBuffer;
    u16 *p;
    int v = 0x7FFF;
    int i;
    int z;
    int w;

    p = base + 0x21;
    i = 0xE;
    do {
        *p = v;
        p++;
    } while (--i >= 0);

    z = 0;
    w = 0x7FFF;
    *base = w;
    EnablePaletteSync();
    proc->_4c = z;
}
