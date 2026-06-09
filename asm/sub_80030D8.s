	.syntax unified
	.set sub_8002EBC, 0x08002EBC + 1
	.section .text.sub_80030D8, "ax", %progbits
@ sub_80030D8 @ JP 0x080030D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80030D8
	.thumb_func
sub_80030D8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl sub_8002EBC
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

