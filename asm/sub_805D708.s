	.syntax unified
	.set EnableEfxStatusUnits, 0x0805585C + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80564B4, 0x080564B4 + 1
	.set sub_805C28C, 0x0805C28C + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_805D800, 0x0805D800 + 1
	.set sub_805D8DC, 0x0805D8DC + 1
	.set sub_8074E80, 0x08074E80 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_805D708, "ax", %progbits
@ sub_805D708 @ JP 0x0805D708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805D708
	.thumb_func
sub_805D708:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	bne _0805D788
	adds r0, r4, #0
	movs r1, #0
	bl sub_805D800
	adds r0, r4, #0
	movs r1, #0
	bl sub_805D8DC
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x64
	bl sub_805C28C
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_805C7CC
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl sub_805C7CC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl sub_8074E80
_0805D788:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x8b
	bne _0805D7E0
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_80564B4
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D7C4
	ldr r0, _0805D7BC @ =0x02000054
	ldr r0, [r0]
	ldr r1, _0805D7C0 @ =0x02022B88
	movs r2, #8
	bl sub_80D636C
	b _0805D7D0
	.align 2, 0
_0805D7BC: .4byte 0x02000054
_0805D7C0: .4byte 0x02022B88
_0805D7C4:
	ldr r0, _0805D7D8 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _0805D7DC @ =0x02022BC8
	movs r2, #8
	bl sub_80D636C
_0805D7D0:
	adds r0, r4, #0
	bl EnableEfxStatusUnits
	b _0805D7F6
	.align 2, 0
_0805D7D8: .4byte 0x02000054
_0805D7DC: .4byte 0x02022BC8
_0805D7E0:
	cmp r0, #0xb3
	bne _0805D7F6
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl sub_8002DE4
_0805D7F6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

