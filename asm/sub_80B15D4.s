	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80B15D4, "ax", %progbits
@ sub_80B15D4 @ JP 0x080B15D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B15D4
	.thumb_func
sub_80B15D4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x34]
	ldr r0, [r5, #0x3c]
	mov r8, r0
	ldr r1, [r5, #0x38]
	mov sb, r1
	ldr r2, [r5, #0x40]
	mov sl, r2
	ldr r0, [r5, #0x44]
	adds r0, #1
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	movs r6, #0
_080B15FE:
	lsls r3, r6, #2
	adds r0, r5, #0
	adds r0, #0x4c
	adds r2, r0, r3
	ldr r0, [r2]
	adds r4, r5, #0
	adds r4, #0x44
	cmp r0, #0
	beq _080B161E
	adds r0, r4, r3
	ldr r1, [r0]
	adds r1, #3
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
_080B161E:
	adds r1, r4, r3
	ldr r0, [r1]
	asrs r0, r0, #3
	cmp r0, #5
	ble _080B162C
	movs r0, #0
	str r0, [r1]
_080B162C:
	adds r6, #1
	cmp r6, #1
	ble _080B15FE
	ldr r3, [r5, #0x2c]
	cmp r3, #0
	bne _080B16C0
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080B164C
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x34]
	adds r7, r0, r1
	cmp r2, #4
	bne _080B164C
	str r3, [r5, #0x4c]
_080B164C:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080B1664
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x38]
	subs r0, r0, r1
	mov sb, r0
	cmp r2, #4
	bne _080B1664
	movs r0, #0
	str r0, [r5, #0x50]
_080B1664:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B168E
	ldr r1, _080B1774 @ =0x000001FF
	ands r1, r7
	movs r2, #0xff
	mov r0, r8
	ands r2, r0
	ldr r3, _080B1778 @ =0x08A9DAE4
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080B168E:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080B16C0
	ldr r1, _080B1774 @ =0x000001FF
	mov r2, sb
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r2, #0xff
	mov r0, sl
	ands r2, r0
	ldr r3, _080B1778 @ =0x08A9DAE4
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080B16C0:
	ldr r0, [r5, #0x2c]
	cmp r0, #1
	bne _080B1762
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080B16DE
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	mov r8, r0
	cmp r2, #4
	bne _080B16DE
	movs r0, #0
	str r0, [r5, #0x4c]
_080B16DE:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080B16F6
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	mov sl, r0
	cmp r2, #4
	bne _080B16F6
	movs r0, #0
	str r0, [r5, #0x50]
_080B16F6:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B1728
	ldr r0, _080B1774 @ =0x000001FF
	ands r7, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r3, _080B177C @ =0x08A9DAF2
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r7, #0
	mov r2, r8
	bl PutSpriteExt
_080B1728:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080B1762
	ldr r0, _080B1774 @ =0x000001FF
	mov r2, sb
	ands r2, r0
	mov sb, r2
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, sb
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	mov sl, r2
	ldr r3, _080B177C @ =0x08A9DAF2
	adds r2, r5, #0
	adds r2, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r2, [r2]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0xd
	mov r2, sl
	bl PutSpriteExt
_080B1762:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1774: .4byte 0x000001FF
_080B1778: .4byte 0x08A9DAE4
_080B177C: .4byte 0x08A9DAF2

