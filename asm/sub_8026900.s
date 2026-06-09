	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8026900, "ax", %progbits
@ sub_8026900 @ JP 0x08026900 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026900
	.thumb_func
sub_8026900:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	mov sb, r1
	ldr r1, _080269CC @ =0x085C3B5C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r5, r0, #5
	mov r1, sb
	lsrs r0, r1, #7
	movs r2, #1
	mov sb, r2
	mov r1, sb
	bics r1, r0
	mov sb, r1
	movs r7, #0
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0xc]
	ldr r0, _080269D0 @ =0x0203400C
	mov r8, r0
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r5, r1
	mov r2, r8
	adds r6, r0, r2
	movs r0, #0x40
	str r0, [sp, #0x10]
	movs r1, #0
	mov sl, r1
_08026946:
	movs r2, #0
	str r2, [sp]
	lsls r4, r7, #0xd
	mov r0, r8
	adds r1, r5, r0
	adds r1, r4, r1
	mov r0, sp
	ldr r2, _080269D4 @ =0x01000010
	bl sub_80D636C
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	adds r1, r4, r1
	adds r1, r1, r5
	ldr r0, [sp, #0xc]
	ldr r2, _080269D4 @ =0x01000010
	bl sub_80D636C
	ldr r2, _080269D8 @ =0x085C3B48
	ldr r0, [r2]
	add r0, sl
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	adds r4, r4, r1
	adds r4, r4, r5
	adds r1, r4, #0
	movs r2, #0x10
	bl sub_80D636C
	ldr r1, _080269D8 @ =0x085C3B48
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r6, #0
	movs r2, #0x10
	bl sub_80D636C
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r6, r0
	mov r1, sb
	lsls r0, r1, #7
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	add sl, r0
	adds r7, #1
	cmp r7, #2
	ble _08026946
	ldr r0, _080269CC @ =0x085C3B5C
	ldr r2, [sp, #8]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080269CC: .4byte 0x085C3B5C
_080269D0: .4byte 0x0203400C
_080269D4: .4byte 0x01000010
_080269D8: .4byte 0x085C3B48

