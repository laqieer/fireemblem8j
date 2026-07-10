#include "global.h"
#include "anime.h"

/* Crimson Eye palette, active sprite frames/scripts, and opaque unused tail.
 * Only the five interpreter-dereferenced active FORCE_SPRITE words are
 * relocatable; the unused tail remains literal per issue #166's rescope. */

u16 Pal_CrimsonEyeSprites[] __attribute__((section(".data.residue.086E24B4"))) =
{
    0x520E, 0x1C27, 0x306F, 0x4575, 0x55BB, 0x5E3F, 0x76DF, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};

struct AnimSpriteData AnimSprite_EfxCrimsonEye_1[] __attribute__((section(".data.residue.086E24B4"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0000, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData AnimSprite_EfxCrimsonEye_2[] __attribute__((section(".data.residue.086E24B4"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0004, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData AnimSprite_EfxCrimsonEye_3[] __attribute__((section(".data.residue.086E24B4"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x0008, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData AnimSprite_EfxCrimsonEye_4[] __attribute__((section(".data.residue.086E24B4"))) =
{
    { .header = 0x80000000, .as = { .object = { 0x000C, -16, -16 } } },
    ANIM_SPRITE_END,
};

struct AnimSpriteData AnimSprite_EfxCrimsonEye_5[] __attribute__((section(".data.residue.086E24B4"))) =
{
    { .header = 0x00000000, .as = { .object = { 0x0010, -4, -4 } } },
    ANIM_SPRITE_END,
};

u32 AnimScr_EfxCrimsonEyeOBJ[] __attribute__((section(".data.residue.086E24B4"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxCrimsonEye_1, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxCrimsonEye_2, 4),
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxCrimsonEye_3, 4),
    ANIMSCR_LOOP,
};

u32 AnimScr_EfxCrimsonEyeOBJFinishPiece1[] __attribute__((section(".data.residue.086E24B4"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxCrimsonEye_4, 4),
    ANIMSCR_LOOP,
};

u32 AnimScr_EfxCrimsonEyeOBJFinishPiece2[] __attribute__((section(".data.residue.086E24B4"))) =
{
    ANIMSCR_FORCE_SPRITE(AnimSprite_EfxCrimsonEye_5, 4),
    ANIMSCR_LOOP,
};

u32 data_086E256C[] __attribute__((section(".data.residue.086E24B4"))) =
{
    0x90000000, 0xFFF00000,
    0x0000FFF0, 0x00000001, 0x00000000, 0x00000000,
    0x90000000, 0xFFF00004, 0x0000FFF0, 0x00000001,
    0x00000000, 0x00000000, 0x90000000, 0xFFF00008,
    0x0000FFF0, 0x00000001, 0x00000000, 0x00000000,
    0x90000000, 0xFFF0000C, 0x0000FFF0, 0x00000001,
    0x00000000, 0x00000000, 0x10000000, 0xFFFC0010,
    0x0000FFFC, 0x00000001, 0x00000000, 0x00000000,
    0x186E256C, 0x186E2584, 0x186E259C, 0x82000000,
    0x186E25B4, 0x82000000, 0x186E25CC, 0x82000000,
};
