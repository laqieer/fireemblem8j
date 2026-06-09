	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80A019C, 0x080A019C + 1
	.section .text.sub_80A02F4, "ax", %progbits
@ sub_80A02F4 @ JP 0x080A02F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A02F4
	.thumb_func
sub_80A02F4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _080A0326
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_080A0326:
	adds r5, r7, #0
	adds r5, #0x35
	cmp r4, #4
	bne _080A0342
	ldrb r0, [r5]
	cmp r0, #8
	bne _080A0338
	movs r0, #0
	b _080A033A
_080A0338:
	adds r0, #1
_080A033A:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_80A019C
_080A0342:
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r8
	blt _080A0366
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	rsbs r6, r0, #0
_080A0366:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _080A0396
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
_080A0396:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

