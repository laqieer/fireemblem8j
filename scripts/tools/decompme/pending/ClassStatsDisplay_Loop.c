typedef unsigned char u8;
typedef unsigned short u16;
typedef signed char s8;
typedef signed short s16;
typedef unsigned int u32;
typedef signed int s32;

struct ClassDisplayFont { u16 * a; s8 xBase; s8 width; s8 yBase; };

/* proc->data (at proc+0x30); +0x34 = char** to the name string; +0x40 = stat bytes */
struct ClassStatsData {
    /* 00 */ u8 _pad0[0x34];
    /* 34 */ char ** str;
    /* 38 */ u8 _pad38[8];
    /* 40 */ u8 stats[8];
};

struct ClassStatsProc {
    /* 00 */ u8 _pad0[0x2a];
    /* 2a */ u16 timer;
    /* 2c */ u8 _pad2c[4];
    /* 30 */ struct ClassStatsData * data;
    /* 34 */ u8 b34;
    /* 35 */ u8 b35;
};

extern u16 * gUnknown_08AAFEE4[]; /* JP 0x08AAFEE4 : u16* statBarSprites[] */
extern void PutSpriteExt(int layer, int xOam1, int yOam0, const u16 * object, int oam2);
extern struct ClassDisplayFont * GetClassDisplayFontInfo(char chr);

void ClassStatsDisplay_Loop(struct ClassStatsProc * proc)
{
    int i, j;
    u32 stat;
    int xOffs, index;
    struct ClassDisplayFont * font;

    for (i = 0; i < 6; i++) {
        stat = proc->data->stats[i];
        if (stat > 0x1d)
            stat = 0x1e;

        for (j = 0; j < (stat >> 2); j++)
            PutSpriteExt(0xd, 0x30 + j * 8, (i << 4) + 0x10, gUnknown_08AAFEE4[3], 0x80 << 7);

        if ((stat & 3) != 0)
            PutSpriteExt(0xd, ((stat >> 2) << 3) + 0x30, (i << 4) + 0x10,
                gUnknown_08AAFEE4[(stat & 3) - 1], 0x80 << 7);
    }

    xOffs = (0x78 - proc->b34) / 2 + proc->b35;

    index = 0;
    while ((*proc->data->str)[index] != 0) {
        font = GetClassDisplayFontInfo((*proc->data->str)[index]);
        if (font->a != 0) {
            PutSpriteExt(4, xOffs - font->xBase - 2, 5 - font->yBase, font->a, 0x80 << 7);
            xOffs += font->width - font->xBase;
        }
        index++;
        if (index > 0xd)
            break;
    }

    if (proc->timer <= 0xfe)
        proc->timer++;
}