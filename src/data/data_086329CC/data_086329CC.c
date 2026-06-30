#include "global.h"
#include "anime.h"

/* Battle-anim ANIMSCR pointer-list, decoded from the JP ROM into editable
 * ANIMSCR_FORCE_SPRITE macros (axis #6). Each entry is one 32-bit word:
 * AnimSprite address + duration; ANIMSCR_BLOCKED (0x80000000) ends a script.
 * Byte-identical to the original INCBIN; make compare is the oracle.
 * Baseline AnimScr_* aliases into this table: AnimScr_EfxElfireObjLeft
 */

extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_35[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_36[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_37[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_38[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_39[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_40[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_41[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_42[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_43[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_44[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_45[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_46[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_47[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_48[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_49[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_50[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_51[];
extern u8 data_0863230C[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_53[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_54[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_55[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_56[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_57[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_58[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_60[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_61[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_62[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_63[];
extern struct AnimSpriteData AnimSprite_EfxElfireOBJ_64[];

u32 data_086329CC[] __attribute__((section(".data.residue.086329CC"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_35, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_36, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_36, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_37, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_38, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_39, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_40, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_41, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_42, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_43, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_44, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_45, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_46, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_47, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_48, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_49, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_50, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_51, 1),
    ANIMSCR_FORCE_SPRITE(data_0863230C, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_53, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_54, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_55, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_56, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_57, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_58, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_60, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_61, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_62, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_63, 1),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxElfireOBJ_64, 1),
    ANIMSCR_BLOCKED,
};
