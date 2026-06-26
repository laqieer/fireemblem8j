#include "global.h"

/* De-pointered from data/residual/gMPlayJumpTableTemplate.bin by scripts/repoint_table.py.
 * Pointer words are emitted as relocatable symbol references so the ROM
 * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).
 *
 * Defined under a private name + published as a type-less assembler
 * alias so a typed header declaration (struct Foo NAME[];) does not
 * conflict -- the data bytes (.word relocations) are byte-identical. */

extern const u8 FadeOutBody[];
extern const u8 RealClearChain[];
extern const u8 SampleFreqSet[];
extern const u8 SoundMainBTM[];
extern const u8 TrackStop[];
extern const u8 TrkVolPitSet[];
extern const u8 ply_bend[];
extern const u8 ply_bendr[];
extern const u8 ply_endtie[];
extern const u8 ply_fine[];
extern const u8 ply_goto[];
extern const u8 ply_keysh[];
extern const u8 ply_lfodl[];
extern const u8 ply_lfos[];
extern const u8 ply_mod[];
extern const u8 ply_modt[];
extern const u8 ply_pan[];
extern const u8 ply_patt[];
extern const u8 ply_pend[];
extern const u8 ply_port[];
extern const u8 ply_prio[];
extern const u8 ply_rept[];
extern const u8 ply_tempo[];
extern const u8 ply_tune[];
extern const u8 ply_voice[];
extern const u8 ply_vol[];

SECTION(".rodata.dat_gMPlayJumpTableTemplate_ref") static const u32 gMPlayJumpTableTemplate__shift[] = {
    (u32)&ply_fine + 0x1,
    (u32)&ply_goto + 0x1,
    (u32)&ply_patt + 0x1,
    (u32)&ply_pend + 0x1,
    (u32)&ply_rept + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_prio + 0x1,
    (u32)&ply_tempo + 0x1,
    (u32)&ply_keysh + 0x1,
    (u32)&ply_voice + 0x1,
    (u32)&ply_vol + 0x1,
    (u32)&ply_pan + 0x1,
    (u32)&ply_bend + 0x1,
    (u32)&ply_bendr + 0x1,
    (u32)&ply_lfos + 0x1,
    (u32)&ply_lfodl + 0x1,
    (u32)&ply_mod + 0x1,
    (u32)&ply_modt + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_tune + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_port + 0x1,
    (u32)&ply_fine + 0x1,
    (u32)&ply_endtie + 0x1,
    (u32)&SampleFreqSet + 0x1,
    (u32)&TrackStop + 0x1,
    (u32)&FadeOutBody + 0x1,
    (u32)&TrkVolPitSet + 0x1,
    (u32)&RealClearChain + 0x1,
    (u32)&SoundMainBTM + 0x1,
};
__asm__(".global gMPlayJumpTableTemplate\n\t.set gMPlayJumpTableTemplate, gMPlayJumpTableTemplate__shift\n");
