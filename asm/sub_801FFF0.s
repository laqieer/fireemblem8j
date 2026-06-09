	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_801FFF0, "ax", %progbits
@ sub_801FFF0 @ JP 0x0801FFF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FFF0
	.thumb_func
sub_801FFF0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r0, #0x4c
	str r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, _08020188 @ =0x085C35A0
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r0, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	adds r3, r7, #0
	adds r3, #0x4e
	str r3, [sp, #8]
	movs r4, #0
	ldrsh r3, [r3, r4]
	adds r5, r7, #0
	adds r5, #0x68
	str r5, [sp, #0xc]
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	str r0, [r7, #0x2c]
	ldr r2, _0802018C @ =0x085C35B2
	ldr r5, [sp, #4]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r0, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r4, [sp, #8]
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r4, [sp, #0xc]
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #0
	bl sub_8012E84
	str r0, [r7, #0x30]
	movs r0, #0x64
	adds r0, r0, r7
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x64
	bgt _080200E6
	movs r1, #0xa0
	lsls r1, r1, #1
	mov r2, sl
	movs r4, #0
	ldrsh r3, [r2, r4]
	movs r0, #0x64
	str r0, [sp]
	movs r0, #4
	movs r2, #0x40
	bl sub_8012E84
	mov r8, r0
	ldr r4, _08020190 @ =0x080DC15C
	movs r5, #0x80
	adds r5, r5, r4
	mov sb, r5
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r3, sl
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
_080200E6:
	ldr r0, [r7, #0x2c]
	subs r0, #0x10
	ldr r4, _08020194 @ =0x000001FF
	ands r0, r4
	ldr r1, [r7, #0x30]
	subs r1, #0x10
	ands r1, r4
	movs r5, #0x80
	lsls r5, r5, #1
	orrs r1, r5
	ldr r6, _08020198 @ =0x085B8CEC
	ldr r3, _0802019C @ =0x00002210
	adds r2, r6, #0
	bl CallARM_PushToSecondaryOAM
	ldr r1, [r7, #0x2c]
	movs r0, #0xe0
	subs r0, r0, r1
	ands r0, r4
	ldr r2, [r7, #0x30]
	movs r1, #0x90
	subs r1, r1, r2
	ands r1, r4
	orrs r1, r5
	ldr r3, _080201A0 @ =0x00002214
	adds r2, r6, #0
	bl CallARM_PushToSecondaryOAM
	ldr r4, [sp, #8]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r5, [sp, #0xc]
	movs r2, #0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _08020178
	movs r0, #0
	strh r0, [r4]
	ldr r3, [sp, #4]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r4, r7, #0
	adds r4, #0x66
	movs r5, #0
	ldrsh r3, [r4, r5]
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0
	movs r1, #3
	movs r2, #8
	bl sub_8012E84
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r2, [sp, #4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	ldr r4, _08020188 @ =0x085C35A0
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08020178
	adds r0, r7, #0
	bl sub_8002DE4
_08020178:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020188: .4byte 0x085C35A0
_0802018C: .4byte 0x085C35B2
_08020190: .4byte 0x080DC15C
_08020194: .4byte 0x000001FF
_08020198: .4byte 0x085B8CEC
_0802019C: .4byte 0x00002210
_080201A0: .4byte 0x00002214

