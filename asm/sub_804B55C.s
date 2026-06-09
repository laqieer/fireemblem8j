	.syntax unified
	.set DisableMuCamera, 0x0807A910 + 1
	.set GetUnit, 0x08019108 + 1
	.set LinkArenaBattleMap_FindUnitSlot, 0x0804A1A4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804A0D4, 0x0804A0D4 + 1
	.set sub_804CFA8, 0x0804CFA8 + 1
	.set sub_807A888, 0x0807A888 + 1
	.section .text.sub_804B55C, "ax", %progbits
@ sub_804B55C @ JP 0x0804B55C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B55C
	.thumb_func
sub_804B55C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r1, _0804B5CC @ =0x03001810
	ldr r0, _0804B5D0 @ =0x0203DD8C
	mov sl, r0
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	mov r2, sl
	ldrb r0, [r2, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov sb, r0
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	mov r0, sb
	bl GetUnit
	mov r8, r0
	movs r7, #0
	adds r0, r5, #0
	bl LinkArenaBattleMap_FindUnitSlot
	str r0, [sp, #0x10]
	mov r0, sb
	bl LinkArenaBattleMap_FindUnitSlot
	str r0, [sp, #0x14]
	ldr r6, _0804B5D4 @ =0x03001830
	str r7, [r6, #4]
	str r7, [r6]
	ldr r0, [r4, #0xc]
	ldr r1, _0804B5D8 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804B5BA
	ldr r0, [r4]
	cmp r0, #0
	bne _0804B5DC
_0804B5BA:
	lsrs r0, r5, #6
	mov r1, sl
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	b _0804B614
	.align 2, 0
_0804B5CC: .4byte 0x03001810
_0804B5D0: .4byte 0x0203DD8C
_0804B5D4: .4byte 0x03001830
_0804B5D8: .4byte 0x00010004
_0804B5DC:
	adds r0, r4, #0
	bl sub_807A888
	str r0, [r6]
	bl DisableMuCamera
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	movs r7, #1
	ldr r1, [r6]
	ldr r2, _0804B63C @ =0x080DEF24
	ldr r3, [sp, #0x10]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r5, #0
	ldrsh r2, [r0, r5]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r4, #0
	bl sub_804CFA8
_0804B614:
	mov r1, r8
	ldr r0, [r1, #0xc]
	ldr r1, _0804B640 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804B628
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	bne _0804B648
_0804B628:
	ldr r0, _0804B644 @ =0x0203DD8C
	mov r3, sb
	lsrs r1, r3, #6
	adds r0, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b _0804B692
	.align 2, 0
_0804B63C: .4byte 0x080DEF24
_0804B640: .4byte 0x00010004
_0804B644: .4byte 0x0203DD8C
_0804B648:
	mov r0, r8
	bl sub_807A888
	ldr r1, _0804B668 @ =0x03001830
	str r0, [r1, #4]
	bl DisableMuCamera
	mov r4, r8
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	cmp r7, #0
	bne _0804B66C
	movs r7, #1
	b _0804B66E
	.align 2, 0
_0804B668: .4byte 0x03001830
_0804B66C:
	movs r7, #0
_0804B66E:
	ldr r0, _0804B6AC @ =0x03001830
	ldr r1, [r0, #4]
	ldr r2, _0804B6B0 @ =0x080DEF24
	ldr r5, [sp, #0x14]
	lsls r0, r5, #2
	adds r0, r0, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r4, #2
	ldrsh r3, [r0, r4]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r5, [sp, #0xc]
	str r5, [sp, #8]
	mov r0, r8
	bl sub_804CFA8
_0804B692:
	bl sub_804A0D4
	ldr r0, [sp, #0xc]
	bl sub_8002DE4
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B6AC: .4byte 0x03001830
_0804B6B0: .4byte 0x080DEF24

