	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_80A2E4C, 0x080A2E4C + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_80A2E64, "ax", %progbits
@ sub_80A2E64 @ JP 0x080A2E64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2E64
	.thumb_func
sub_80A2E64:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	ldr r1, [r0, #0x2c]
	asrs r0, r1, #3
	cmp r0, #5
	bgt _080A2E8C
	adds r0, r1, #2
	mov r1, sb
	str r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r0, #6
	bne _080A2E8C
	movs r0, #0xf
	bl sub_80A2E4C
_080A2E8C:
	mov r6, sb
	adds r6, #0x34
	movs r2, #0x11
	str r2, [sp, #8]
	movs r3, #4
	mov r8, r3
_080A2E98:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _080A2EEE
	movs r5, #0
	ldrb r7, [r6]
	cmp r5, r7
	bgt _080A2EEE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	bge _080A2EEE
	movs r4, #0x50
	ldr r2, _080A2F8C @ =0x08A95478
	mov sl, r2
_080A2EB6:
	lsls r1, r5, #9
	adds r1, r4, r1
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldr r3, [r3]
	mov ip, r3
	ldr r0, _080A2F90 @ =0x0000F380
	str r0, [sp]
	movs r0, #4
	ldr r7, [sp, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r7, r3
	mov r3, ip
	bl PutSpriteExt
	adds r4, #0xf
	adds r5, #1
	ldrb r7, [r6]
	cmp r5, r7
	bgt _080A2EEE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	blt _080A2EB6
_080A2EEE:
	adds r6, #1
	ldr r2, [sp, #8]
	adds r2, #0x10
	str r2, [sp, #8]
	movs r3, #1
	rsbs r3, r3, #0
	add r8, r3
	mov r7, r8
	cmp r7, #0
	bge _080A2E98
	movs r0, #0
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r1, _080A2F94 @ =0x080DC15C
	mov sl, r1
_080A2F0E:
	mov r2, r8
	adds r2, #1
	lsls r1, r2, #3
	mov r3, sb
	ldr r0, [r3, #0x2c]
	subs r0, r0, r1
	lsls r4, r0, #5
	str r2, [sp, #4]
	cmp r4, r7
	ble _080A2F26
	movs r4, #0x80
	lsls r4, r4, #1
_080A2F26:
	cmp r4, #0x20
	ble _080A2F9C
	ldr r1, _080A2F98 @ =0x080DC1DC
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r3, sl
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080A2F98 @ =0x080DC1DC
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	b _080A2FFA
	.align 2, 0
_080A2F8C: .4byte 0x08A95478
_080A2F90: .4byte 0x0000F380
_080A2F94: .4byte 0x080DC15C
_080A2F98: .4byte 0x080DC1DC
_080A2F9C:
	ldr r3, _080A3014 @ =0x080DC1DC
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r1, #0x20
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x20
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _080A3014 @ =0x080DC1DC
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
_080A2FFA:
	ldr r2, [sp, #4]
	mov r8, r2
	cmp r2, #4
	ble _080A2F0E
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3014: .4byte 0x080DC1DC

