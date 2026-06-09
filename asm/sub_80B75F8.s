	.syntax unified
	.set EndActiveClassReelBgColorProc, 0x08070ED4 + 1
	.set sub_80099D4, 0x080099D4 + 1
	.set sub_805B784, 0x0805B784 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_80B75F8, "ax", %progbits
@ sub_80B75F8 @ JP 0x080B75F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B75F8
	.thumb_func
sub_80B75F8:
	push {lr}
	bl sub_80B2874
	bl sub_805B784
	movs r0, #0
	bl sub_80099D4
	bl EndActiveClassReelBgColorProc
	pop {r0}
	bx r0

