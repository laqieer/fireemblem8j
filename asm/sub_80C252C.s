	.syntax unified
	.set MapUnitC_GetAnimId, 0x080BFDA0 + 1
	.set MapUnitC_GetPosition, 0x080BFD74 + 1
	.set MapUnitC_SetGfxNeedsUpdate, 0x080BFED4 + 1
	.set sub_80BFDB4, 0x080BFDB4 + 1
	.set sub_80C23C4, 0x080C23C4 + 1
	.set sub_80C24B4, 0x080C24B4 + 1
	.set sub_80C3248, 0x080C3248 + 1
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_80C252C, "ax", %progbits
@ sub_80C252C @ JP 0x080C252C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C252C
	.thumb_func
sub_80C252C:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	bl sub_80C23C4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C260A
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #0x20
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _080C2570
	adds r0, r6, #0
	bl sub_80C3248
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C2570
	ldr r0, _080C2614 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C2570
	adds r0, r6, #0
	bl sub_80C3248
_080C2570:
	adds r0, r6, #0
	bl sub_80C24B4
	adds r4, r0, #0
	adds r7, r6, #0
	adds r7, #0x2b
	cmp r4, #0
	blt _080C25B4
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	bl MapUnitC_GetAnimId
	cmp r0, r4
	beq _080C25B4
	ldrb r1, [r5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080C25B4
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r2, r4, #0
	bl sub_80BFDB4
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	bl MapUnitC_SetGfxNeedsUpdate
_080C25B4:
	ldrb r1, [r5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C25F6
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
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
	ldr r1, _080C2618 @ =0x03005270
	ldrh r0, [r4]
	strh r0, [r1, #2]
	ldrh r0, [r5]
	strh r0, [r1, #4]
_080C25F6:
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r2, r6, #0
	adds r2, #0x44
	adds r3, r6, #0
	adds r3, #0x46
	bl MapUnitC_GetPosition
_080C260A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C2614: .4byte 0x085775CC
_080C2618: .4byte 0x03005270

