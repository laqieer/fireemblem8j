	.syntax unified
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80B7FEC, 0x080B7FEC + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_80B8088, "ax", %progbits
@ ClassIntroBurst_Loop @ JP 0x080B8088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClassIntroBurst_Loop
	.thumb_func
ClassIntroBurst_Loop:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0x64
	add r0, sl
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x46
	bgt _080B8124
	movs r1, #0x90
	lsls r1, r1, #1
	mov r2, sb
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r0, #0x46
	str r0, [sp]
	movs r0, #4
	movs r2, #0x10
	bl sub_8012E84
	adds r7, r0, #0
	ldr r4, _080B8288 @ =0x080DC15C
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0xb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080B8124:
	mov r0, sl
	movs r1, #0xb
	movs r2, #0xd7
	movs r3, #0x11
	bl sub_80B7FEC
	movs r2, #0x66
	add r2, sl
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	bgt _080B81BA
	movs r1, #0x90
	lsls r1, r1, #1
	adds r3, r0, #0
	movs r0, #0x46
	str r0, [sp]
	movs r0, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r7, r0, #0
	ldr r4, _080B8288 @ =0x080DC15C
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080B81BA:
	mov r0, sl
	movs r1, #0xc
	movs r2, #0xc0
	movs r3, #0x20
	bl sub_80B7FEC
	movs r2, #0x68
	add r2, sl
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	bgt _080B8250
	movs r1, #0x90
	lsls r1, r1, #1
	adds r3, r0, #0
	movs r0, #0x46
	str r0, [sp]
	movs r0, #1
	movs r2, #0x10
	bl sub_8012E84
	adds r7, r0, #0
	ldr r4, _080B8288 @ =0x080DC15C
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080B8250:
	mov r0, sl
	movs r1, #0xd
	movs r2, #0xa9
	movs r3, #0x2f
	bl sub_80B7FEC
	mov r0, sl
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	ble _080B8276
	mov r0, sl
	bl sub_8002DE4
_080B8276:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8288: .4byte 0x080DC15C

