#include "global.h"
#include "anime.h"

extern struct AnimSpriteData AnimSprite_EfxBerserk2_1[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_2[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_3[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_4[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_5[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_6[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_7[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_8[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_9[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_10[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_11[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_12[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_13[];
extern struct AnimSpriteData AnimSprite_EfxBerserk2_14[];

struct AnimSpriteData AnimSprite_EfxBerserk2_15[] __attribute__((section(".data.residue.086BA1E4"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x001F, 0, -8 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData AnimSprite_EfxBerserk2_15b[] __attribute__((section(".data.residue.086BA1FC"))) =
{
    { .header = 0x40000000, .as = { .object = { 0x0040, -8, -72 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData AnimSprite_EfxBerserk2_15c[] __attribute__((section(".data.residue.086BA214"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0015, 0, -96 } } },
    { .header = 0x90000000, .as = { .object = { 0x0015, -32, -96 } } },
    { .header = 0xA0000000, .as = { .object = { 0x0015, 0, -64 } } },
    { .header = 0xB0000000, .as = { .object = { 0x0015, -32, -64 } } },
    ANIM_SPRITE_END,
};

u32 AnimScr_EfxBerserk6[] __attribute__((section(".data.residue.086BA250"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_1, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_2, 2),
    ANIMSCR_BLOCKED,

    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_3, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_4, 2),
    ANIMSCR_BLOCKED,

    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_5, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_6, 2),
    ANIMSCR_BLOCKED,

    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_7, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_8, 2),
    ANIMSCR_BLOCKED,

    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_9, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_10, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_11, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_12, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_13, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_14, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_15, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_15b, 2),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxBerserk2_15c, 2),
    ANIMSCR_BLOCKED,
};
