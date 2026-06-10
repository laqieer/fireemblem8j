	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_807C44C, 0x0807C44C + 1
	.set sub_8085680, 0x08085680 + 1
	.section .text.sub_801254C, "ax", %progbits
@ sub_801254C @ JP 0x0801254C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801254C
	.thumb_func
sub_801254C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl sub_8085680
	adds r6, r0, #0
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080125A0
	ldr r4, _0801259C @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	mov r2, r8
	strb r0, [r2, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x84
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1, #0x11]
	b _0801262C
	.align 2, 0
_0801259C: .4byte 0x0202BCEC
_080125A0:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801262C
	mov sb, sp
	movs r2, #1
	add r2, sp
	mov sl, r2
_080125AE:
	movs r7, #1
_080125B0:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080125F6
	ldr r0, [r4]
	cmp r0, #0
	beq _080125F6
	ldr r0, [r4, #0xc]
	ldr r1, _08012620 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080125F6
	mov r5, sp
	adds r5, #1
	adds r0, r6, #0
	mov r1, sp
	adds r2, r5, #0
	movs r3, #0
	bl sub_807C44C
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080125F6
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _08012624
_080125F6:
	adds r7, #1
	cmp r7, #0x3f
	ble _080125B0
	movs r0, #0
	cmp r0, #0
	bne _08012624
	adds r0, r6, #0
	mov r1, sp
	mov r2, sl
	movs r3, #0
	bl sub_807C44C
	mov r1, sb
	ldrb r0, [r1]
	mov r2, r8
	strb r0, [r2, #0x10]
	mov r1, sl
	ldrb r0, [r1]
	strb r0, [r2, #0x11]
	b _0801262C
	.align 2, 0
_08012620: .4byte 0x0001000C
_08012624:
	adds r6, #0x14
	ldrb r0, [r6]
	cmp r0, #0
	bne _080125AE
_0801262C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

