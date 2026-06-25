#include "global.h"
#include "proc.h"
#include "m4a.h"
#include "variables.h"
struct Augury80A46F8Proc { PROC_HEADER; s16 unk_2A; u16 buf[15]; };
extern u16 gUnk_020229EA[15];
struct PlayStBytes { u8 b[0x42]; };
extern struct PlayStBytes gPlayStBytes;
void sub_80A46F8(struct Augury80A46F8Proc * proc)
{
    u16 * src = gUnk_020229EA;
    struct PlayStBytes * st = &gPlayStBytes;
    u16 * dst = proc->buf;
    int i;
    for (i = 14; i >= 0; i--)
    {
        *dst++ = *src++;
    }
    if ((st->b[0x41] << 0x1E) >= 0)
        m4aSongNumStart(0xEE);
    proc->unk_2A = 0;
}
