	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80BF4C0, "ax", %progbits
@ sub_80BF4C0 @ JP 0x080BF4C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF4C0
	.thumb_func
sub_80BF4C0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0x38
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _080BF562
	movs r2, #0
	cmp r2, r0
	bge _080BF55E
_080BF4DC:
	lsls r1, r2, #3
	ldr r0, [r6, #0x3c]
	adds r4, r0, r1
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #3
	mov sb, r0
	ldrb r0, [r4, #2]
	movs r1, #0x1f
	ands r1, r0
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsls r3, r0, #5
	movs r5, #0
	movs r0, #5
	ldrsb r0, [r4, r0]
	adds r2, #1
	mov r8, r2
	cmp r5, r0
	bge _080BF554
	lsls r0, r1, #5
	ldr r1, _080BF574 @ =0x06008000
	adds r1, r1, r0
	mov sl, r1
_080BF50C:
	movs r2, #3
	ldrsb r2, [r4, r2]
	adds r2, r2, r5
	movs r0, #0x1f
	ands r2, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r1, r5
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	ldr r1, [r6, #0x2c]
	adds r1, r1, r0
	mov r7, sb
	lsls r0, r7, #2
	adds r0, r1, r0
	lsls r2, r2, #0xa
	mov r7, sl
	adds r1, r2, r7
	adds r2, r3, #0
	cmp r2, #0
	bge _080BF53A
	adds r2, #3
_080BF53A:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	str r3, [sp]
	bl sub_80D636C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	movs r0, #5
	ldrsb r0, [r4, r0]
	ldr r3, [sp]
	cmp r5, r0
	blt _080BF50C
_080BF554:
	mov r2, r8
	movs r1, #0x38
	ldrsh r0, [r6, r1]
	cmp r2, r0
	blt _080BF4DC
_080BF55E:
	movs r0, #0
	strh r0, [r6, #0x38]
_080BF562:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF574: .4byte 0x06008000

