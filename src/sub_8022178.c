#include "global.h"
#include <string.h>
#include "proc.h"
#include "hardware.h"

extern const u16 gUnk_080DC8E8[];

struct ProcUnk8022178
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 _4c;
};

// JP-only palette-strip proc: copies a 0x50-byte template to the stack, clears
// gPaletteBuffer[0], then fills gPaletteBuffer[0x2f..0x21] backward from the
// template at a scrolling offset, syncs palette, advances the offset, and breaks
// the proc once it passes 0xC.
void sub_8022178(struct ProcUnk8022178 *proc)
{
    u16 buf[0x28];
    int i;

    memcpy(buf, gUnk_080DC8E8, 0x50);

    gPaletteBuffer[0] = 0;

    for (i = 1; i <= 0xF; i++)
        gPaletteBuffer[0x2f - (i - 1)] = buf[proc->_4c + i - 1];

    EnablePaletteSync();

    proc->_4c += 3;
    if (proc->_4c > 0xC)
        Proc_Break(proc);
}
