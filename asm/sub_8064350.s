	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_80554C4, 0x080554C4 + 1
	.set sub_80564B4, 0x080564B4 + 1
	.set sub_806441C, 0x0806441C + 1
	.set sub_80644D0, 0x080644D0 + 1
	.set sub_8064528, 0x08064528 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8064350, "ax", %progbits
@ sub_8064350 @ JP 0x08064350 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064350
	.thumb_func
sub_8064350:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806437C
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_0806437C:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _080643AC
	ldr r0, [r5, #0x5c]
	bl sub_806441C
	adds r0, r4, #0
	bl sub_80644D0
	adds r0, r4, #0
	bl sub_8064528
	movs r0, #0x81
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl sub_8074E80
	b _08064416
_080643AC:
	adds r0, r6, #0
	adds r0, #0x28
	cmp r1, r0
	beq _080643BC
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	bne _080643C4
_080643BC:
	adds r0, r4, #0
	bl sub_8064528
	b _08064416
_080643C4:
	adds r0, r6, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _080643DA
	adds r0, r4, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl sub_80554C4
	b _08064416
_080643DA:
	adds r0, r6, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _080643F8
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_80564B4
	b _08064416
_080643F8:
	adds r0, r6, #0
	adds r0, #0xe6
	cmp r1, r0
	bne _08064416
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl sub_8002DE4
_08064416:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

