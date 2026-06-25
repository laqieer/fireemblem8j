#include "global.h"
#include <string.h>

#include "bmlib.h"
#include "hardware.h"
#include "proc.h"

struct Sub8021B98Proc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk_4c;
};

extern void j_TmCopyRect(const void * src, void * dst, int w, int h);
extern void sub_8002DE4(struct Sub8021B98Proc * proc);
extern void sub_8027144(void);

extern const u8 gConfig_080DC8B0[0x38];

void sub_8021B98(struct Sub8021B98Proc * proc)
{
    u8 cfg[0x38];
    u8 * p;
    u8 r4;
    u8 r5;

    memcpy(cfg, gConfig_080DC8B0, 0x38);

    proc->unk_4c++;
    p = &cfg[(proc->unk_4c / 3) * 4];

    r4 = p[0];
    r5 = p[1];

    if (r4 == 0xFF)
    {
        sub_8002DE4(proc);
        return;
    }

    if (r4 == 0 && r5 == 0x10)
        sub_8027144();

    j_TmCopyRect((const void *)((r5 * 0x20 + r4) * 2 + 0x02003D2C), (void *)0x02022CA8, 6, 8);
    BG_EnableSyncByMask(1);
}
