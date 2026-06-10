	.syntax unified
	.set AiIsInByteList, 0x0803AD38 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_801A09C, 0x0801A09C + 1
	.set sub_803B434, 0x0803B434 + 1
	.section .text.sub_803E400, "ax", %progbits
@ sub_803E400 @ JP 0x0803E400 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E400
	.thumb_func
sub_803E400:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _0803E4C4 @ =0x00002710
	str r0, [sp]
	movs r1, #0xff
	mov sb, r1
	ldr r0, _0803E4C8 @ =0x03004DF0
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E42E
	b _0803E5BC
_0803E42E:
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _0803E440
	b _0803E5BC
_0803E440:
	adds r0, r2, #0
	movs r1, #0x7c
	bl sub_801A09C
	ldr r0, _0803E4CC @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803E456
	b _0803E570
_0803E456:
	ldr r0, _0803E4CC @ =0x0202E4D0
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r4, #0
	bge _0803E468
	b _0803E568
_0803E468:
	lsls r5, r7, #2
_0803E46A:
	ldr r0, _0803E4D0 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803E560
	ldr r0, _0803E4D4 @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, _0803E4D8 @ =0x085D31C0
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E4E4
	ldr r6, _0803E4DC @ =0x0202E4D4
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E560
	ldr r0, _0803E4E0 @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E560
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	b _0803E524
	.align 2, 0
_0803E4C4: .4byte 0x00002710
_0803E4C8: .4byte 0x03004DF0
_0803E4CC: .4byte 0x0202E4D0
_0803E4D0: .4byte 0x0202E4DC
_0803E4D4: .4byte 0x0202E4D8
_0803E4D8: .4byte 0x085D31C0
_0803E4DC: .4byte 0x0202E4D4
_0803E4E0: .4byte 0x0202BE40
_0803E4E4:
	ldr r6, _0803E5B0 @ =0x0202E4D4
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E52E
	ldr r0, _0803E5B4 @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E560
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E52E
_0803E524:
	ldrb r1, [r2, #0xa]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803E560
_0803E52E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_803B434
	adds r2, r0, #0
	ldr r0, [sp]
	cmp r2, r0
	bgt _0803E560
	ldr r0, _0803E5B8 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, sb
	bgt _0803E560
	str r2, [sp]
	ldrb r1, [r1]
	mov sb, r1
	mov r1, r8
	strh r4, [r1]
	strh r7, [r1, #2]
_0803E560:
	subs r4, #1
	cmp r4, #0
	blt _0803E568
	b _0803E46A
_0803E568:
	mov r7, sl
	cmp r7, #0
	blt _0803E570
	b _0803E456
_0803E570:
	mov r2, sb
	cmp r2, #0xff
	beq _0803E5BC
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _0803E5B0 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803E5AA
	ldr r0, _0803E5B4 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803E5AA
	adds r0, r1, #0
	bl GetUnit
	adds r2, r0, #0
	ldrb r1, [r2, #0xa]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2, #0xa]
_0803E5AA:
	movs r0, #1
	b _0803E5BE
	.align 2, 0
_0803E5B0: .4byte 0x0202E4D4
_0803E5B4: .4byte 0x0202BE40
_0803E5B8: .4byte 0x0202E4DC
_0803E5BC:
	movs r0, #0
_0803E5BE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

