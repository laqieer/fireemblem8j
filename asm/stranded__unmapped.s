	.section .text.s_080D6B14, "ax", %progbits
@ vfprintf region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6B14..0x080D6B28
	.thumb
	.align 2, 0
	.global vfprintf
	.thumb_func
vfprintf:
	.incbin "data/residual/vfprintf.bin"

	.section .text.s_080D8BE8, "ax", %progbits
@ __sfp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D8BE8..0x080D8C5C
	.thumb
	.align 2, 0
	.global __sfp
	.thumb_func
__sfp:
	.incbin "data/residual/__sfp.bin"


	.section .text.s_080D99C0, "ax", %progbits
@ _Bfree region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D99C0..0x080D99D8
	.thumb
	.align 2, 0
	.global _Bfree
	.thumb_func
_Bfree:
	.incbin "data/residual/_Bfree.bin"

	.section .text.s_080D9AF4, "ax", %progbits
@ _hi0bits region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9AF4..0x080D9B4C
	.thumb
	.align 2, 0
	.global _hi0bits
	.thumb_func
_hi0bits:
	.incbin "data/residual/_hi0bits.bin"

	.section .text.s_080D9EC8, "ax", %progbits
@ __mdiff region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9EC8..0x080D9FB8
	.thumb
	.align 2, 0
	.global __mdiff
	.thumb_func
__mdiff:
	.incbin "data/residual/__mdiff.bin"

	.section .text.s_080D9FB8, "ax", %progbits
@ _ulp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D9FB8..0x080DA004
	.thumb
	.align 2, 0
	.global _ulp
	.thumb_func
_ulp:
	.incbin "data/residual/_ulp.bin"

	.section .text.s_080DA004, "ax", %progbits
@ _b2d region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA004..0x080DA0C0
	.thumb
	.align 2, 0
	.global _b2d
	.thumb_func
_b2d:
	.incbin "data/residual/_b2d.bin"

	.section .text.s_080DA0C0, "ax", %progbits
@ _d2b region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA0C0..0x080DA1A8
	.thumb
	.align 2, 0
	.global _d2b
	.thumb_func
_d2b:
	.incbin "data/residual/_d2b.bin"

	.section .text.s_080DA1A8, "ax", %progbits
@ _ratio region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA1A8..0x080DA1F8
	.thumb
	.align 2, 0
	.global _ratio
	.thumb_func
_ratio:
	.incbin "data/residual/_ratio.bin"



	.section .text.s_080DA4B8, "ax", %progbits
@ error region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA4B8..0x080DA4CC
	.thumb
	.align 2, 0
	.global error
	.thumb_func
error:
	.incbin "data/residual/error.bin"

	.section .text.s_080DA4CC, "ax", %progbits
@ wrap region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA4CC..0x080DA4E4
	.thumb
	.align 2, 0
	.global wrap
	.thumb_func
wrap:
	.incbin "data/residual/wrap.bin"

	.section .text.s_080DA5D4, "ax", %progbits
@ _lseek region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA5D4..0x080DA5E0
	.thumb
	.align 2, 0
	.global _lseek
	.thumb_func
_lseek:
	.incbin "data/residual/_lseek.bin"

	.section .text.s_080DA6F0, "ax", %progbits
@ _open region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA6F0..0x080DA704
	.thumb
	.align 2, 0
	.global _open
	.thumb_func
_open:
	.incbin "data/residual/_open.bin"

	.section .text.s_080DA738, "ax", %progbits
@ _close region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA738..0x080DA744
	.thumb
	.align 2, 0
	.global _close
	.thumb_func
_close:
	.incbin "data/residual/_close.bin"

	.section .text.s_080DA7DC, "ax", %progbits
@ _gettimeofday region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA7DC..0x080DA808
	.thumb
	.align 2, 0
	.global _gettimeofday
	.thumb_func
_gettimeofday:
	.incbin "data/residual/_gettimeofday.bin"

	.section .text.s_080DA918, "ax", %progbits
@ abort region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080DA918..0x080DA938
	.thumb
	.align 2, 0
	.global abort
	.thumb_func
abort:
	.incbin "data/residual/abort.bin"
