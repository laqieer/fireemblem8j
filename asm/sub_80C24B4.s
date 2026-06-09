	.syntax unified
	.set GmMuPrim_GetFacingFromAngle, 0x080C246C + 1
	.set sub_80C5604, 0x080C5604 + 1
	.set sub_80D6364, 0x080D6364 + 1
	.section .text.sub_80C24B4, "ax", %progbits
@ sub_80C24B4 @ JP 0x080C24B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C24B4
	.thumb_func
sub_80C24B4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r6, #0
	movs r5, #0
	movs r7, #0
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r7, r0
	bge _080C251C
	mov r4, r8
	adds r4, #0x34
_080C24D2:
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_80C5604
	cmp r0, #0x23
	bls _080C250C
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80D6364
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GmMuPrim_GetFacingFromAngle
	b _080C2520
_080C250C:
	adds r4, #4
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r7, r0
	blt _080C24D2
_080C251C:
	movs r0, #1
	rsbs r0, r0, #0
_080C2520:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

