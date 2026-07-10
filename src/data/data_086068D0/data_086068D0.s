/* Wave46: carved from data/residual/data_086068D0.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
	.include "animscr.inc"

	.section .data.residue.086068D0, "aw", %progbits
	.global AnimSprite_EfxTeyariObjType0Right_8
	.type AnimSprite_EfxTeyariObjType0Right_8, %object
AnimSprite_EfxTeyariObjType0Right_8:
	.4byte 0xFFFF0001
	.4byte 0x001F00FE
	.4byte 0x00FEFFE1
	.4byte 0xC0004100
	.4byte 0xFF8C0000
	.4byte 0x0000FFF4
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0xFFFF0001
	.4byte 0x001600FF
	.4byte 0x00FFFFEA
	.4byte 0xC0004100
	.4byte 0xFF890000
	.4byte 0x0000FFF2
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0xFFFF0001
	.4byte 0x000D00FF
	.4byte 0x00FFFFF3
	.4byte 0xC0004100
	.4byte 0xFF870000
	.4byte 0x0000FFF1
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0xC0004000
	.4byte 0xFF850000
	.4byte 0x0000FFF2
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0000001F
	.4byte 0x0000FFF8
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.global AnimScr_EfxTeyariObjType0Right
	.type AnimScr_EfxTeyariObjType0Right, %object
AnimScr_EfxTeyariObjType0Right:
	.4byte AnimSprite_Banim_0 + 0x1
	.4byte AnimSprite_EfxTeyariObjType0Right_0 + 0x1
	.4byte AnimSprite_EfxTeyariObjType0Right_1 + 0x1
	.4byte AnimSprite_EfxTeyariObjType0Right_2 + 0x2
	.4byte AnimSprite_EfxTeyariObjType0Right_3 + 0x1
	.4byte AnimSprite_EfxTeyariObjType0Right_4 + 0x2
	.4byte AnimSprite_EfxTeyariObjType0Right_5 + 0x2
	.4byte AnimSprite_EfxTeyariObjType0Right_6 + 0x2
	.4byte AnimSprite_EfxTeyariObjType0Right_7 + 0x1
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x2
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x26
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x4A
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6F
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x86
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6E
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x86
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6E
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x86
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6E
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x86
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6D
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x86
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6D
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x86
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6D
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x86
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6D
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x86
	.4byte AnimSprite_EfxTeyariObjType0Right_8 + 0x6D
	ANIMSCR_FORCE_SPRITE AnimSprite_EfxTeyariObjType0Right_8 + 0x84, 31
	.4byte 0x84000013
	.4byte 0x80000000
