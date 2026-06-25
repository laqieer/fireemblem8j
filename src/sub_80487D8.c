#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "proc.h"
#include "bmlib.h"
#include "sio.h"

struct MultiBootSendProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ s16 unk64;
};

extern const u8 gUnk_080DEEE8[0x18];

extern const u8 gUnk_085DF388[];
extern const u8 gUnk_085DF60C[];
extern const u8 gUnk_085DF62C[];
extern const u8 gUnk_085DFA48[];
extern const u8 gUnk_085DF4B8[];
extern const u8 gUnk_085DF554[];
extern const u8 gUnk_085DB188[];
extern const u8 gUnk_085DED24[];
extern const u8 gUnk_085DF288[];
extern const u8 gUnk_085D3EA8[];

extern u16 gUnk_020234A8[];
extern u16 gUnk_020244A8[];
extern struct Font gUnk_0203DB60;
extern struct Text gUnk_0203DD08;

extern const u8 MultiBootSendImage_Start[];
extern const u8 MultiBootSendImage_End[];

extern const u8 * gUnk_03004E10;
extern int gUnk_03004EAC;
extern struct MultiBootParam gUnk_03004EB0;

extern u8 * gUnk_085D31E8;

void sub_8001ACC(void * bgConfig);
void nullsub_2(void);
void sub_8013008(const void * src, void * dst);
void sub_8000D68(const void * src, int dst, int size);
void j_TmApplyTsa(u16 * tm, const void * tsa, int base);
void sub_8002BCC(const void * a, struct MultiBootSendProc * proc);
void sub_8003CF8(struct Text * text);
int sub_8009FA8(int msgid);
void sub_80042E0(void);
void sub_80043B8(struct Text * text, int a, int b, int str);
void m4aSoundVSyncOff(void);
void * memcpy(void * dst, const void * src, unsigned long n);

void sub_80487D8(struct MultiBootSendProc * proc)
{
    u8 bgConfig[0x18];
    u16 * tm;
    int addend;
    int i;

    memcpy(bgConfig, gUnk_080DEEE8, 0x18);
    sub_8001ACC(bgConfig);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    nullsub_2();

    sub_8013008(gUnk_085DF388, (void *)(0x06000F00 + GetBackgroundTileDataOffset(1)));
    sub_8000D68(gUnk_085DF60C, 0x80, 0x20);
    sub_8013008(gUnk_085DF62C, (void *)0x06014000);
    sub_8000D68(gUnk_085DFA48, 0x98 << 2, 0x20);

    j_TmApplyTsa(gUnk_020234A8, gUnk_085DF4B8, 0x4078);
    j_TmApplyTsa(gUnk_020234A8 + (0x88 << 3) / 2, gUnk_085DF554, 0x4078);

    sub_8013008(gUnk_085DB188, (void *)((0xC0 << 0x13) + GetBackgroundTileDataOffset(3)));
    sub_8013008(gUnk_085DED24, gUnk_020244A8);
    sub_8000D68(gUnk_085DF288, 0xE0, 0x80 << 1);

    tm = gUnk_020244A8;
    for (i = 0; i < (0xA0 << 2); i++)
    {
        *tm += 0xE0 << 7;
        tm++;
    }

    sub_8002BCC(gUnk_085D3EA8, proc);

    SetTextFont(&gUnk_0203DB60);
    sub_80042E0();
    ResetTextFont();

    InitText(&gUnk_0203DD08, 0x18);
    sub_8003CF8(&gUnk_0203DD08);
    sub_80043B8(&gUnk_0203DD08, 0, 0, sub_8009FA8(0x62));
    PutText(&gUnk_0203DD08, (u16 *)0x02023136);

    BG_EnableSyncByMask(0xB);
    BG_SetPosition(0, 0, 4);

    SetBlendConfig(1, 8, 8, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    m4aSoundVSyncOff();

    gUnk_03004E10 = MultiBootSendImage_Start;
    gUnk_03004EAC = MultiBootSendImage_End - MultiBootSendImage_Start;
    gUnk_03004EB0.masterp = (u8 *)MultiBootSendImage_Start;
    *((u8 *)&gUnk_03004EB0 + 0x4b) = 0;
    MultiBootInit(&gUnk_03004EB0);

    gUnk_085D31E8[0xB] = 4;
    proc->unk64 = 0;
}
