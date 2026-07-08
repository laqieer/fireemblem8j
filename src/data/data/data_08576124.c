#include "global.h"

/* #145 B1 shiftability carve (pure typed C, no inline asm -- issue #152):
 * JP-only song962_mon_bgl_attack3 header lives in the data_08576124 remnant. The blob
 * is split at the song boundary so song962 becomes a real relocatable T symbol whose
 * tone/part pointers are relocatable refs (voicegroup038, data_08576124_576150 + off).
 * Track bytes stay raw. Byte-exact via `make compare`. */

extern const u8 voicegroup038[];

u8 data_08576124_576150[] __attribute__((section(".data.residue.08576124"))) = {
    0xBB, 0x4B, 0xBE, 0x31, 0xBD, 0x67, 0xBC, 0x00, 0xD3, 0x4C, 0x7F, 0x84, 0xBE, 0x29, 0xD3, 0x4C,
    0x7F, 0x84, 0xBE, 0x21, 0xD3, 0x4C, 0x7F, 0x84, 0xBE, 0x18, 0xD3, 0x4C, 0x7F, 0x84, 0xB1, 0x00,
    0xBE, 0x69, 0xBD, 0x74, 0xBC, 0x00, 0x8C, 0xFF, 0x43, 0x7F, 0xB0, 0xB1,
};

/* SongHeader: trackCount=2, blockCount=0, priority=0x14, reverb=0; tone; part[2] */
u32 song962_mon_bgl_attack3[] __attribute__((section(".data.residue.08576124"))) = {
    0x00140002,
    (u32)&voicegroup038,
    (u32)&data_08576124_576150 + 0x0,
    (u32)&data_08576124_576150 + 0x20,
};
