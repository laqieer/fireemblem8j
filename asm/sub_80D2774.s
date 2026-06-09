	.syntax unified
	.set sub_80505A0, 0x080505A0 + 1
	.section .text.sub_80D2774, "ax", %progbits
@ sub_80D2774 @ JP 0x080D2774 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2774
	.thumb_func
sub_80D2774:
	push {lr}
	bl sub_80505A0
	movs r0, #0
	pop {r1}
	bx r1

