	.syntax unified
	.section .text.call_via, "ax", %progbits
@ libgcc thumb interwork call veneers, JP 0x080D65BC..0x080D65F4. The JP region is
@ 0x38 bytes (each veneer is `bx rN; nop`), which differs from the stock libgcc
@ _call_via_rX.o (.text 0x3c), so this is reproduced as real source, not lib-linked.
	.thumb
	.align 2, 0

	.global sub_80D65BC
	.thumb_func
sub_80D65BC:
	bx r0
	nop

	.global _call_via_r1
	.thumb_func
_call_via_r1:
	bx r1
	nop

	.global _call_via_r2
	.thumb_func
_call_via_r2:
	bx r2
	nop

	.global _call_via_r3
	.thumb_func
_call_via_r3:
	bx r3
	nop

	.global _call_via_r4
	.thumb_func
_call_via_r4:
	bx r4
	nop

	.global _call_via_r5
	.thumb_func
_call_via_r5:
	bx r5
	nop

	.global _call_via_r6
	.thumb_func
_call_via_r6:
	bx r6
	nop

	.global _call_via_r7
	.thumb_func
_call_via_r7:
	bx r7
	nop

	.global _call_via_r8
	.thumb_func
_call_via_r8:
	bx r8
	nop

	.global _call_via_r9
	.thumb_func
_call_via_r9:
	bx sb
	nop

	.global _call_via_sl
	.thumb_func
_call_via_sl:
	bx sl
	nop
_080D65E8:
	.byte 0x58, 0x47, 0xC0, 0x46, 0x60, 0x47, 0xC0, 0x46
	.byte 0x68, 0x47, 0xC0, 0x46
