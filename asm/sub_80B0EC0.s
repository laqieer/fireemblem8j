	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set _DivArm2, 0x0800BB3C + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80B0EC0, "ax", %progbits
@ sub_80B0EC0 @ JP 0x080B0EC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0EC0
	.thumb_func
sub_80B0EC0:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B0EFA
	ldrh r0, [r6, #0x34]
	ldrh r2, [r6, #0x30]
	subs r0, r0, r2
	movs r3, #0
	strh r0, [r6, #0x38]
	ldrh r0, [r6, #0x36]
	ldrh r1, [r6, #0x32]
	subs r0, r0, r1
	strh r0, [r6, #0x3a]
	strh r2, [r6, #0x2c]
	strh r1, [r6, #0x2e]
	strh r3, [r6, #0x3c]
	ldrb r1, [r4]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
_080B0EFA:
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B0F60
	ldrh r0, [r6, #0x3c]
	adds r0, #1
	strh r0, [r6, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bgt _080B0F4E
	movs r1, #0x3c
	ldrsh r0, [r6, r1]
	movs r1, #4
	movs r2, #0
	bl _DivArm2
	adds r4, r0, #0
	movs r5, #0x80
	lsls r5, r5, #5
	movs r3, #0x38
	ldrsh r0, [r6, r3]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r5, #0
	bl sub_80D6378
	ldrh r1, [r6, #0x30]
	adds r1, r1, r0
	strh r1, [r6, #0x2c]
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r5, #0
	bl sub_80D6378
	ldrh r1, [r6, #0x32]
	adds r1, r1, r0
	strh r1, [r6, #0x2e]
	b _080B0F60
_080B0F4E:
	ldrh r0, [r6, #0x34]
	strh r0, [r6, #0x2c]
	ldrh r0, [r6, #0x36]
	strh r0, [r6, #0x2e]
	ldrb r1, [r4]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
_080B0F60:
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	ldr r3, _080B0F98 @ =0x08A9DA7C
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsrs r0, r0, #3
	movs r2, #7
	ands r0, r2
	adds r0, r0, r3
	movs r3, #0x2e
	ldrsh r2, [r6, r3]
	ldrb r0, [r0]
	adds r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080B0F9C @ =0x08A9DA00
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0F98: .4byte 0x08A9DA7C
_080B0F9C: .4byte 0x08A9DA00

