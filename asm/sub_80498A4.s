	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_80498A4, "ax", %progbits
@ sub_80498A4 @ JP 0x080498A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80498A4
	.thumb_func
sub_80498A4:
	push {lr}
	ldr r0, _080498B4 @ =0x085D4110
	bl Proc_EndEach
	bl sub_804F610
	pop {r0}
	bx r0
	.align 2, 0
_080498B4: .4byte 0x085D4110

