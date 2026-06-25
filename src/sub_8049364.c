#include "global.h"

#include "proc.h"
#include "ctc.h"
#include "bmlib.h"

struct Unk8049364Proc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int oam2[3];
    /* 38 */ short x[3];
    /* 3E */ short y[3];
    /* 44 */ int sel;
    /* 48 */ STRUCT_PAD(0x48, 0x50);
    /* 50 */ int unk50;
    /* 54 */ int timer;
};

extern const u16 gObj_85D3FA0[];
extern const u16 gObj_85D3F74[];

struct Unk02000C04
{
    /* 00 */ STRUCT_PAD(0x00, 0x0c);
    /* 0C */ int items[3];
};

extern u8 gUnk_02000C04[];

void sub_80490C8(u32 frameTotal);

void sub_8049364(struct Unk8049364Proc * proc)
{
    int i;
    int xv;
    int yv;

    for (i = 0; i < 3; i++)
    {
        if (i != proc->sel)
        {
            xv = Interpolate(5, 0xf0, proc->x[i], proc->timer, 0x10);
            yv = proc->y[i];
        }
        else
        {
            xv = proc->x[i];
            yv = Interpolate(4, proc->y[0], proc->y[i], proc->timer, 0x10);
        }

        PutSprite(4, xv, yv, gObj_85D3FA0, (proc->oam2[i] & 0xf) << 0xc);
        PutSprite(4, xv + 0x28, yv + 8, gObj_85D3F74, i << 6);
    }

    sub_80490C8(((struct Unk02000C04 *)gUnk_02000C04)->items[proc->sel]);

    if (proc->timer <= 0xf)
    {
        proc->timer++;
    }
    else
    {
        proc->timer = 0;
        proc->unk50 = 0;
        Proc_Goto(proc, 0);
    }
}
