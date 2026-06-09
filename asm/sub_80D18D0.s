	.syntax unified
	.set sub_805B784, 0x0805B784 + 1
	.set sub_805B7CC, 0x0805B7CC + 1
	.set sub_805BBB8, 0x0805BBB8 + 1
	.section .text.sub_80D18D0, "ax", %progbits
@ sub_80D18D0 @ JP 0x080D18D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D18D0
	.thumb_func
sub_80D18D0:
	push {lr}
	bl sub_805B784
	ldr r0, _080D18E8 @ =0x03005390
	bl sub_805B7CC
	ldr r0, _080D18EC @ =0x0201FADC
	bl sub_805BBB8
	pop {r0}
	bx r0
	.align 2, 0
_080D18E8: .4byte 0x03005390
_080D18EC: .4byte 0x0201FADC

