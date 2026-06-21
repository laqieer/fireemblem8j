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
