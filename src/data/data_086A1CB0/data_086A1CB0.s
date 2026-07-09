/* data_086A1CB0 (pointer table (mixed pointers + inline data)), de-pointered from data/residual/data_086A1CB0.bin.
 * 106 words: 87 embedded 0x08xxxxxx pointers resolve to NAMED globals and are
 * emitted as relocatable .4byte Sym(+addend) (ROM stays SHIFTABLE); the remaining
 * 19 inline-data words stay raw .4byte. Byte-identical to baserom (make compare);
 * self-verified against the original .bin before wiring. Supersedes the raw INCBIN
 * and the dead asm/data_086A1CB0.s (excluded via DATA_INCBIN_ASM_EXCLUDE). */
	.section .data.residue.086A1CB0, "aw", %progbits
	.global data_086A1CB0
data_086A1CB0:
	.4byte 0x00000001, 0x00000000, 0x00000000, 0xFFFF0001, 0x007F00DD, 0x00DDFF81
	.4byte 0x40000100, 0x00000000, 0x0000FFD9, 0x40000100, 0xFFF00000, 0x0000FFD9
	.4byte 0x00000001, 0x00000000, 0x00000000, AnimSprite_EfxLiveOBJ_1 + 0x1, AnimSprite_EfxLiveOBJ_2 + 0x1, AnimSprite_EfxLiveOBJ_3 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_4 + 0x1, AnimSprite_EfxLiveOBJ_5 + 0x1, AnimSprite_EfxLiveOBJ_6 + 0x1, AnimSprite_EfxLiveOBJ_7 + 0x1, AnimSprite_EfxLiveOBJ_8 + 0x2, AnimSprite_EfxLiveOBJ_9 + 0x2
	.4byte AnimSprite_EfxLiveOBJ_10 + 0x2, AnimSprite_EfxLiveOBJ_11 + 0x2, AnimSprite_EfxLiveOBJ_12 + 0x2, AnimSprite_EfxLiveOBJ_13 + 0x2, AnimSprite_EfxLiveOBJ_14 + 0x2, AnimSprite_EfxLiveOBJ_15 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_16 + 0x1, AnimSprite_EfxLiveOBJ_17 + 0x1, AnimSprite_EfxLiveOBJ_18 + 0x1, AnimSprite_EfxLiveOBJ_19 + 0x1, AnimSprite_EfxLiveOBJ_20 + 0x1, AnimSprite_EfxLiveOBJ_21 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_22 + 0x1, AnimSprite_EfxLiveOBJ_23 + 0x1, AnimSprite_EfxLiveOBJ_24 + 0x1, AnimSprite_EfxLiveOBJ_25 + 0x1, AnimSprite_EfxLiveOBJ_26 + 0x2, AnimSprite_EfxLiveOBJ_27 + 0x2
	.4byte AnimSprite_EfxLiveOBJ_28 + 0x2, AnimSprite_EfxLiveOBJ_29 + 0x2, AnimSprite_EfxLiveOBJ_30 + 0x2, AnimSprite_EfxLiveOBJ_31 + 0x2, AnimSprite_EfxLiveOBJ_32 + 0x2, AnimSprite_EfxLiveOBJ_33 + 0x2
	.4byte AnimSprite_EfxLiveOBJ_34 + 0x2, AnimSprite_EfxLiveOBJ_35 + 0x2, 0x80000000, AnimSprite_EfxLiveOBJ_78 + 0x1, AnimSprite_EfxLiveOBJ_79 + 0x1, AnimSprite_EfxLiveOBJ_80 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_81 + 0x1, AnimSprite_EfxLiveOBJ_82 + 0x1, AnimSprite_EfxLiveOBJ_83 + 0x1, AnimSprite_EfxLiveOBJ_84 + 0x1, AnimSprite_EfxLiveOBJ_85 + 0x1, AnimSprite_EfxLiveOBJ_86 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_87 + 0x1, AnimSprite_EfxLiveOBJ_88 + 0x1, AnimSprite_EfxLiveOBJ_89 + 0x1, AnimSprite_EfxLiveOBJ_90 + 0x1, AnimSprite_EfxLiveOBJ_91 + 0x1, AnimSprite_EfxLiveOBJ_92 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_93 + 0x1, AnimSprite_EfxLiveOBJ_94 + 0x1, AnimSprite_EfxLiveOBJ_95 + 0x1, AnimSprite_EfxLiveOBJ_96 + 0x1, AnimSprite_EfxLiveOBJ_97 + 0x1, AnimSprite_EfxLiveOBJ_98 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_99 + 0x1, AnimSprite_EfxLiveOBJ_100 + 0x1, AnimSprite_EfxLiveOBJ_101 + 0x1, AnimSprite_EfxLiveOBJ_102 + 0x1, AnimSprite_EfxLiveOBJ_103 + 0x1, AnimSprite_EfxLiveOBJ_104 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_105 + 0x1, AnimSprite_EfxLiveOBJ_106 + 0x1, AnimSprite_EfxLiveOBJ_107 + 0x1, AnimSprite_EfxLiveOBJ_108 + 0x1, AnimSprite_EfxLiveOBJ_109 + 0x1, AnimSprite_EfxLiveOBJ_110 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_111 + 0x1, AnimSprite_EfxLiveOBJ_112 + 0x1, AnimSprite_EfxLiveOBJ_113 + 0x1, AnimSprite_EfxLiveOBJ_114 + 0x1, AnimSprite_EfxLiveOBJ_115 + 0x1, AnimSprite_EfxLiveOBJ_116 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_117 + 0x1, AnimSprite_EfxLiveOBJ_118 + 0x1, AnimSprite_EfxLiveOBJ_119 + 0x1, AnimSprite_EfxLiveOBJ_120 + 0x1, AnimSprite_EfxLiveOBJ_121 + 0x1, AnimSprite_EfxLiveOBJ_122 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_123 + 0x1, AnimSprite_EfxLiveOBJ_124 + 0x1, AnimSprite_EfxLiveOBJ_125 + 0x1, AnimSprite_EfxLiveOBJ_126 + 0x1, AnimSprite_EfxLiveOBJ_127 + 0x1, AnimSprite_EfxLiveOBJ_128 + 0x1
	.4byte AnimSprite_EfxLiveOBJ_129 + 0x1, 0x80000000, 0x186A0984, 0x80000000
