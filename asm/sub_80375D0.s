	.syntax unified
	.set StartFireTrapAnim, 0x0801F2E4 + 1
	.section .text.sub_80375D0, "ax", %progbits
@ sub_80375D0 @ JP 0x080375D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80375D0
	.thumb_func
sub_80375D0:
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl StartFireTrapAnim
	pop {r0}
	bx r0
	.align 2, 0

