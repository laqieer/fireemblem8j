#include "global.h"

#include "constants/songs.h"

/* Map-unit (Mu) movement sound scripts, ported from ../fireemblem8u src/mu.c.
 * Each script is { duration, channelCount, songId, 0... }; the trailing zeros pad
 * the script to its fixed slot count. Byte-identical to the former INCBINs of
 * data/residual/MuSoundScr_*.bin (same section/order). The section name is a
 * generated partition label; the symbols are the real MuSoundScr_* arrays. */

SECTION(".rodata.dat_worldmap_gmapunit_p1471") u16 MuSoundScr_Zombie[] = {
    0x0F, 1,
    SONG_302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

SECTION(".rodata.dat_worldmap_gmapunit_p1471") u16 MuSoundScr_Skeleton[] = {
    0x0F, 1,
    SONG_304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

SECTION(".rodata.dat_worldmap_gmapunit_p1471") u16 MuSoundScr_Mogall[] = {
    0x14, 1,
    SONG_306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

SECTION(".rodata.dat_worldmap_gmapunit_p1471") u16 MuSoundScr_Spider[] = {
    0x0A, 1,
    SONG_308, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

SECTION(".rodata.dat_worldmap_gmapunit_p1471") u16 MuSoundScr_Dog[] = {
    0x15, 1,
    SONG_30A, 0, 0,
    SONG_30A, 0, 0, 0, 0, 0, 0,
    SONG_30A, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

SECTION(".rodata.dat_worldmap_gmapunit_p1471") u16 MuSoundScr_Gorgon[] = {
    0x0F, 1,
    SONG_30C, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

SECTION(".rodata.dat_worldmap_gmapunit_p1471") u16 MuSoundScr_Unused2[] = {
    0x20, 2,
    SONG_2E0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};
