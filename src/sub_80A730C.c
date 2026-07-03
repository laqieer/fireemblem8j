#include "global.h"
#include "fontgrp.h"
#include "hardware.h"

/* sub_80A730C: JP-only "通信闘技場" (Link-Arena) roster-name grid renderer @ 0x080A730C.
 * Renders the decoded roster into a 3-row x 14-column grid of 2-byte (JIS) glyph
 * names, ending exactly where the MATCHED same-TU sibling sub_80A73D4 (scoreboard)
 * begins. For each of 3 text rows it ClearText + InitTalkTextFont, then per column
 * looks up the record byte in the packed buffer gBuf_2014F28, maps it through the
 * caller's glyph table to a 2-byte string, and PutDrawText's it into the BG2 tilemap
 * at a column stepped by +11 (with an extra +11 every 5 columns). Stops early once
 * the running record index reaches the valid roster count (header rosterCount +
 * gUnk_02014EF4). Built at the TU default -O2 (matches; see docs). */

/* codec header @ 0x02014FC8 (same base as the matched sibling sub_80A6C60's base[]).
 * The struct-cast `->rosterCount` (ldrh [r0,#6]) is what pins the pool word to
 * 0x02014FC8 + offset 6; a plain ((u16*)0x02014FC8)[3] folds to the absolute
 * 0x02014FCE (ldrh [r0,#0]) and does not match. */
struct ArenaCodecHeader
{
    /* 00 */ u16 unk0;
    /* 02 */ u16 unk2;
    /* 04 */ u16 unk4;
    /* 06 */ u16 rosterCount;
};

extern int gUnk_02014EF4;   /* valid-roster count addend */
extern u8 gBuf_2014F28[];   /* 0x02014F28 packed record buffer */

void ClearText(struct Text *text);
void InitTalkTextFont(void);
void PutDrawText(struct Text *text, u16 *dest, int colorId, int x, int tileWidth,
                 const char *string);

void sub_80A730C(struct Text *texts, u8 *glyphTable)
{
    char str[3];
    char *p;
    int w;         /* tileWidth (0); a named local so agbcc colours the arg-stage
                    * scratch pair (r1 const / r0 &str) exactly as the JP build. */
    int row;
    int col;
    int x;
    int recBase;   /* sb / r9  : record base index for the row     */
    int tileOff;   /* sl / r10 : byte offset into the BG2 tilemap  */

    str[2] = 0;                          /* NUL terminator (2-byte glyph string) */
    BG_EnableSyncByMask(BG2_SYNC_BIT);   /* 0x4 */

    row = 0;
    p = str;                             /* &str anchored here so the hoisted
                                          * add r7,sp,#8 lands in the JP slot. */
    tileOff = 448;
    recBase = 0;
    w = 0;

    do
    {
        ClearText(&texts[row]);
        x = 2;
        InitTalkTextFont();

        col = 0;
        do
        {
            /* stop once we run past the valid roster entries */
            if (recBase + col ==
                ((struct ArenaCodecHeader *)0x02014FC8)->rosterCount + gUnk_02014EF4)
                return;

            /* record byte -> 2-byte glyph code from the caller's table */
            p[0] = glyphTable[gBuf_2014F28[recBase + col] * 2];
            p[1] = glyphTable[gBuf_2014F28[recBase + col] * 2 + 1];

            PutDrawText(&texts[row], (u16 *)(0x02023CB0 + tileOff), 1, x, w, str);

            x += 11;
            col++;
            if (col % 5 == 0)   /* extra column gap every 5 glyphs */
                x += 11;
        } while (col <= 13);

        tileOff += 192;
        recBase += 14;
        row++;
    } while (row <= 2);
}
