#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_TeonoObjCloseRight
 */

extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoO[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_0[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_1[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_2[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_3[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_0[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_1[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_2[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_3[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_4[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjCloseRight_5[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_0[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_4[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_5[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_6[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_7[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_8[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_9[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_10[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_11[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_12[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj_13[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjFarRight_0[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObjFarRight_1[];
extern struct AnimSpriteData AnimSprite_EfxTeonoObj_TeonoObj2Right[];

u32 data_08604A8C[] __attribute__((section(".data.residue.08604A8C"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoO, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObjCloseRight_0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObjCloseRight_1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObjCloseRight_2, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObjCloseRight_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObjCloseRight_4, 3),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObjCloseRight_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_7, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_8, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_13, 1),
    ANIMSCR_BLOCKED,

    /* AnimScr_TeonoObjFarRight */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoO, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_1, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_2, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_3, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObjFarRight_0, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObjFarRight_1, 2),
    ANIMSCR_BLOCKED,

    /* AnimScr_TeonoObj2Right */
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj2Right, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_0, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_4, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_5, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_6, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_8, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_9, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_11, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_12, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxTeonoObj_TeonoObj_13, 1),
    ANIMSCR_BLOCKED,
};
