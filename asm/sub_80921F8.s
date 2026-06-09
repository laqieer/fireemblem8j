	.syntax unified
	.set CgText_ScrollVramUp, 0x08092184 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80915E0, 0x080915E0 + 1
	.set sub_809162C, 0x0809162C + 1
	.section .text.sub_80921F8, "ax", %progbits
@ sub_80921F8 @ JP 0x080921F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80921F8
	.thumb_func
sub_80921F8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x14]
	adds r6, r5, #0
	adds r6, #0x54
	movs r2, #0
	ldrsb r2, [r6, r2]
	adds r2, #1
	lsls r2, r2, #1
	ldr r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x5b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl CgText_ScrollVramUp
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r2, #0
	mov r8, r2
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r4, r5, #0
	adds r4, #0x5f
	ldrb r0, [r4]
	lsls r0, r0, #4
	cmp r1, r0
	bne _08092272
	adds r0, r5, #0
	bl sub_80915E0
	ldrb r1, [r4]
	subs r1, #1
	ldrb r0, [r6]
	subs r0, r0, r1
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x59
	mov r2, r8
	strb r2, [r1]
	subs r4, #5
	strb r2, [r4]
	ldr r0, [r5, #0x2c]
	adds r2, r4, #0
	bl sub_809162C
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldrb r1, [r4]
	adds r0, r0, r1
	strb r0, [r4]
	adds r0, r7, #0
	bl sub_8002DE4
_08092272:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

