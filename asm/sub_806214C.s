	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80536FC, 0x080536FC + 1
	.set sub_805B094, 0x0805B094 + 1
	.set sub_8062694, 0x08062694 + 1
	.set sub_8062750, 0x08062750 + 1
	.set sub_8062874, 0x08062874 + 1
	.set sub_80628E4, 0x080628E4 + 1
	.set sub_806299C, 0x0806299C + 1
	.set sub_8062A6C, 0x08062A6C + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_806214C, "ax", %progbits
@ sub_806214C @ JP 0x0806214C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806214C
	.thumb_func
sub_806214C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806217E
	ldr r0, [r4, #0x5c]
	bl sub_8062A6C
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0806220A
_0806217E:
	cmp r0, #0x34
	bne _080621C6
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8062694
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8062874
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806299C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_806299C
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0806220A
_080621C6:
	cmp r0, #0x37
	bne _080621D4
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0806224C
_080621D4:
	cmp r0, #0x71
	bne _08062218
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8062750
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_80628E4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806299C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_806299C
	ldr r0, _08062214 @ =0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0806220A:
	movs r3, #1
	bl sub_8074E80
	b _0806224C
	.align 2, 0
_08062214: .4byte 0x0000010F
_08062218:
	cmp r0, #0xa6
	bne _08062224
	adds r0, r5, #0
	bl sub_80536FC
	b _0806224C
_08062224:
	cmp r0, #0xb5
	bne _0806224C
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl sub_805B094
	lsls r0, r0, #0x10
	ldr r1, _08062254 @ =0xFFFF0000
	cmp r0, r1
	beq _08062246
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
_08062246:
	adds r0, r4, #0
	bl sub_8002DE4
_0806224C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062254: .4byte 0xFFFF0000

