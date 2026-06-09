	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetUnitEfxDebuff, 0x080558AC + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetUnitEfxDebuff, 0x0805587C + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_80564B4, 0x080564B4 + 1
	.set sub_805C1A4, 0x0805C1A4 + 1
	.set sub_8063E30, 0x08063E30 + 1
	.set sub_8063FAC, 0x08063FAC + 1
	.set sub_806404C, 0x0806404C + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8063D50, "ax", %progbits
@ sub_8063D50 @ JP 0x08063D50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063D50
	.thumb_func
sub_8063D50:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063D7E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_08063D7E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08063DCC
	adds r0, r5, #0
	bl sub_806404C
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_8063E30
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_8063FAC
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_805C1A4
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0
	bl NewEfxRestWINH_
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xf9
	adds r1, r4, #0
	movs r3, #1
	bl sub_8074E80
	b _08063E26
_08063DCC:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne _08063E08
	adds r0, r5, #0
	movs r1, #5
	bl sub_8054BF8
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_80564B4
	ldrb r0, [r4]
	cmp r0, #0
	bne _08063E26
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _08063E26
	adds r0, r5, #0
	movs r1, #4
	bl SetUnitEfxDebuff
	b _08063E26
_08063E08:
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne _08063E26
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_08063E26:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

