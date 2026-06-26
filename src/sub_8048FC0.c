#include "global.h"
#include "proc.h"
#include "fontgrp.h"

struct Unk8048FC0Proc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int oam[3];
    /* 38 */ short x[3];
    /* 3E */ short y[3];
    /* 44 */ int unk44;
    /* 48 */ int unk48;
    /* 4C */ int unk4C;
    /* 50 */ int unk50;
    /* 54 */ int unk54;
};

struct Unk8048FC0Data
{
    /* 00 */ u8 _pad00;
    /* 01 */ u8 a[4];
    /* 05 */ u8 b[4];
    /* 09 */ u8 c[3];
};

extern struct Unk8048FC0Data gUnk_02000C04;

void sub_8013008(const void * src, void * dst);
void sub_8000D68(const void * src, int dest, int size);
void sub_8048F24(struct Text * text, int colorId, int index);
void sub_8048F78(struct Text * text);

void sub_8048FC0(struct Unk8048FC0Proc * proc)
{
    int i;

    sub_8013008((const void *)0x085DFA68, (void *)0x06012800);
    sub_8000D68((const void *)0x085E04C4, 0xa0 << 2, 0xc0);
    InitSpriteTextFont((struct Font *)0x02000C60, (void *)0x06015000, 0xe);
    sub_8000D68((const void *)0x085C7420, 0xd0 << 2, 0x20);
    SetTextFontGlyphs(0);
    ResetTextFont();

    for (i = 0; i < 3; i++)
    {
        int flag;
        int v;

        proc->oam[i] = (v = gUnk_02000C04.c[i] * 2 + 1, v - gUnk_02000C04.a[i]);

        if (gUnk_02000C04.a[i] != 0)
            flag = 0;
        else
            flag = 1;

        InitSpriteText((struct Text *)0x02000C40 + i);
        SpriteText_DrawBackgroundExt((struct Text *)0x02000C40 + i, 0);
        sub_8048F24((struct Text *)0x02000C40 + i, flag, gUnk_02000C04.b[i]);

        proc->x[i] = 0x18;
        proc->y[i] = (i << 5) + 0x20;
    }

    InitSpriteText((struct Text *)0x02000C58);
    SpriteText_DrawBackgroundExt((struct Text *)0x02000C58, 0);
    sub_8048F78((struct Text *)0x02000C58);

    proc->unk48 = 0;
    proc->unk44 = 0;
    proc->unk54 = 0;
    proc->unk50 = 0;
    proc->unk4C = 0;
}
