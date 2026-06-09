	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806BBA0, 0x0806BBA0 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_806BCCC, "ax", %progbits
@ sub_806BCCC @ JP 0x0806BCCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806BCCC
	.thumb_func
sub_806BCCC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	movs r1, #0xc
	bl sub_80D637C
	cmp r0, #0
	bne _0806BDD2
	ldrh r1, [r7, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0806BD50
	ldr r0, [r7, #0x5c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	movs r5, #3
	ands r1, r5
	movs r6, #0x80
	lsls r6, r6, #1
	ldrh r2, [r7, #0x2c]
	movs r4, #0x62
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #0
	adds r3, r6, #0
	bl sub_806BBA0
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #2
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #1
	adds r3, r6, #0
	bl sub_806BBA0
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #1
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r4, r4, r2
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	movs r2, #2
	adds r3, r6, #0
	bl sub_806BBA0
	b _0806BDCC
_0806BD50:
	ldr r0, [r7, #0x5c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	movs r5, #3
	ands r1, r5
	movs r6, #0x80
	lsls r6, r6, #1
	ldrh r2, [r7, #0x2c]
	movs r4, #0x62
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #3
	adds r3, r6, #0
	bl sub_806BBA0
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #2
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #4
	adds r3, r6, #0
	bl sub_806BBA0
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #1
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #5
	adds r3, r6, #0
	bl sub_806BBA0
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #3
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r4, r4, r2
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	movs r2, #6
	adds r3, r6, #0
	bl sub_806BBA0
_0806BDCC:
	ldrh r0, [r7, #0x2e]
	adds r0, #1
	strh r0, [r7, #0x2e]
_0806BDD2:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0x61
	bne _0806BDE0
	adds r0, r7, #0
	bl sub_8002DE4
_0806BDE0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

