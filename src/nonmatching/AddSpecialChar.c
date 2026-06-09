/* NON_MATCHING: byte source is asm/AddSpecialChar.s @ JP 0x08004998 (region-
 * different, gbadisasm descriptive asm; carved_rom row places those bytes). This
 * C DOCUMENTS / stages the function and is NOT in the make-compare oracle: it is
 * compiled only by `make nonmatching` (prove-builds), never linked, never sha1'd.
 *
 * Graduate via the permuter -> matching C: move this file up to src/ (or merge
 * into the owning TU src/fontgrp.c), delete asm/AddSpecialChar.s, flip the
 * carved_rom row asm/AddSpecialChar.o(.text.AddSpecialChar) ->
 * src/<owner>.o(.text). The JP range is unchanged, so `make compare` staying OK
 * is the sole graduation oracle. No #ifdef, no asm in this file. */
#include "global.h"
#include "fontgrp.h"

/* Region-different staging body, ported from the US fontgrp.c equivalent and
 * re-pointed at the JP symbols the asm references (sub_800493C =
 * DrawSpecialCharGlyph; _080049D0 = TextGlyphs_Special; 0x02028E70 holds the
 * active font whose chr_counter is bumped). Declared locally so this staging TU
 * compiles standalone without depending on the oracle headers' exports. */
struct SpecialCharSt
{
    /* 00 */ s8 color;
    /* 01 */ s8 id;
    /* 02 */ s16 chr_position;
};

extern struct Font *gActiveFont;
extern struct Glyph *TextGlyphs_Special[];

void DrawSpecialCharGlyph(int chr, int color, struct Glyph *glyph);

int AddSpecialChar(struct SpecialCharSt *st, int color, int id)
{
    st->color = color;
    st->id = id;
    st->chr_position = gActiveFont->chr_counter++;

    /* Terminate the next list entry (color = -1 / 0xFF in the ROM). */
    (st + 1)->color = -1;

    DrawSpecialCharGlyph(st->chr_position, color, TextGlyphs_Special[id]);

    return st->chr_position;
}
