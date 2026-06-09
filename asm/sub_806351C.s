	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetUnitEfxDebuff, 0x080558AC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetUnitEfxDebuff, 0x0805587C + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_80564B4, 0x080564B4 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_8063624, 0x08063624 + 1
	.set sub_8063708, 0x08063708 + 1
	.set sub_8073F60, 0x08073F60 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_806351C, "ax", %progbits
@ sub_806351C @ JP 0x0806351C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806351C
	.thumb_func
sub_806351C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08063560
	ldr r0, [r4, #0x5c]
	bl sub_8063708
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xfa
	movs r3, #1
	bl sub_8074E80
_08063560:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x29
	bne _08063574
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _08063618
_08063574:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x44
	cmp r1, r0
	bne _080635A8
	ldr r0, [r4, #0x5c]
	bl sub_8063624
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xfb
	movs r3, #1
	bl sub_8074E80
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0x42
	movs r2, #0x14
	movs r3, #0x10
	bl sub_805C7CC
	b _08063618
_080635A8:
	adds r0, r6, #0
	adds r0, #0x86
	cmp r1, r0
	bne _080635FA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r0, #0xfc
	movs r3, #1
	bl sub_8074E80
	bl sub_8073F60
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r5, #0
	bl sub_80564B4
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_8054BF8
	ldrb r0, [r6]
	cmp r0, #0
	bne _08063618
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _08063618
	adds r0, r5, #0
	movs r1, #3
	bl SetUnitEfxDebuff
	b _08063618
_080635FA:
	adds r0, r6, #0
	adds r0, #0x9e
	cmp r1, r0
	bne _08063618
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_08063618:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

