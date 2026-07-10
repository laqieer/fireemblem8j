/* Wave46: carved from data/residual/data_08606FE4.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
	.include "animscr.inc"

	.section .data.residue.08606FE4, "aw", %progbits
	.global AnimSprite_EfxTeyariObjType1Left_9
	.type AnimSprite_EfxTeyariObjType1Left_9, %object
AnimSprite_EfxTeyariObjType1Left_9:
	.4byte 0xFFFF0001
	.4byte 0x001FFF02
	.4byte 0x00FE001F
	.4byte 0xC0004100
	.4byte 0x00340000
	.4byte 0x0000FFF4
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0xFFFF0001
	.4byte 0x0016FF01
	.4byte 0x00FF0016
	.4byte 0xC0004100
	.4byte 0x00370000
	.4byte 0x0000FFF2
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0xFFFF0001
	.4byte 0x000DFF01
	.4byte 0x00FF000D
	.4byte 0xC0004100
	.4byte 0x00390000
	.4byte 0x0000FFF1
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0xD0004000
	.4byte 0x003B0000
	.4byte 0x0000FFF2
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x10000000
	.4byte 0xFFF8001F
	.4byte 0x0000FFF8
	.4byte 0x00000001
	.4byte 0x00000000
	.4byte 0x00000000
	.global AnimScr_EfxTeyariObjType1Left
	.type AnimScr_EfxTeyariObjType1Left, %object
AnimScr_EfxTeyariObjType1Left:
	.4byte AnimSprite_EfxTeyariObjType_2 + 0x1
	.4byte AnimSprite_EfxTeyariObjType1Left_0 + 0x1
	.4byte AnimSprite_EfxTeyariObjType1Left_2 + 0x1
	.4byte AnimSprite_EfxTeyariObjType1Left_3 + 0x1
	.4byte AnimSprite_EfxTeyariObjType1Left_4 + 0x1
	.4byte AnimSprite_EfxTeyariObjType1Left_5 + 0x2
	.4byte AnimSprite_EfxTeyariObjType1Left_6 + 0x1
	.4byte AnimSprite_EfxTeyariObjType1Left_7 + 0x2
	.4byte AnimSprite_EfxTeyariObjType1Left_8 + 0x1
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x2
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x26
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x4A
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6F
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x86
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6E
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x86
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6E
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x86
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6E
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x86
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6D
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x86
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6D
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x86
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6D
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x86
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6D
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x86
	.4byte AnimSprite_EfxTeyariObjType1Left_9 + 0x6D
	ANIMSCR_FORCE_SPRITE AnimSprite_EfxTeyariObjType1Left_9 + 0x84, 31
	.4byte 0x84000013
	.4byte 0x80000000
