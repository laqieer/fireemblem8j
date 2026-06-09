	.syntax unified
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806299C, 0x0806299C + 1
	.set sub_8062ACC, 0x08062ACC + 1
	.set sub_8062E28, 0x08062E28 + 1
	.set sub_8062EF8, 0x08062EF8 + 1
	.set sub_8062F8C, 0x08062F8C + 1
	.set sub_8063158, 0x08063158 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8062D78, "ax", %progbits
@ sub_8062D78 @ JP 0x08062D78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062D78
	.thumb_func
sub_8062D78:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne _08062DA6
	ldr r0, [r4, #0x5c]
	bl sub_8062ACC
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
	b _08062E1E
_08062DA6:
	cmp r1, #0x34
	bne _08062DBE
	ldr r0, [r4, #0x5c]
	bl sub_8062E28
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_8062EF8
	b _08062E1E
_08062DBE:
	cmp r1, #0xb7
	bne _08062E0A
	movs r0, #0x8a
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
	ldr r0, [r4, #0x5c]
	bl sub_8062F8C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_8063158
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0x14
	movs r3, #0
	bl sub_806299C
	ldr r0, [r4, #0x5c]
	movs r1, #0xb4
	movs r2, #0x28
	movs r3, #1
	bl sub_806299C
	b _08062E1E
_08062E0A:
	ldr r0, _08062E24 @ =0x000001C5
	cmp r1, r0
	bne _08062E1E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_08062E1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062E24: .4byte 0x000001C5

