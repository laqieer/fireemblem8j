	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CB054, "ax", %progbits
@ sub_80CB054 @ JP 0x080CB054 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB054
	.thumb_func
sub_80CB054:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _080CB104 @ =0x08B3EE2C
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080CB0F6
	ldr r3, _080CB108 @ =0x08B3EE00
	mov r8, r3
	movs r7, #0x18
_080CB06E:
	ldrb r0, [r5, #4]
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #2
	ldrsh r0, [r5, r3]
	muls r2, r0, r2
	asrs r2, r2, #8
	str r7, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl sub_8012E84
	adds r4, r0, #0
	adds r4, #0x74
	ldrb r0, [r5, #4]
	lsls r0, r0, #1
	adds r0, #1
	add r0, r8
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #2
	ldrsh r0, [r5, r3]
	muls r2, r0, r2
	asrs r2, r2, #8
	str r7, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl sub_8012E84
	adds r2, r0, #0
	adds r2, #0x38
	ldr r0, _080CB10C @ =0x000001FF
	ands r4, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	ldrb r0, [r5, #5]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	ldr r3, _080CB110 @ =0x085B8CDC
	bl PutSpriteExt
	adds r5, #8
	movs r3, #0
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bne _080CB06E
_080CB0F6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CB104: .4byte 0x08B3EE2C
_080CB108: .4byte 0x08B3EE00
_080CB10C: .4byte 0x000001FF
_080CB110: .4byte 0x085B8CDC

