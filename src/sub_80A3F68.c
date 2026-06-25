#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "face.h"

extern void sub_80A3DC8(int x);
extern void sub_8002DE4(ProcPtr proc);

struct UnkAugProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int counter;
    STRUCT_PAD(0x30, 0x3F);
    /* 3F */ u8 unk3F;
    STRUCT_PAD(0x40, 0x4F);
    /* 4F */ s8 unk4F;
    /* 50 */ s8 unk50;
    STRUCT_PAD(0x51, 0x52);
    /* 52 */ s16 unk52;
    /* 54 */ s16 unk54;
};

void sub_80A3F68(struct UnkAugProc* proc)
{
    int n;
    register int a asm("r4");
    int b;
    int x;
    int y;
    int t;
    int nx;
    register int ny asm("r1");
    register s16* p54 asm("r2");

    t = proc->counter + 1;
    proc->counter = t;
    n = 10 - t;

    a = 8 - (n * (n << 3)) / 100;
    b = 0x10 - (n * (n << 4)) / 100;
    a = (a << 3) - 0x40;

    x = a * proc->unk4F;
    y = a * proc->unk50;

    SetBlendConfig(1, 0x10 - b, b, 0);

    BG_SetPosition(0, x, y);
    BG_SetPosition(1, x, y);
    BG_SetPosition(2, x, y);

    proc->unk52 = nx = -x;
    ny = -y;
    p54 = &proc->unk54;
    *p54 = ny;

    sub_80A3DC8(nx);

    if (proc->unk3F != 0)
        SetFacePosition(0, 0xD8 - x, 0x58 - y);

    if (proc->counter == 10)
    {
        sub_8002DE4((ProcPtr)proc);

        gLCDControlBuffer.bg0cnt.priority = 1;
        gLCDControlBuffer.bg1cnt.priority = 3;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        SetBlendConfig(0, 0, 0, 0);

        gLCDControlBuffer.dispcnt.win0_on = 0;
        gLCDControlBuffer.dispcnt.win1_on = 0;
        gLCDControlBuffer.dispcnt.objWin_on = 0;
    }
}
