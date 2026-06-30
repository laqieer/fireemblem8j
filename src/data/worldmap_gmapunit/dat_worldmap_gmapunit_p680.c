#include "global.h"
#include "ctc.h"

/* Migrated from asm/dat_worldmap_gmapunit_p680.s (region-same graphics, single section).
 * gTalkFaceHPosLut + gSprite_TalkText{Front,Back} ported VERBATIM from fe8u src/scene.c
 * as editable typed-C (int LUT + u16 OAM arrays); byte-identical to the original .bin.
 * Each symbol kept in the original section/order.
 */

SECTION(".rodata.dat_worldmap_gmapunit_p680") int gTalkFaceHPosLut[8] = { 3, 6, 9, 21, 24, 27, -8, 38 };

SECTION(".rodata.dat_worldmap_gmapunit_p680") u16 gSprite_TalkTextFront[] =
{
    4,
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8),       OAM2_CHR(0x21),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8 + 64),  OAM2_CHR(0x29),
    OAM0_SHAPE_64x32 + OAM0_Y(8), OAM1_SIZE_64x32 + OAM0_Y(8 + 128), OAM2_CHR(0x31),
    OAM0_SHAPE_32x32 + OAM0_Y(8), OAM1_SIZE_32x32 + OAM0_Y(8 + 192), OAM2_CHR(0x39),
};

SECTION(".rodata.dat_worldmap_gmapunit_p680") u16 gSprite_TalkTextBack[] =
{
    12,
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32,               OAM2_CHR(0x00),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(64),  OAM2_CHR(0x08),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(128), OAM2_CHR(0x10),
    OAM0_SHAPE_64x32,              OAM1_SIZE_64x32 + OAM1_X(192), OAM2_CHR(0x18),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16,               OAM2_CHR(0x80),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(32),  OAM2_CHR(0x84),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(64),  OAM2_CHR(0x88),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(96),  OAM2_CHR(0x8C),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(128), OAM2_CHR(0x90),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(160), OAM2_CHR(0x94),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(192), OAM2_CHR(0x98),
    OAM0_SHAPE_32x16 + OAM0_Y(32), OAM1_SIZE_32x16 + OAM1_X(224), OAM2_CHR(0x9C),
};
