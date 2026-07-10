#include "global.h"
#include "anime.h"

/* Typed C extraction of residual raw-incbin slices from data_085F1568.c. */

extern struct AnimSpriteData AnimSprite_EkrMainMini_R_Far[];

u32 AnimScr_EkrMainMini_R_Far[] __attribute__((section(".data.residue.085F1568"))) = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_R_Far, 4),
    ANIMSCR_BLOCKED,
};

u32 AnimSprite_EkrMainMini_L_Close[] __attribute__((section(".data.residue.085F1568"))) = {
    0x80004000, 0xFFD00000,
    0x00000008, 0x80004000, 0xFFF00004, 0x00000008,
    0x40000000, 0x00100008, 0x00000008, 0x00008000,
    0x0020000A, 0x00000008, 0x80004000, 0xFFD0000B,
    0x0000FFF8, 0x80004000, 0xFFF0000F, 0x0000FFF8,
    0x40000000, 0x00100013, 0x0000FFF8, 0x40004000,
    0xFFD00015, 0x0000FFF0, 0x40004000, 0xFFF00019,
    0x0000FFF0, 0x00000001, 0x00000000, 0x00000000,
};

u32 AnimScr_EkrMainMini_L_Close[] __attribute__((section(".data.residue.085F1568"))) = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_L_Close, 4),
    ANIMSCR_BLOCKED,
};

u32 AnimSprite_EkrMainMini_R_Close[] __attribute__((section(".data.residue.085F1568"))) = {
    0x90004000, 0x00100000,
    0x00000008, 0x90004000, 0xFFF00004, 0x00000008,
    0x50000000, 0xFFE00008, 0x00000008, 0x10008000,
    0xFFD8000A, 0x00000008, 0x90004000, 0x0010000B,
    0x0000FFF8, 0x90004000, 0xFFF0000F, 0x0000FFF8,
    0x50000000, 0xFFE00013, 0x0000FFF8, 0x50004000,
    0x00100015, 0x0000FFF0, 0x50004000, 0xFFF00019,
    0x0000FFF0, 0x00000001, 0x00000000, 0x00000000,
};

u32 AnimScr_EkrMainMini_R_Close[] __attribute__((section(".data.residue.085F1568"))) = {
    ANIMSCR_FORCE_SPRITE(AnimSprite_EkrMainMini_R_Close, 4),
    ANIMSCR_BLOCKED,
};

u32 AnimSprite_EkrMainMini_R_Close_1[] __attribute__((section(".data.residue.085F1568"))) = {
    0x80004000, 0xFF951000,
    0x0000FFF8, 0x40000000, 0xFFB51008, 0x0000FFF8,
    0x80004000, 0xFFC51004, 0x0000FFF8, 0x40000000,
    0xFFE51008, 0x0000FFF8, 0x80004000, 0x000B0000,
    0x0000FFF8, 0x40000000, 0x002B0008, 0x0000FFF8,
    0x80004000, 0x003B0004, 0x0000FFF8, 0x40000000,
    0x005B0008, 0x0000FFF8, 0x00000001, 0x00000000,
    0x00000000,
};

u32 data_085F16DC[] __attribute__((section(".data.residue.085F1568"))) = {
    0x185F1670, 0x80000000,
};
