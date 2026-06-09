	.syntax unified
	.set MapUnitC_GetPosition, 0x080BFD74 + 1
	.set MapUnitC_SetPosition, 0x080BFD64 + 1
	.set _DivArm2, 0x0800BB3C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80BFDB4, 0x080BFDB4 + 1
	.set sub_80C252C, 0x080C252C + 1
	.set sub_80C5628, 0x080C5628 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C2864, "ax", %progbits
@ sub_80C2864 @ JP 0x080C2864 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2864
	.thumb_func
sub_80C2864:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x29
	ldrb r3, [r0]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080C2878
	b _080C29DC
_080C2878:
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	ble _080C288C
	subs r0, r2, #1
	strh r0, [r1]
	b _080C29DC
_080C288C:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _080C28A8
	ldr r0, _080C2938 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C28A8
	ldr r0, [r7, #0x54]
	adds r0, #2
	str r0, [r7, #0x54]
_080C28A8:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	ldr r1, [r7, #0x50]
	cmp r0, r1
	bge _080C293C
	adds r2, r7, #0
	adds r2, #0x2f
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl _DivArm2
	adds r5, r0, #0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r4, r7, #0
	adds r4, #0x48
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	ldrh r1, [r4]
	adds r1, r1, r0
	mov r0, sp
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x4e
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r4, #2
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl sub_80D6378
	ldrh r1, [r4]
	adds r1, r1, r0
	mov r2, sp
	adds r2, #2
	strh r1, [r2]
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r4, #0
	ldrsh r3, [r2, r4]
	adds r3, #6
	mov r2, sp
	movs r5, #0
	ldrsh r2, [r2, r5]
	bl MapUnitC_SetPosition
	adds r0, r7, #0
	bl sub_80C252C
	b _080C29DC
	.align 2, 0
_080C2938: .4byte 0x085775CC
_080C293C:
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	adds r4, r7, #0
	adds r4, #0x2b
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r2, r7, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r2, [r2, r3]
	adds r3, r7, #0
	adds r3, #0x4e
	movs r5, #0
	ldrsh r3, [r3, r5]
	adds r3, #6
	bl MapUnitC_SetPosition
	adds r2, r7, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _080C298A
	adds r2, #9
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _080C298A
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_80BFDB4
_080C298A:
	ldrb r1, [r6]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C29CC
	ldr r0, [r7, #0x14]
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
	ldr r1, _080C29E4 @ =0x03005270
	ldrh r0, [r4]
	strh r0, [r1, #2]
	ldrh r0, [r5]
	strh r0, [r1, #4]
_080C29CC:
	adds r0, r7, #0
	bl sub_8002DE4
	ldrb r1, [r6]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6]
_080C29DC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C29E4: .4byte 0x03005270

