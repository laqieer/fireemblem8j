	.syntax unified
	.set SetNextGameActionId, 0x08009EB0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80CB2A0, "ax", %progbits
@ sub_80CB2A0 @ JP 0x080CB2A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB2A0
	.thumb_func
sub_80CB2A0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r2, r0, #1
	str r2, [r4, #0x2c]
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	ldr r3, _080CB2E8 @ =0x0000FFFF
	adds r1, r3, #0
	ands r0, r1
	movs r1, #0x3f
	ands r0, r1
	strh r0, [r4, #0x2a]
	ldr r0, _080CB2EC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080CB2F4
	ldr r0, _080CB2F0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CB2DA
	movs r0, #0x6d
	bl m4aSongNumStart
_080CB2DA:
	movs r0, #0
	bl SetNextGameActionId
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CB306
	.align 2, 0
_080CB2E8: .4byte 0x0000FFFF
_080CB2EC: .4byte 0x085775CC
_080CB2F0: .4byte 0x0202BCEC
_080CB2F4:
	ldr r0, _080CB30C @ =0x0000032F
	cmp r2, r0
	bne _080CB306
	movs r0, #1
	bl SetNextGameActionId
	adds r0, r4, #0
	bl sub_8002DE4
_080CB306:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB30C: .4byte 0x0000032F

