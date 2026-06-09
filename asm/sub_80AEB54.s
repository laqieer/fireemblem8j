	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.section .text.sub_80AEB54, "ax", %progbits
@ sub_80AEB54 @ JP 0x080AEB54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEB54
	.thumb_func
sub_80AEB54:
	push {lr}
	sub sp, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	movs r3, #0x18
	bl ChangeBgm
	add sp, #4
	pop {r0}
	bx r0

