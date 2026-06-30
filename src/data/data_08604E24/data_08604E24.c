#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_TeonoObjCloseLeft
 */

extern struct AnimSpriteData AnimSprite_TeonoObj_0[];
extern struct AnimSpriteData AnimSprite_TeonoObj_1[];
extern struct AnimSpriteData AnimSprite_TeonoObj_2[];
extern struct AnimSpriteData AnimSprite_TeonoObj_3[];
extern struct AnimSpriteData AnimSprite_TeonoObj_4[];
extern struct AnimSpriteData AnimSprite_TeonoObjCloseLeft_0[];
extern struct AnimSpriteData AnimSprite_TeonoObjCloseLeft_1[];
extern struct AnimSpriteData AnimSprite_TeonoObjCloseLeft_2[];
extern struct AnimSpriteData AnimSprite_TeonoObjCloseLeft_3[];
extern struct AnimSpriteData AnimSprite_TeonoObjCloseLeft_4[];
extern struct AnimSpriteData AnimSprite_TeonoObjCloseLeft_5[];
extern struct AnimSpriteData AnimSprite_TeonoObj_5[];
extern struct AnimSpriteData AnimSprite_TeonoObj_6[];
extern struct AnimSpriteData AnimSprite_TeonoObj_7[];
extern struct AnimSpriteData AnimSprite_TeonoObj_8[];
extern struct AnimSpriteData AnimSprite_TeonoObj_9[];
extern struct AnimSpriteData AnimSprite_TeonoObj_10[];
extern struct AnimSpriteData AnimSprite_TeonoObj_11[];
extern struct AnimSpriteData AnimSprite_TeonoObj_12[];
extern struct AnimSpriteData AnimSprite_TeonoObj_13[];
extern struct AnimSpriteData AnimSprite_TeonoObj_14[];
extern struct AnimSpriteData AnimSprite_TeonoObj_15[];
extern struct AnimSpriteData AnimSprite_TeonoObjFarLeft_0[];
extern struct AnimSpriteData AnimSprite_TeonoObjFarLeft_1[];
extern struct AnimSpriteData AnimSprite_TeonoObj2Left[];

u32 data_08604E24[] __attribute__((section(".data.residue.08604E24"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjCloseLeft_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_15, 1),
    ANIMSCR_BLOCKED,

    /* AnimScr_TeonoObjFarLeft */
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_4, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjFarLeft_0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObjFarLeft_1, 2),
    ANIMSCR_BLOCKED,

    /* AnimScr_TeonoObj2Left */
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj2Left, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_9, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_10, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_13, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_14, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_TeonoObj_15, 1),
    ANIMSCR_BLOCKED,
};
