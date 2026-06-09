	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_807C44C, 0x0807C44C + 1
	.set sub_8085680, 0x08085680 + 1
	.section .text.sub_8012430, "ax", %progbits
@ sub_8012430 @ JP 0x08012430 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012430
	.thumb_func
sub_8012430:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	bl sub_8085680
	adds r5, r0, #0
	movs r6, #1
	ldr r0, _08012468 @ =0x0202BCEC
	mov r8, r0
	mov r7, sp
	adds r7, #1
_08012448:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080124C8
	ldr r2, [r4]
	cmp r2, #0
	beq _080124C8
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801246C
	movs r0, #0xff
	strb r0, [r4, #0x10]
	b _080124C8
	.align 2, 0
_08012468: .4byte 0x0202BCEC
_0801246C:
	ldr r0, [r4, #0xc]
	ldr r1, _080124AC @ =0x0201000C
	ands r0, r1
	cmp r0, #0
	bne _080124C8
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080124B0
	mov r1, r8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	mov r1, r8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetROMChapterStruct
	adds r0, #0x84
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	b _080124C8
	.align 2, 0
_080124AC: .4byte 0x0201000C
_080124B0:
	adds r0, r5, #0
	mov r1, sp
	adds r2, r7, #0
	movs r3, #0
	bl sub_807C44C
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	ldrb r0, [r7]
	strb r0, [r4, #0x11]
	adds r5, #0x14
_080124C8:
	adds r6, #1
	cmp r6, #0x3f
	ble _08012448
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

