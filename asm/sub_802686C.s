	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_802686C, "ax", %progbits
@ sub_802686C @ JP 0x0802686C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802686C
	.thumb_func
sub_802686C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _080268F4 @ =0x085C3B5C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	mov sb, r0
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r6, #0
	ldr r0, _080268F8 @ =0x085C3B48
	mov sl, r0
	movs r0, #0x80
	lsls r0, r0, #3
	add r0, sb
	ldr r2, _080268FC @ =0x0203400C
	adds r4, r0, r2
	movs r3, #0x40
	mov r8, r3
	movs r7, #0
	lsls r5, r1, #7
_080268A6:
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	lsls r1, r6, #0xd
	ldr r2, _080268FC @ =0x0203400C
	add r2, sb
	adds r1, r1, r2
	movs r2, #0x10
	bl sub_80D636C
	mov r2, sl
	ldr r0, [r2]
	add r0, r8
	adds r1, r4, #0
	movs r2, #0x10
	bl sub_80D636C
	movs r3, #0x80
	lsls r3, r3, #6
	adds r4, r4, r3
	add r8, r5
	adds r7, r7, r5
	adds r6, #1
	cmp r6, #2
	ble _080268A6
	ldr r0, _080268F4 @ =0x085C3B5C
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080268F4: .4byte 0x085C3B5C
_080268F8: .4byte 0x085C3B48
_080268FC: .4byte 0x0203400C

