	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetUnitEfxDebuff, 0x080558AC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetUnitEfxDebuff, 0x0805587C + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_80564B4, 0x080564B4 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_80638B4, 0x080638B4 + 1
	.set sub_8063998, 0x08063998 + 1
	.set sub_80639F0, 0x080639F0 + 1
	.set sub_8063A44, 0x08063A44 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_80637B4, "ax", %progbits
@ sub_80637B4 @ JP 0x080637B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80637B4
	.thumb_func
sub_80637B4:
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
	bne _080637F8
	ldr r0, [r4, #0x5c]
	bl sub_8063998
	ldr r0, _0806384C @ =0x0000011B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
_080637F8:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x64
	bne _0806380A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_0806380A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #0
	adds r0, #0x82
	cmp r1, r0
	bne _08063850
	adds r0, r5, #0
	bl sub_80639F0
	adds r0, r5, #0
	bl sub_8063A44
	ldr r0, [r4, #0x5c]
	bl sub_80638B4
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl sub_805C7CC
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xe6
	movs r2, #0x14
	movs r3, #0x10
	bl sub_805C7CC
	b _080638A6
	.align 2, 0
_0806384C: .4byte 0x0000011B
_08063850:
	movs r3, #0xa5
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne _08063886
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
	bne _080638A6
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _080638A6
	adds r0, r5, #0
	movs r1, #2
	bl SetUnitEfxDebuff
	b _080638A6
_08063886:
	movs r2, #0xb9
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _080638A6
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_080638A6:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

