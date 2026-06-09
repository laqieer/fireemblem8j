	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set CheckFlag, 0x080860D0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003520, 0x08003520 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_808F2C0, "ax", %progbits
@ sub_808F2C0 @ JP 0x0808F2C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F2C0
	.thumb_func
sub_808F2C0:
	push {r4, lr}
	sub sp, #4
	ldr r2, _0808F3A4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r0, _0808F3A8 @ =0x08A92514
	ldr r1, _0808F3AC @ =0x06002000
	bl sub_8013008
	ldr r0, _0808F3B0 @ =0x08A92AB8
	ldr r1, _0808F3B4 @ =0x06015C00
	bl sub_8013008
	ldr r0, _0808F3B8 @ =0x06002EA0
	ldr r1, _0808F3BC @ =0x06015D40
	movs r2, #8
	bl sub_80D636C
	ldr r0, _0808F3C0 @ =0x020228A8
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #1
	movs r1, #2
	bl sub_8003520
	bl ResetTextFont
	ldr r4, _0808F3C4 @ =0x0202BCEC
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808F38E
	ldr r0, _0808F3C8 @ =0x08A73964
	movs r1, #3
	bl sub_8002BCC
_0808F38E:
	ldr r0, _0808F3CC @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808F3D4
	ldr r0, _0808F3D0 @ =0x08A73AFC
	movs r1, #3
	bl sub_8002BCC
	b _0808F3F4
	.align 2, 0
_0808F3A4: .4byte 0x03003020
_0808F3A8: .4byte 0x08A92514
_0808F3AC: .4byte 0x06002000
_0808F3B0: .4byte 0x08A92AB8
_0808F3B4: .4byte 0x06015C00
_0808F3B8: .4byte 0x06002EA0
_0808F3BC: .4byte 0x06015D40
_0808F3C0: .4byte 0x020228A8
_0808F3C4: .4byte 0x0202BCEC
_0808F3C8: .4byte 0x08A73964
_0808F3CC: .4byte 0x0202BCAC
_0808F3D0: .4byte 0x08A73AFC
_0808F3D4:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0808F3F4
	movs r0, #0x66
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808F3F4
	ldr r0, _0808F428 @ =0x08A73A9C
	movs r1, #3
	bl sub_8002BCC
_0808F3F4:
	ldr r0, _0808F42C @ =0x0202BCEC
	adds r4, r0, #0
	adds r4, #0x40
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne _0808F40C
	ldr r0, _0808F430 @ =0x08A739C4
	movs r1, #3
	bl sub_8002BCC
_0808F40C:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _0808F41E
	ldr r0, _0808F434 @ =0x08A73A4C
	movs r1, #3
	bl sub_8002BCC
_0808F41E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F428: .4byte 0x08A73A9C
_0808F42C: .4byte 0x0202BCEC
_0808F430: .4byte 0x08A739C4
_0808F434: .4byte 0x08A73A4C

