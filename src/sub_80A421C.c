#include "global.h"

struct DivinationScreenProc
{
    PROC_HEADER;
    /* 2C */ STRUCT_PAD(0x2C, 0x30);
    /* 30 */ int unk30;
};

#include "hardware.h"

#define gLCDBytes ((u8 *)&gLCDControlBuffer)

extern void ResetFaces(void);
extern void ResetText(void);
extern void InitText(void * a, int b);
extern const struct ROMChapterData * GetROMChapterStruct(unsigned chIndex);
extern void SetFlag(int);
extern bool CheckFlag(int);
extern void ClearFlag(int);

extern int sub_80A2CB0(struct DivinationScreenProc * proc);
extern void sub_8001ACC(int a);
extern int sub_8001BC0(int a);
extern void sub_80011D0(int a, int b);
extern void sub_80034C4(void);
extern void sub_804F8E0(void);
extern void sub_801569C(void);
extern void sub_8003508(int a);
extern void sub_8097CFC(void);
extern void sub_80048B4(int a);
extern void sub_80B261C(int a, int b, int c, int d, int e, int f);
extern void sub_80B269C(int a, int b, int c, int d);
extern void sub_80A4188(int a, int b);
extern void sub_8097F30(int a, int b);
extern void sub_80B1D98(void * func, struct DivinationScreenProc * proc);
extern void sub_8006710(int a, int b, int c);
extern void sub_800783C(int a, int b, int c, int d, int e);
extern void sub_80A4148(struct DivinationScreenProc * proc);

void sub_80A421C(struct DivinationScreenProc * proc)
{
    int r6;

    proc;
    r6 = sub_80A2CB0(proc);

    gLCDControlBuffer.dispcnt.mode = 0;

    sub_8001ACC(0);

    sub_80011D0(sub_8001BC0(0), 0);
    sub_80011D0(sub_8001BC0(1), 0);
    sub_80011D0(sub_8001BC0(2), 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    ResetFaces();
    ResetText();
    sub_80034C4();
    sub_804F8E0();
    sub_801569C();

    BG_SetPosition(0, 4, 0xFFFC);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    sub_8003508(4);
    sub_8097CFC();
    BG_EnableSyncByMask(7);
    sub_80048B4((int)proc);

    InitText((void *)0x02013580, 8);

    sub_80B261C(0xd, 0xe00, 0xf, 0xc00, 0, (int)proc);
    sub_80B269C(0, 0x90, 0x10, 0);
    sub_80A4188(0x7000, 1);

    proc->unk30 = *(u8 *)((char *)GetROMChapterStruct(gPlaySt.chapterIndex) + 0x80);

    sub_8097F30(0x7800, 2);
    sub_80B1D98((void *)sub_80A4148, proc);
    sub_8006710(0x200, 3, 1);

    if (gPlaySt.chapterIndex == 0x7d)
    {
        Proc_Goto(proc, 3);
    }
    else if (r6 == 0xae)
    {
        SetFlag(0x85);
    }
    else if (CheckFlag(0x85) && gPlaySt.chapterIndex <= 0x79)
    {
        r6 = 0xae;
        ClearFlag(0x85);
        Proc_Goto(proc, 4);
    }

    sub_800783C(r6, 0xd4, 0x52, 0x202, 0);
}
