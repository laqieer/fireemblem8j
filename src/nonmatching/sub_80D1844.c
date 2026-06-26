/* NON_MATCHING: byte source is asm/sub_80D1844.s @ JP 0x080D1844 (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). Compiled only by
 * `make nonmatching`, NOT in make-compare.
 *
 * IDENTITY (linker-proven, two signals): JP 0x080D1844 == LoadClassNameInClassReelFont
 * (baseline alias in jp_syms.s + autobind tsv; callers bl it). Fingerprint: callee set
 * {GetClassDisplayFontInfo, PutSpriteExt} + PutSpriteExt(...,0x81<<7) = fe8u
 * classchg-sel.c:LoadClassNameInClassReelFont. JP differs from fe8u: fe8u builds the
 * string at runtime (GetClassData + GetStringFromIndexInBuffer); JP reads a PRECOMPUTED
 * 20-byte-stride class-name table @ 0x089CF318 directly (ROM: "none","Lord","Masterlord"...).
 *
 * Reconstructed this session (D292 bare-asm workflow). VERIFIED residual = 35 bytes at
 * 140-byte size-exact form below + -fno-strength-reduce. The residual is a pure agbcc
 * loop-codegen ceiling: the oracle wants moving-induction-pointer + a separate live
 * counter (cmp #0x13) + top-peel SIMULTANEOUSLY; agbcc emits at most two of the three
 * (default strength-reduce: moving-pointer but folds the counter into the bound;
 * -fno-strength-reduce: separate counter + top-peel but recomputes str[i] each iter).
 * No source phrasing forces all three (tested while/do-while/peel variants). decomp-permuter
 * target (now running in nonmatchings/sub_80D1844). Graduate -> rename src/, drop the
 * LoadClassNameInClassReelFont .set alias, add a data alias gClassReelNameTable@0x089CF318. */
typedef unsigned char u8;
typedef signed char s8;
typedef unsigned short u16;
typedef signed short s16;
typedef unsigned int u32;

struct ClassDisplayFont { u16 *a; s8 xBase; s8 width; s8 yBase; };
struct ProcPromoSel { u8 _p0[0x2C]; u16 jid[3]; u8 _p32[0x0F]; u8 main_select; u8 _p42[2]; u16 u44; };

extern struct ClassDisplayFont *GetClassDisplayFontInfo(char chr);
extern void PutSpriteExt(int layer, int x, int y, const u16 *o, int a);
extern u8 gClassReelNameTable[][20]; /* JP 0x089CF318 */

void LoadClassNameInClassReelFont(struct ProcPromoSel *proc)
{
    int i;
    u16 jid = proc->jid[proc->main_select];
    u8 *str = gClassReelNameTable[jid];
    int xOffs = 0x74;

    for (i = 0; i < 0x14 && str[i]; i++) {
        struct ClassDisplayFont *font = GetClassDisplayFontInfo(str[i]);
        if (font->a) {
            PutSpriteExt(4, xOffs - font->xBase - 2, font->yBase + 6, font->a, 0x81 << 7);
            xOffs += font->width - font->xBase;
        }
    }
    if (proc->u44 < 0xff)
        proc->u44++;
}
