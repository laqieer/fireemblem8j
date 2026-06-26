typedef unsigned char u8;
typedef unsigned short u16;
typedef signed char s8;
typedef signed short s16;
typedef unsigned int u32;
typedef signed int s32;

struct UnitDefinition
{
    /* 00 */ u8  charIndex;
    /* 01 */ u8  classIndex;
    /* 02 */ u8  leaderCharIndex;
    /* 03 */ u8  autolevel  : 1;
    /* 03 */ u8  allegiance : 2;
    /* 03 */ u8  level      : 5;
    /* 04 */ u16 xPosition  : 6;
    /* 04 */ u16 yPosition  : 6;
    /* 05 */ u16 genMonster : 1;
    /* 05 */ u16 itemDrop   : 1;
    /* 05 */ u16 sumFlag    : 1;
    /* 05 */ u16 unk_05_7   : 1;
    /* 05 */ u16 extraData  : 8;
    /* 07 */ u16 redaCount  : 8;
    /* 08 */ const void * redas;
    /* 0C */ u8 items[4];
    /* 10 */ u8 ai[4];
};

extern struct UnitDefinition gLoadUnitBuffer[];

extern int NextRN_N(int);
extern int Div(int, int);
extern void sub_8012684(struct UnitDefinition *);

struct UnitDefinition * sub_800FAD0(struct UnitDefinition * src, s16 count, u8 pct, s8 arg3, s8 arg4)
{
    u8 buf[0x54];
    u16 n;
    u16 i;
    int sel;
    u32 maskLo;
    u32 maskHi;
    struct UnitDefinition * dst;
    struct UnitDefinition * base;
    struct UnitDefinition * sp;

    n = 0;
    sel = 0;

    if (pct != 0)
    {
        sp = src;
        for (i = 0; i < count; i++)
        {
            if (((u8*)sp)[5] & 0x40)
            {
                buf[n] = i;
                n++;
            }
            sp++;
        }
        sel = Div(pct * n + 0x32, 0x64);
    }

    maskLo = 0;
    maskHi = 0;

    if (sel != 0)
    {
        do
        {
            unsigned b;
            b = buf[NextRN_N(n)];
            if (b > 0x1f ? (maskHi & (1 << (b - 0x20))) : (maskLo & (1 << b)))
            {
            }
            else
            {
                if (b > 0x1f)
                    maskHi |= (1 << (b - 0x20));
                else
                    maskLo |= (1 << b);
                sel--;
            }
        } while (sel != 0);
    }

    base = gLoadUnitBuffer;
    dst = base;

    for (i = 0; i < count; i++)
    {
        if (!((u32)i > 0x1f ? (maskHi & (1 << (i - 0x20))) : (maskLo & (1 << i))))
        {
            *dst = src[i];
            ((u8*)dst)[5] = ((u8*)dst)[5] & ~0x40;
            dst++;
        }
    }

    for (i = 0; i < count; i++)
    {
        if ((u32)i > 0x1f ? (maskHi & (1 << (i - 0x20))) : (maskLo & (1 << i)))
        {
            *dst = src[i];
            ((u8*)dst)[5] = ((u8*)dst)[5] | 0x40;
            dst++;
        }
    }

    ((u8*)dst)[0] = 0;

    if (arg4 == 1)
    {
        dst = base;
        for (i = 0; i < count; i++)
        {
            ((u8*)dst)[7] = 0;
            *(u32*)((u8*)dst + 8) = 0;
            dst++;
        }
    }

    dst = base;
    if (arg3 == 1)
        sub_8012684(dst);

    return base;
}