	.syntax unified
	.set PutNumberBonus, 0x08004AF8 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8088DE8, 0x08088DE8 + 1
	.section .text.sub_8089354, "ax", %progbits
@ sub_8089354 @ JP 0x08089354 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089354
	.thumb_func
sub_8089354:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov r8, r1
	str r2, [sp, #0xc]
	adds r7, r3, #0
	ldr r5, [sp, #0x30]
	subs r0, r5, r7
	mov sb, r0
	lsls r6, r2, #5
	adds r0, r6, r1
	lsls r0, r0, #1
	ldr r4, _08089410 @ =0x02003D2C
	adds r0, r0, r4
	movs r1, #2
	ldr r2, [sp, #0x34]
	cmp r7, r2
	bne _08089382
	movs r1, #4
_08089382:
	adds r2, r7, #0
	bl PutNumberOrBlank
	adds r1, r6, #1
	add r1, r8
	lsls r1, r1, #1
	adds r1, r1, r4
	mov r0, sb
	bl PutNumberBonus
	cmp r5, #0x1e
	ble _080893A0
	movs r5, #0x1e
	subs r5, r5, r7
	mov sb, r5
_080893A0:
	mov r0, sl
	lsls r5, r0, #1
	add r5, sl
	lsls r5, r5, #1
	ldr r1, _08089414 @ =0x00000401
	adds r5, r5, r1
	ldr r4, [sp, #0xc]
	adds r4, #1
	lsls r4, r4, #5
	subs r4, #2
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _08089418 @ =0x0200472C
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	ldr r2, [sp, #0x34]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r2
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp]
	lsls r0, r7, #2
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r7
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #4]
	mov r1, sb
	lsls r0, r1, #2
	add r0, sb
	lsls r0, r0, #3
	add r0, sb
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	adds r3, r6, #0
	bl sub_8088DE8
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089410: .4byte 0x02003D2C
_08089414: .4byte 0x00000401
_08089418: .4byte 0x0200472C

