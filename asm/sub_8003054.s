	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_8003054, "ax", %progbits
@ sub_8003054 @ JP 0x08003054 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003054
	.thumb_func
sub_8003054:
	push {lr}
	ldr r1, [r0, #4]
	ldr r2, [r1, #4]
	adds r1, #8
	str r1, [r0, #4]
	bl sub_80D65C4
	movs r0, #1
	pop {r1}
	bx r1

