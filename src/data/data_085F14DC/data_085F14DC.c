#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EkrMainMini_L_Far
 */

extern struct AnimSpriteData AnimSprite_EkrMainMini_L_Far[];

u32 data_085F14DC[] __attribute__((section(".data.residue.085F14DC"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_L_Far, 4),
    ANIMSCR_BLOCKED,
};
