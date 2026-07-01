#include "global.h"

/* Migrated from asm/frontier_banim_dracozombie.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* frontier_banim_dracozombie_000_77BBB8: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_banim_dracozombie.gap0, \"aw\", %progbits\n"
"	.global frontier_banim_dracozombie_000_77BBB8\n"
"frontier_banim_dracozombie_000_77BBB8:\n"
"	.4byte 0x90008000, 0xFFF40020, 0x0000FFF0, 0x50008000, 0xFFEC0022, 0x0000FFF0\n"
"	.4byte 0x10000000, 0xFFF50000, 0x0000FFE8, 0x00000001, 0x00000000, 0x00000000\n"
"	.4byte 0x90008000, 0xFFFC0020, 0x0000FFF0, 0x50008000, 0xFFF40022, 0x0000FFF0\n"
"	.4byte 0x10000000, 0xFFFD0000, 0x0000FFE8, 0x00000001, 0x00000000, 0x00000000\n"
"	.4byte AnimScr_EfxChill_R + 0x55, AnimScr_EfxChill_R + 0x85, AnimScr_EfxChill_R + 0x55, AnimScr_EfxChill_R + 0xB5, AnimScr_EfxChill_R + 0x55, AnimSprite_EfxChill_L_4 + 0x1\n"
"	.4byte AnimScr_EfxChill_R + 0x55, AnimSprite_EfxChill_L_5 + 0x1, frontier_banim_dracozombie_000_77BBB8 + 0x1, AnimSprite_EfxChill_L_6 + 0x1, frontier_banim_dracozombie_000_77BBB8 + 0x31, AnimSprite_EfxChill_L_7 + 0x1\n"
"	.4byte frontier_banim_dracozombie_000_77BBB8 + 0x1, AnimSprite_EfxChill_L_4 + 0x1, AnimScr_EfxChill_R + 0x55, AnimSprite_EfxChill_L_5 + 0x1, AnimScr_EfxChill_R + 0x55, AnimScr_EfxChill_R + 0x85\n"
"	.4byte AnimScr_EfxChill_R + 0x55, AnimScr_EfxChill_R + 0xB5, 0x80000000\n"
);
u8 frontier_banim_dracozombie_001_77BC6C[] __attribute__((section(".data.frontier_banim_dracozombie.gap1"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_001_77BC6C.4bpp.lz");
u8 frontier_banim_dracozombie_002_77CA18[] __attribute__((section(".data.frontier_banim_dracozombie.gap2"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_002_77CA18.4bpp.lz");
u8 frontier_banim_dracozombie_003_77DBCC[] __attribute__((section(".data.frontier_banim_dracozombie.gap3"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_003_77DBCC.4bpp.lz");
u8 frontier_banim_dracozombie_004_77EAB4[] __attribute__((section(".data.frontier_banim_dracozombie.gap4"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_004_77EAB4.bin", 0x0, 0xB80);
u8 data_0877F634[] __attribute__((section(".data.frontier_banim_dracozombie.gap4"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_004_77EAB4.bin", 0xB80, 0x20);
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
u8 frontier_banim_dracozombie_017_78048C[] __attribute__((section(".data.frontier_banim_dracozombie.gap17"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_017_78048C.bin");
u8 frontier_banim_dracozombie_018_781CBC[] __attribute__((section(".data.frontier_banim_dracozombie.gap18"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_018_781CBC.4bpp.lz");
u8 frontier_banim_dracozombie_019_7832B4[] __attribute__((section(".data.frontier_banim_dracozombie.gap19"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_019_7832B4.4bpp.lz");
u8 frontier_banim_dracozombie_020_7844F0[] __attribute__((section(".data.frontier_banim_dracozombie.gap20"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_020_7844F0.4bpp.lz");
u8 frontier_banim_dracozombie_021_785C08[] __attribute__((section(".data.frontier_banim_dracozombie.gap21"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_021_785C08.4bpp.lz");
u8 frontier_banim_dracozombie_022_7875A0[] __attribute__((section(".data.frontier_banim_dracozombie.gap22"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_022_7875A0.4bpp.lz");
u8 frontier_banim_dracozombie_023_788CC4[] __attribute__((section(".data.frontier_banim_dracozombie.gap23"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_023_788CC4.4bpp.lz");
u8 frontier_banim_dracozombie_024_78A0D0[] __attribute__((section(".data.frontier_banim_dracozombie.gap24"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_024_78A0D0.4bpp.lz");
u8 frontier_banim_dracozombie_025_78AF74[] __attribute__((section(".data.frontier_banim_dracozombie.gap25"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_025_78AF74.4bpp.lz");
u8 frontier_banim_dracozombie_026_78BE1C[] __attribute__((section(".data.frontier_banim_dracozombie.gap26"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_026_78BE1C.bin", 0x0, 0x106C);
u8 data_0878CE88[] __attribute__((section(".data.frontier_banim_dracozombie.gap26"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_026_78BE1C.bin", 0x106C, 0x20);
u8 frontier_banim_dracozombie_027_78CEA8[] __attribute__((section(".data.frontier_banim_dracozombie.gap27"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_027_78CEA8.bin.lz");
u8 frontier_banim_dracozombie_028_78D004[] __attribute__((section(".data.frontier_banim_dracozombie.gap28"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_028_78D004.bin.lz");
u8 frontier_banim_dracozombie_029_78D354[] __attribute__((section(".data.frontier_banim_dracozombie.gap29"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_029_78D354.bin.lz");
u8 frontier_banim_dracozombie_030_78D6A4[] __attribute__((section(".data.frontier_banim_dracozombie.gap30"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_030_78D6A4.bin.lz");
u8 frontier_banim_dracozombie_031_78DAB4[] __attribute__((section(".data.frontier_banim_dracozombie.gap31"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_031_78DAB4.bin.lz");
u8 frontier_banim_dracozombie_032_78DF08[] __attribute__((section(".data.frontier_banim_dracozombie.gap32"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_032_78DF08.bin.lz");
u8 frontier_banim_dracozombie_033_78E33C[] __attribute__((section(".data.frontier_banim_dracozombie.gap33"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_033_78E33C.bin.lz");
u8 frontier_banim_dracozombie_034_78E750[] __attribute__((section(".data.frontier_banim_dracozombie.gap34"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_034_78E750.bin.lz");
u8 frontier_banim_dracozombie_035_78EAE0[] __attribute__((section(".data.frontier_banim_dracozombie.gap35"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_035_78EAE0.bin.lz");
u8 frontier_banim_dracozombie_036_78EE00[] __attribute__((section(".data.frontier_banim_dracozombie.gap36"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_036_78EE00.bin");
u8 frontier_banim_dracozombie_037_794964[] __attribute__((section(".data.frontier_banim_dracozombie.gap37"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_037_794964.bin.lz");
u8 frontier_banim_dracozombie_038_794D78[] __attribute__((section(".data.frontier_banim_dracozombie.gap38"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_038_794D78.bin.lz");
u8 frontier_banim_dracozombie_039_795198[] __attribute__((section(".data.frontier_banim_dracozombie.gap39"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_039_795198.bin.lz");
u8 frontier_banim_dracozombie_040_7955B8[] __attribute__((section(".data.frontier_banim_dracozombie.gap40"))) = INCBIN_U8("graphics/frontier_banim_dracozombie/frontier_banim_dracozombie_040_7955B8.bin");
