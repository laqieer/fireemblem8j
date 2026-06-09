	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B762C, 0x080B762C + 1
	.section .text.sub_80B7B64, "ax", %progbits
@ sub_80B7B64 @ JP 0x080B7B64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7B64
	.thumb_func
sub_80B7B64:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	adds r1, r3, #0
	asrs r1, r1, #4
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r5, [r1]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	subs r2, r1, r0
	movs r6, #0x80
	lsls r6, r6, #1
	str r6, [sp]
	ldrh r0, [r4, #0x2a]
	asrs r0, r0, #4
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r2, #0
	movs r2, #0x18
	bl sub_80B762C
	ldrh r0, [r4, #0x2a]
	adds r0, #0x10
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r6
	bne _080B7BB8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
_080B7BB8:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

