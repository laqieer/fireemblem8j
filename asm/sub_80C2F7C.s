	.syntax unified
	.set MapUnitC_GetPosition, 0x080BFD74 + 1
	.set MapUnitC_SetPosition, 0x080BFD64 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80BFDB4, 0x080BFDB4 + 1
	.set sub_80BFF10, 0x080BFF10 + 1
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_80C2F7C, "ax", %progbits
@ sub_80C2F7C @ JP 0x080C2F7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2F7C
	.thumb_func
sub_80C2F7C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x29
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C2F96
	b _080C3106
_080C2F96:
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	cmp r2, #1
	beq _080C2FA8
	cmp r2, #2
	beq _080C3080
	adds r7, r5, #0
	b _080C30F4
_080C2FA8:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #5
	ldr r3, _080C3078 @ =0x081F5D7C
	adds r0, r0, r3
	ldrb r1, [r0, #0x1e]
	adds r0, r2, #0
	ands r0, r1
	adds r5, r6, #0
	adds r5, #0x2e
	adds r4, r6, #0
	adds r4, #0x2b
	cmp r0, #0
	beq _080C2FE8
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #5
	adds r0, r0, r3
	ldrb r0, [r0, #0x1e]
	ands r2, r0
	cmp r2, #0
	beq _080C2FE8
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #0
	bl sub_80BFF10
_080C2FE8:
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r3, #0
	ldrsb r3, [r5, r3]
	lsls r3, r3, #5
	ldr r2, _080C3078 @ =0x081F5D7C
	adds r3, r3, r2
	movs r7, #0x18
	ldrsh r2, [r3, r7]
	movs r7, #0x1a
	ldrsh r3, [r3, r7]
	adds r3, #6
	bl MapUnitC_SetPosition
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #4
	bl sub_80BFDB4
	ldr r0, _080C307C @ =0x03005270
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r5]
	strb r1, [r0, #0x11]
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _080C30F4
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80C5628
	ldrh r0, [r4]
	mov r3, r8
	strh r0, [r3, #2]
	ldrh r0, [r5]
	strh r0, [r3, #4]
	b _080C30F4
	.align 2, 0
_080C3078: .4byte 0x081F5D7C
_080C307C: .4byte 0x03005270
_080C3080:
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r4, r6, #0
	adds r4, #0x2b
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r2, r6, #0
	adds r2, #0x4c
	movs r7, #0
	ldrsh r2, [r2, r7]
	adds r3, r6, #0
	adds r3, #0x4e
	movs r7, #0
	ldrsh r3, [r3, r7]
	adds r3, #6
	bl MapUnitC_SetPosition
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #4
	bl sub_80BFDB4
	ldrb r1, [r5]
	movs r0, #8
	ands r0, r1
	adds r7, r5, #0
	cmp r0, #0
	beq _080C30F4
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80C5628
	ldr r1, _080C3114 @ =0x03005270
	ldrh r0, [r4]
	strh r0, [r1, #2]
	ldrh r0, [r5]
	strh r0, [r1, #4]
_080C30F4:
	ldrb r1, [r7]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7]
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_080C3106:
	movs r0, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C3114: .4byte 0x03005270

