	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80B289C, 0x080B289C + 1
	.set sub_80B2924, 0x080B2924 + 1
	.set sub_80B296C, 0x080B296C + 1
	.section .text.sub_80B7E9C, "ax", %progbits
@ sub_80B7E9C @ JP 0x080B7E9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7E9C
	.thumb_func
sub_80B7E9C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	mov r5, sb
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0x1d
	bgt _080B7ED6
	adds r3, r0, #0
	movs r4, #0x1e
	str r4, [sp]
	movs r0, #5
	movs r1, #4
	movs r2, #0x32
	bl sub_8012E84
	adds r7, r0, #0
	movs r0, #0
	ldrsh r3, [r5, r0]
	str r4, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	b _080B7EFA
_080B7ED6:
	movs r1, #0
	ldrsh r3, [r5, r1]
	subs r3, #0x1e
	movs r4, #0x1e
	str r4, [sp]
	movs r0, #0
	movs r1, #0x32
	movs r2, #0x64
	bl sub_8012E84
	adds r7, r0, #0
	movs r2, #0
	ldrsh r3, [r5, r2]
	subs r3, #0x1e
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
_080B7EFA:
	bl sub_8012E84
	mov sl, r0
	cmp r7, #0x31
	ble _080B7F08
	movs r0, #0x64
	subs r7, r0, r7
_080B7F08:
	mov r6, sb
	adds r6, #0x4c
	movs r0, #0
	ldrsh r3, [r6, r0]
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xd6
	bl sub_8012E84
	adds r5, r0, #0
	movs r1, #0
	ldrsh r3, [r6, r1]
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x80
	bl sub_8012E84
	adds r4, r0, #0
	movs r2, #0x4e
	add r2, sb
	mov r8, r2
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r7, #2
	adds r0, r0, r7
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_80B289C
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	adds r1, r2, #0
	bl sub_80B2924
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0x48
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x50
	bl sub_80B296C
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #0x40
	strh r0, [r1]
	mov r2, sl
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble _080B7FC0
	mov r0, sb
	bl sub_8002DE4
	ldr r2, _080B7FD0 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_080B7FC0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7FD0: .4byte 0x03003020

