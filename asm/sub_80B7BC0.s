	.syntax unified
	.set sub_80B762C, 0x080B762C + 1
	.section .text.sub_80B7BC0, "ax", %progbits
@ sub_80B7BC0 @ JP 0x080B7BC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7BC0
	.thumb_func
sub_80B7BC0:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	movs r5, #0
	str r5, [sp, #4]
	movs r2, #0x18
	bl sub_80B762C
	strh r5, [r4, #0x2a]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

