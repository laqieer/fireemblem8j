#include "global.h"
#include "ctc.h"

extern int sub_8012E84(int a, int b, int c, int d, int e);
extern void sub_8002DE4(ProcPtr proc);
extern void sub_80490C8(u32 frameTotal);

extern const u16 gObj_8049274_a[];
extern const u16 gObj_8049274_b[];

extern u8 gUnk_02000C04[];

struct Proc8049274
{
    /* 00 */ u8 _pad00[0x2C];
    /* 2C */ u32 oam[3];
    /* 38 */ s16 arrX[3];
    /* 3E */ s16 arrY[3];
    /* 44 */ int count;
    /* 48 */ u8 _pad48[0x50 - 0x48];
    /* 50 */ int state;
    /* 54 */ int timer;
};

void sub_8049274(struct Proc8049274 * proc)
{
    int i;
    int x;
    int y;

    for (i = 0; i < 3; i++)
    {
        if (i != proc->count)
        {
            x = sub_8012E84(5, proc->arrX[i], 0x140, proc->timer, 0x10);
            y = proc->arrY[i];
        }
        else
        {
            x = proc->arrX[i];
            y = sub_8012E84(4, proc->arrY[i], proc->arrY[0], proc->timer, 0x10);
        }

        PutSprite(4, x, y, gObj_8049274_a, (proc->oam[i] & 0xF) << 0xC);
        PutSprite(4, x + 0x28, y + 8, gObj_8049274_b, i << 6);
    }

    {
        u8 * p = gUnk_02000C04;
        int n = proc->count * 4;
        u32 * q = (u32 *)(p + 12);
        sub_80490C8(*(u32 *)((u8 *)q + n));
    }

    if (proc->state == 2)
    {
        proc->timer = 0;
        sub_8002DE4(proc);
    }

    if (proc->timer <= 0xF)
    {
        proc->timer++;
    }
    else
    {
        proc->state = 0;
    }
}
