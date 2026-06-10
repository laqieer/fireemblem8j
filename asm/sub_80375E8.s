	.syntax unified
	.set StartFireTrapAnim2, 0x0801F314 + 1
	.section .text.sub_80375E8, "ax", %progbits
@ sub_80375E8 @ JP 0x080375E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80375E8
	.thumb_func
sub_80375E8:
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl StartFireTrapAnim2
	pop {r0}
	bx r0
	.align 2, 0

