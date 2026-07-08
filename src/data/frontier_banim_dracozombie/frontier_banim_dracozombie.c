#include "global.h"

extern const u8 AnimScr_EfxChill_R[];
extern const u8 AnimSprite_EfxChill_L_4[];
extern const u8 AnimSprite_EfxChill_L_5[];
extern const u8 AnimSprite_EfxChill_L_6[];
extern const u8 AnimSprite_EfxChill_L_7[];

/* Migrated from asm/frontier_banim_dracozombie.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* frontier_banim_dracozombie_000_77BBB8: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_banim_dracozombie_000_77BBB8[] __attribute__((section(".data.frontier_banim_dracozombie.gap0"))) = {
    0x90008000,
    0xFFF40020,
    0x0000FFF0,
    0x50008000,
    0xFFEC0022,
    0x0000FFF0,
    0x10000000,
    0xFFF50000,
    0x0000FFE8,
    0x00000001,
    0x00000000,
    0x00000000,
    0x90008000,
    0xFFFC0020,
    0x0000FFF0,
    0x50008000,
    0xFFF40022,
    0x0000FFF0,
    0x10000000,
    0xFFFD0000,
    0x0000FFE8,
    0x00000001,
    0x00000000,
    0x00000000,
    (u32)&AnimScr_EfxChill_R + 0x55,
    (u32)&AnimScr_EfxChill_R + 0x85,
    (u32)&AnimScr_EfxChill_R + 0x55,
    (u32)&AnimScr_EfxChill_R + 0xB5,
    (u32)&AnimScr_EfxChill_R + 0x55,
    (u32)&AnimSprite_EfxChill_L_4 + 0x1,
    (u32)&AnimScr_EfxChill_R + 0x55,
    (u32)&AnimSprite_EfxChill_L_5 + 0x1,
    (u32)&frontier_banim_dracozombie_000_77BBB8 + 0x1,
    (u32)&AnimSprite_EfxChill_L_6 + 0x1,
    (u32)&frontier_banim_dracozombie_000_77BBB8 + 0x31,
    (u32)&AnimSprite_EfxChill_L_7 + 0x1,
    (u32)&frontier_banim_dracozombie_000_77BBB8 + 0x1,
    (u32)&AnimSprite_EfxChill_L_4 + 0x1,
    (u32)&AnimScr_EfxChill_R + 0x55,
    (u32)&AnimSprite_EfxChill_L_5 + 0x1,
    (u32)&AnimScr_EfxChill_R + 0x55,
    (u32)&AnimScr_EfxChill_R + 0x85,
    (u32)&AnimScr_EfxChill_R + 0x55,
    (u32)&AnimScr_EfxChill_R + 0xB5,
    0x80000000,
};
u8 frontier_banim_dracozombie_001_77BC6C[] __attribute__((section(".data.frontier_banim_dracozombie.gap1"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_001_77BC6C.4bpp.lz");
u8 frontier_banim_dracozombie_002_77CA18[] __attribute__((section(".data.frontier_banim_dracozombie.gap2"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_002_77CA18.4bpp.lz");
u8 frontier_banim_dracozombie_003_77DBCC[] __attribute__((section(".data.frontier_banim_dracozombie.gap3"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_003_77DBCC.4bpp.lz");
u8 frontier_banim_dracozombie_004_77EAB4[] __attribute__((section(".data.frontier_banim_dracozombie.gap4"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_004_77EAB4.4bpp.lz");
u8 data_0877F634[] __attribute__((section(".data.frontier_banim_dracozombie.gap4"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/data_0877F634.gbapal");
u8 frontier_banim_dracozombie_005_77F654[] __attribute__((section(".data.frontier_banim_dracozombie.gap5"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_005_77F654.bin.lz");
u8 frontier_banim_dracozombie_006_77F710[] __attribute__((section(".data.frontier_banim_dracozombie.gap6"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_006_77F710.bin.lz");
u8 frontier_banim_dracozombie_007_77F7E8[] __attribute__((section(".data.frontier_banim_dracozombie.gap7"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_007_77F7E8.bin.lz");
u8 frontier_banim_dracozombie_008_77F8E8[] __attribute__((section(".data.frontier_banim_dracozombie.gap8"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_008_77F8E8.bin.lz");
u8 frontier_banim_dracozombie_009_77FA14[] __attribute__((section(".data.frontier_banim_dracozombie.gap9"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_009_77FA14.bin.lz");
u8 frontier_banim_dracozombie_010_77FB6C[] __attribute__((section(".data.frontier_banim_dracozombie.gap10"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_010_77FB6C.bin.lz");
u8 frontier_banim_dracozombie_011_77FCE8[] __attribute__((section(".data.frontier_banim_dracozombie.gap11"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_011_77FCE8.bin.lz");
u8 frontier_banim_dracozombie_012_77FE64[] __attribute__((section(".data.frontier_banim_dracozombie.gap12"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_012_77FE64.bin.lz");
u8 frontier_banim_dracozombie_013_77FFC4[] __attribute__((section(".data.frontier_banim_dracozombie.gap13"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_013_77FFC4.bin.lz");
u8 frontier_banim_dracozombie_014_780114[] __attribute__((section(".data.frontier_banim_dracozombie.gap14"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_014_780114.bin.lz");
u8 frontier_banim_dracozombie_015_780250[] __attribute__((section(".data.frontier_banim_dracozombie.gap15"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_015_780250.bin.lz");
u8 frontier_banim_dracozombie_016_780378[] __attribute__((section(".data.frontier_banim_dracozombie.gap16"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_016_780378.bin.lz");
u8 frontier_banim_dracozombie_017_78048C[] __attribute__((section(".data.frontier_banim_dracozombie.gap17"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_017a_78048C.map.bin.lz");
u8 data_08780574[] __attribute__((section(".data.frontier_banim_dracozombie.gap17"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/data_08780574.4bpp.lz");
/* data_087819B0: raw non-LZ trailing carve (was part of hybrid JP-LZ blob), byte-exact. */
u16 data_087819B0[] __attribute__((section(".data.frontier_banim_dracozombie.gap17"))) = {
    0x3A8F, 0x345A, 0x30D8, 0x2C17, 0x2816, 0x2414, 0x1C12, 0x1810, 0x140E, 0x0C0D, 0x0C0C, 0x080B, 0x040A, 0x0008, 0x0006, 0x0002, 0x0010, 0x0008, 0x0000, 0x0100, 0x0200, 0x0300, 0x0000, 0x0004, 0x0005, 0x0006, 0x0007, 0x0800, 0x0900, 0x0A00, 0x0B00, 0x0000, 0x000C, 0x000D, 0x000E, 0x000F, 0x1000, 0x1100, 0x1200, 0x1300, 0x0000, 0x0014, 0x0015, 0x0016, 0x0017, 0x90A0, 0x1F2F, 0x0100, 0x0018, 0x0019, 0x001A, 0x1B00, 0x1C00, 0x1D00, 0x1E00, 0x0000, 0x00F0, 0x0020, 0x0021, 0x0022, 0x2300, 0x2400, 0x2500, 0x2600, 0x0000, 0x0027, 0x0028, 0x0029, 0x002A, 0x2B00, 0x2C00, 0x2D00, 0x2E00, 0x0030, 0xA02F, 0x102F, 0x303F, 0x3100, 0x0000, 0x0032, 0x0033, 0x0034, 0x0035, 0x3600, 0x3700, 0x3800, 0x3900, 0x0000, 0x003A, 0x003B, 0x003C, 0x003D, 0x3E00, 0x3F00, 0x4000, 0x4100, 0x0000, 0x0042, 0x0043, 0x0044, 0x0045, 0x4618, 0x4700, 0x2FA0, 0x3F10, 0x0048, 0x0049, 0x4A00, 0x4B00, 0x4C00, 0x4D00, 0x0000, 0x004E, 0x004F, 0x0050, 0x0051, 0x5200, 0x5300, 0x5400, 0x5500, 0x0000, 0x0056, 0x0057, 0x0058, 0x0059, 0x5A00, 0x5B00, 0x5C00, 0x5D00, 0x000C, 0x005E, 0xA05F, 0x102F, 0x603F, 0x0000, 0x0061, 0x0062, 0x0063, 0x0064, 0x6500, 0x6600, 0x6700, 0x6800, 0x0000, 0x0069, 0x006A, 0x006B, 0x006C, 0x6D00, 0x6E00, 0x6F00, 0x7000, 0x0000, 0x0071, 0x0072, 0x0073, 0x0074, 0x7506, 0x7600, 0x7700, 0x2FA0, 0x3F10, 0x0078, 0x7900, 0x7A00, 0x7B00, 0x7C00, 0x0000, 0x007D, 0x007E, 0x007F, 0x0080, 0x8100, 0x8200, 0x8300, 0x8400, 0x0000, 0x0085, 0x0086, 0x0087, 0x0088, 0x8900, 0x8A00, 0x8B00, 0x8C00, 0x0003, 0x008D, 0x008E, 0xA08F, 0x102F, 0x003F, 0x0090, 0x0091, 0x0092, 0x0093, 0x9400, 0x9500, 0x9600, 0x9700, 0x0000, 0x0098, 0x0099, 0x009A, 0x009B, 0x9C00, 0x9D00, 0x9E00, 0x9F00, 0x0000, 0x00A0, 0x00A1, 0x00A2, 0x00A3, 0xA401, 0xA500, 0xA600, 0xA700, 0x2FA0, 0x1080, 0xA83F, 0xA900, 0xAA00, 0xAB00, 0x0000, 0x00AC, 0x00AD, 0x00AE, 0x00AF, 0xB000, 0xB100, 0xB200, 0xB300, 0x0000, 0x00B4, 0x00B5, 0x00B6, 0x00B7, 0xB800, 0xB900, 0xBA00, 0xBB00, 0x0000, 0x00BC, 0x00BD, 0x00BE, 0xC0BF, 0x2FA0, 0x3F10, 0x00C0, 0x00C1, 0x00C2, 0xC300, 0xC400, 0xC500, 0xC600, 0x0000, 0x00C7, 0x00C8, 0x00C9, 0x00CA, 0xCB00, 0xCC00, 0xCD00, 0xCE00, 0x0000, 0x00CF, 0x00D0, 0x00D1, 0x00D2, 0xD300, 0xD400, 0xD500, 0xD600, 0x6000, 0xA0D7, 0x102F, 0xD83F, 0xD900, 0xDA00, 0x0000, 0x00DB, 0x00DC, 0x00DD, 0x00DE, 0xDF00, 0xE000, 0xE100, 0xE200, 0x0000, 0x00E3, 0x00E4, 0x00E5, 0x00E6, 0xE700, 0xE800, 0xE900, 0xEA00, 0x0000, 0x00EB, 0x00EC, 0x00ED, 0x3FEE, 0xEF00, 0x2FA0, 0x3F10, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0xF2FF, 0xF27F, 0xF27F, 0xF27F, 0xF27F, 0xF27F, 0xF27F, 0xF27F, 0xFF7F, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0xF2FF, 0xF27F, 0xF27F, 0xF27F, 0xF27F, 0xF27F, 0xF27F, 0xF27F, 0xFF7F, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0x7FF2, 0x7F72, 0xF0FF, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xFF01, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0xF0FF, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xFF01, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0x01F0, 0xF0FF, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xF001, 0xE001, 0x01F0, 0x01F0, 0x0190, 0x0000,
};
u8 frontier_banim_dracozombie_018_781CBC[] __attribute__((section(".data.frontier_banim_dracozombie.gap18"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_018_781CBC.4bpp.lz");
u8 frontier_banim_dracozombie_019_7832B4[] __attribute__((section(".data.frontier_banim_dracozombie.gap19"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_019_7832B4.4bpp.lz");
u8 frontier_banim_dracozombie_020_7844F0[] __attribute__((section(".data.frontier_banim_dracozombie.gap20"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_020_7844F0.4bpp.lz");
u8 frontier_banim_dracozombie_021_785C08[] __attribute__((section(".data.frontier_banim_dracozombie.gap21"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_021_785C08.4bpp.lz");
u8 frontier_banim_dracozombie_022_7875A0[] __attribute__((section(".data.frontier_banim_dracozombie.gap22"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_022_7875A0.4bpp.lz");
u8 frontier_banim_dracozombie_023_788CC4[] __attribute__((section(".data.frontier_banim_dracozombie.gap23"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_023_788CC4.4bpp.lz");
u8 frontier_banim_dracozombie_024_78A0D0[] __attribute__((section(".data.frontier_banim_dracozombie.gap24"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_024_78A0D0.4bpp.lz");
u8 frontier_banim_dracozombie_025_78AF74[] __attribute__((section(".data.frontier_banim_dracozombie.gap25"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_025_78AF74.4bpp.lz");
u8 frontier_banim_dracozombie_026_78BE1C[] __attribute__((section(".data.frontier_banim_dracozombie.gap26"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_026_78BE1C.4bpp.lz");
u8 data_0878CE88[] __attribute__((section(".data.frontier_banim_dracozombie.gap26"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/data_0878CE88.gbapal");
u8 frontier_banim_dracozombie_027_78CEA8[] __attribute__((section(".data.frontier_banim_dracozombie.gap27"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_027_78CEA8.bin.lz");
u8 frontier_banim_dracozombie_028_78D004[] __attribute__((section(".data.frontier_banim_dracozombie.gap28"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_028_78D004.bin.lz");
u8 frontier_banim_dracozombie_029_78D354[] __attribute__((section(".data.frontier_banim_dracozombie.gap29"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_029_78D354.bin.lz");
u8 frontier_banim_dracozombie_030_78D6A4[] __attribute__((section(".data.frontier_banim_dracozombie.gap30"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_030_78D6A4.bin.lz");
u8 frontier_banim_dracozombie_031_78DAB4[] __attribute__((section(".data.frontier_banim_dracozombie.gap31"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_031_78DAB4.bin.lz");
u8 frontier_banim_dracozombie_032_78DF08[] __attribute__((section(".data.frontier_banim_dracozombie.gap32"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_032_78DF08.bin.lz");
u8 frontier_banim_dracozombie_033_78E33C[] __attribute__((section(".data.frontier_banim_dracozombie.gap33"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_033_78E33C.bin.lz");
u8 frontier_banim_dracozombie_034_78E750[] __attribute__((section(".data.frontier_banim_dracozombie.gap34"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_034_78E750.bin.lz");
u8 frontier_banim_dracozombie_035_78EAE0[] __attribute__((section(".data.frontier_banim_dracozombie.gap35"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_035_78EAE0.bin.lz");
u8 frontier_banim_dracozombie_036_78EE00[] __attribute__((section(".data.frontier_banim_dracozombie.gap36"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_036a_78EE00.map.bin.lz");
u8 frontier_banim_dracozombie_036b_78F150[] __attribute__((section(".data.frontier_banim_dracozombie.gap36"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_036b_78F150.4bpp.lz");
u8 data_08794944[] __attribute__((section(".data.frontier_banim_dracozombie.gap36"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/data_08794944.gbapal");
u8 frontier_banim_dracozombie_037_794964[] __attribute__((section(".data.frontier_banim_dracozombie.gap37"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_037_794964.bin.lz");
u8 frontier_banim_dracozombie_038_794D78[] __attribute__((section(".data.frontier_banim_dracozombie.gap38"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_038_794D78.bin.lz");
u8 frontier_banim_dracozombie_039_795198[] __attribute__((section(".data.frontier_banim_dracozombie.gap39"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_039_795198.bin.lz");
u8 frontier_banim_dracozombie_040_7955B8[] __attribute__((section(".data.frontier_banim_dracozombie.gap40"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_040a_7955B8.map.bin.lz");
u8 frontier_banim_dracozombie_040b_7959D8[] __attribute__((section(".data.frontier_banim_dracozombie.gap40"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_040b_7959D8.4bpp.lz");
