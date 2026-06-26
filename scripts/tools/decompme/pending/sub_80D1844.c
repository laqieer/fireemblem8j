typedef unsigned char u8;
typedef signed char s8;
typedef unsigned short u16;
typedef signed short s16;
typedef unsigned int u32;
typedef signed int s32;

struct ClassDisplayFont {
    u16 *a;
    s8 xBase;
    s8 width;
    s8 yBase;
};

/* JP ProcPromoSel (include/classchg.h): jid[] @0x2C, main_select @0x41, u44 @0x44 */
struct ProcPromoSel {
    u8 _pad00[0x2C];
    /* 2C */ u16 jid[3];
    /* 32 */ u8 _pad32[0x0F];
    /* 41 */ u8 main_select;
    /* 42 */ u8 _pad42[2];
    /* 44 */ u16 u44;
};

extern struct ClassDisplayFont *GetClassDisplayFontInfo(char chr);
extern void PutSpriteExt(int layer, int xOam1, int yOam0, const u16 *object, int oam2);
extern u8 gClassReelNameTable[][20]; /* JP 0x089CF318, 20-byte stride class-name strings */

void sub_80D1844(struct ProcPromoSel *proc)
{
    int i;
    u16 jid = proc->jid[proc->main_select];
    u8 *str = gClassReelNameTable[jid];
    int xOffs = 0x74;

    for (i = 0; i < 0x14 && str[i] != '\0'; i++) {
        struct ClassDisplayFont *font = GetClassDisplayFontInfo(str[i]);
        if (font->a) {
            PutSpriteExt(4, xOffs - font->xBase - 2, font->yBase + 6, font->a, 0x81 << 7);
            xOffs += font->width - font->xBase;
        }
    }

    if (proc->u44 < 0xff)
        proc->u44++;
}