	.syntax unified
	.set GmIsNodeInList, 0x080C18D0 + 1
	.section .text.sub_80C19D4, "ax", %progbits
@ sub_80C19D4 @ JP 0x080C19D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C19D4
	.thumb_func
sub_80C19D4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r5, r0, #0
	mov sb, r1
	ldr r0, [sp, #0x3c]
	ldr r6, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov sl, r1
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov r8, r3
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	ldr r0, [r5, #0x20]
	cmp r6, r0
	blt _080C1A04
	b _080C1B0E
_080C1A04:
	lsls r0, r3, #3
	add r0, sb
	str r0, [sp, #0x14]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x10]
	cmp r1, r0
	blt _080C1A1C
	b _080C1B0E
_080C1A1C:
	adds r0, r6, #1
	str r0, [sp, #0x18]
	ldr r4, [sp, #0x14]
	adds r4, #1
_080C1A24:
	ldrb r3, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	beq _080C1AFA
	movs r2, #0
	cmp r0, r7
	bne _080C1A38
	movs r2, #1
_080C1A38:
	adds r1, r5, #0
	adds r1, #0x10
	adds r0, r1, r6
	strb r3, [r0]
	adds r3, r1, #0
	mov r0, sl
	cmp r0, #0
	blt _080C1A8C
	cmp r2, #0
	beq _080C1A80
	movs r2, #0
	ldr r0, [r5, #0x24]
	cmp sl, r0
	bge _080C1A5A
	mov r1, sl
	str r1, [r5, #0x24]
	b _080C1A6A
_080C1A5A:
	cmp sl, r0
	bne _080C1A66
	ldr r0, [r5, #0x20]
	cmp r6, r0
	bge _080C1A66
	movs r2, #1
_080C1A66:
	cmp r2, #0
	beq _080C1ADE
_080C1A6A:
	movs r2, #1
	cmp r2, r6
	bgt _080C1ADC
_080C1A70:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r6
	ble _080C1A70
	b _080C1ADC
_080C1A80:
	movs r3, #0
	ldrsb r3, [r4, r3]
	str r7, [sp]
	ldr r0, [sp, #0x18]
	str r0, [sp, #4]
	b _080C1AAA
_080C1A8C:
	cmp r2, #0
	bne _080C1AC0
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldr r0, _080C1ABC @ =0x0201B100
	bl GmIsNodeInList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1AE2
	movs r3, #0
	ldrsb r3, [r4, r3]
	str r7, [sp]
	ldr r1, [sp, #0x18]
	str r1, [sp, #4]
_080C1AAA:
	mov r0, sl
	adds r0, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	mov r1, sb
	mov r2, r8
	bl sub_80C19D4
	b _080C1AFA
	.align 2, 0
_080C1ABC: .4byte 0x0201B100
_080C1AC0:
	ldr r0, [r5, #0x20]
	cmp r6, r0
	bge _080C1ADE
	movs r2, #1
	cmp r2, r6
	bgt _080C1ADC
	adds r3, r1, #0
_080C1ACE:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r6
	ble _080C1ACE
_080C1ADC:
	str r6, [r5, #0x20]
_080C1ADE:
	movs r0, #1
	b _080C1B10
_080C1AE2:
	movs r3, #0
	ldrsb r3, [r4, r3]
	str r7, [sp]
	ldr r0, [sp, #0x18]
	str r0, [sp, #4]
	mov r1, sl
	str r1, [sp, #8]
	adds r0, r5, #0
	mov r1, sb
	mov r2, r8
	bl sub_80C19D4
_080C1AFA:
	adds r4, #1
	ldr r0, [sp, #0x10]
	adds r0, #1
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x10]
	cmp r1, r0
	blt _080C1A24
_080C1B0E:
	movs r0, #0
_080C1B10:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

