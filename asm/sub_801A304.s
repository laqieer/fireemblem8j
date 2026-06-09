	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set RevertMovementScript, 0x0801A4D0 + 1
	.section .text.sub_801A304, "ax", %progbits
@ sub_801A304 @ JP 0x0801A304 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801A304
	.thumb_func
sub_801A304:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	mov sl, r1
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0
	mov sb, r0
	ldr r1, _0801A354 @ =0x03004940
	ldr r0, [r1]
	mov r3, sl
	lsls r2, r3, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0801A336
	b _0801A4B4
_0801A336:
	mov r5, sp
	mov r7, sp
	adds r7, #4
	str r7, [sp, #0x10]
	mov r8, r2
_0801A340:
	ldr r0, _0801A358 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	cmp r6, r0
	bne _0801A35C
	ldrb r0, [r5]
	movs r3, #0xff
	orrs r0, r3
	b _0801A366
	.align 2, 0
_0801A354: .4byte 0x03004940
_0801A358: .4byte 0x0202E4D0
_0801A35C:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	ldrb r0, [r0, #1]
_0801A366:
	strb r0, [r5]
	cmp r6, #0
	bne _0801A374
	ldrb r0, [r5, #1]
	movs r7, #0xff
	orrs r0, r7
	b _0801A380
_0801A374:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r6, r0
	subs r0, #1
	ldrb r0, [r0]
_0801A380:
	strb r0, [r5, #1]
	ldr r2, _0801A398 @ =0x0202E4D0
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	cmp sl, r0
	bne _0801A39C
	ldrb r0, [r5, #3]
	movs r7, #0xff
	orrs r0, r7
	b _0801A3A6
	.align 2, 0
_0801A398: .4byte 0x0202E4D0
_0801A39C:
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0, #4]
	adds r0, r0, r6
	ldrb r0, [r0]
_0801A3A6:
	strb r0, [r5, #3]
	mov r0, sl
	cmp r0, #0
	bne _0801A3B6
	ldrb r0, [r5, #2]
	movs r1, #0xff
	orrs r0, r1
	b _0801A3C2
_0801A3B6:
	ldr r0, [r1]
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
_0801A3C2:
	strb r0, [r5, #2]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #0x18]
	movs r4, #0
	movs r2, #0
	ldr r3, [sp, #8]
	adds r3, #1
	str r3, [sp, #0x14]
_0801A3D4:
	mov r7, sp
	adds r0, r7, r2
	ldrb r0, [r0]
	ldr r1, [sp, #0x18]
	cmp r1, r0
	ble _0801A3E2
	str r0, [sp, #0x18]
_0801A3E2:
	adds r2, #1
	cmp r2, #3
	ble _0801A3D4
	movs r2, #0
	mov r0, sp
	adds r0, #3
	adds r3, r0, r4
	lsls r1, r4, #0x10
	movs r7, #0x80
	lsls r7, r7, #9
	adds r1, r1, r7
	adds r0, r7, #0
	mov ip, r0
_0801A3FC:
	mov r7, sp
	adds r0, r7, r2
	ldr r7, [sp, #0x18]
	ldrb r0, [r0]
	cmp r7, r0
	bne _0801A412
	adds r0, r1, #0
	adds r3, #1
	add r1, ip
	asrs r4, r0, #0x10
	strb r2, [r3]
_0801A412:
	adds r2, #1
	cmp r2, #3
	ble _0801A3FC
	cmp r4, #2
	beq _0801A434
	cmp r4, #2
	bgt _0801A426
	cmp r4, #1
	beq _0801A430
	b _0801A45A
_0801A426:
	cmp r4, #3
	beq _0801A440
	cmp r4, #4
	beq _0801A44C
	b _0801A45A
_0801A430:
	ldr r0, [sp, #0x10]
	b _0801A456
_0801A434:
	movs r0, #2
	bl NextRN_N
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	b _0801A456
_0801A440:
	movs r0, #3
	bl NextRN_N
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	b _0801A456
_0801A44C:
	movs r0, #4
	bl NextRN_N
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
_0801A456:
	ldrb r0, [r0]
	mov sb, r0
_0801A45A:
	mov r0, sb
	ldr r7, [sp, #8]
	strb r0, [r7]
	ldr r1, [sp, #0x14]
	str r1, [sp, #8]
	mov r2, sb
	cmp r2, #1
	beq _0801A484
	cmp r2, #1
	bgt _0801A474
	cmp r2, #0
	beq _0801A480
	b _0801A49E
_0801A474:
	mov r3, sb
	cmp r3, #2
	beq _0801A492
	cmp r3, #3
	beq _0801A488
	b _0801A49E
_0801A480:
	adds r6, #1
	b _0801A49E
_0801A484:
	subs r6, #1
	b _0801A49E
_0801A488:
	movs r7, #4
	add r8, r7
	movs r0, #1
	add sl, r0
	b _0801A49E
_0801A492:
	movs r1, #4
	rsbs r1, r1, #0
	add r8, r1
	movs r2, #1
	rsbs r2, r2, #0
	add sl, r2
_0801A49E:
	ldr r1, _0801A4CC @ =0x03004940
	ldr r0, [r1]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801A4B4
	b _0801A340
_0801A4B4:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl RevertMovementScript
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A4CC: .4byte 0x03004940

