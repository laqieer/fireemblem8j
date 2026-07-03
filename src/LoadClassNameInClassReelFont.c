#include "global.h"
#include "classchg.h"
#include "classdisplayfont.h"
#include "ctc.h"

extern u8 gClassReelNameTable[][20]; /* JP 0x089CF318 */

void LoadClassNameInClassReelFont(struct ProcPromoSel *proc)
{
    int i;
    int xOffs;
    u16 jid;
    u8 *str;
    u8 *p;
    u8 (*tbl)[20];

    jid = proc->jid[proc->main_select];
    xOffs = 0x74;
    i = 0;
    tbl = gClassReelNameTable;
    str = tbl[jid];

    if (!*str)
        goto end_loop;
    p = str;
    do {
        struct ClassDisplayFont *font = GetClassDisplayFontInfo(*p);
        if (font->a) {
            PutSpriteExt(4, xOffs - font->xBase - 2, font->yBase + 6, font->a, 0x81 << 7);
            xOffs += font->width - font->xBase;
        }
        p++;
        i++;
        if (i > 0x13)
            goto end_loop;
    } while (*p);
end_loop:
    if (proc->u44 < 0xff)
        proc->u44++;
}
