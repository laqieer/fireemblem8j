	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D63D4, 0x080D63D4 + 1
	.section .text.sub_8099CC0, "ax", %progbits
@ SallyCir_Loop @ JP 0x08099CC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SallyCir_Loop
	.thumb_func
SallyCir_Loop:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r4, #0x2c]
	adds r0, r0, r1
	str r0, [r4, #0x2c]
	cmp r0, #0x96
	ble _08099CDE
	movs r0, #0x96
	str r0, [r4, #0x2c]
_08099CDE:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bge _08099CE8
	movs r0, #0
	str r0, [r4, #0x2c]
_08099CE8:
	movs r6, #0
	movs r0, #0x29
	adds r0, r0, r4
	mov r8, r0
	ldr r7, _08099D20 @ =0x02013458
	movs r3, #0x78
	movs r5, #0
_08099CF6:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _08099D12
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	adds r1, r6, #0
	subs r1, #0x50
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	cmp r0, #0
	bge _08099D24
_08099D12:
	ldr r0, [r7, #4]
	adds r0, r5, r0
	strb r3, [r0]
	ldr r0, [r7, #4]
	adds r0, r5, r0
	strb r3, [r0, #1]
	b _08099D48
	.align 2, 0
_08099D20: .4byte 0x02013458
_08099D24:
	str r3, [sp]
	bl sub_80D63D4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [sp]
	cmp r2, #0x78
	ble _08099D36
	movs r2, #0x78
_08099D36:
	ldr r0, [r7, #4]
	adds r0, r5, r0
	subs r1, r3, r2
	strb r1, [r0]
	ldr r0, [r7, #4]
	adds r0, r5, r0
	adds r1, r2, #0
	adds r1, #0x78
	strb r1, [r0, #1]
_08099D48:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	adds r5, #4
	asrs r6, r0, #0x10
	cmp r6, #0x9f
	ble _08099CF6
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _08099D6A
	adds r0, r4, #0
	bl sub_8002DE4
_08099D6A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

