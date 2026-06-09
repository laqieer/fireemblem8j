	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetupFaceGfxData, 0x0800544C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_80B1460, 0x080B1460 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B261C, 0x080B261C + 1
	.set sub_80B269C, 0x080B269C + 1
	.section .text.sub_809DB30, "ax", %progbits
@ sub_809DB30 @ JP 0x0809DB30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809DB30
	.thumb_func
sub_809DB30:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _0809DC28 @ =0x081F561C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0809DC2C @ =0x08A93F34
	ldrh r0, [r0]
	bl sub_8001ACC
	add r0, sp, #8
	bl SetupFaceGfxData
	ldr r3, _0809DC30 @ =0x03003020
	ldrb r1, [r3, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	bl ResetText
	bl sub_80034C4
	bl sub_804F8F4
	bl sub_801569C
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
	ldr r0, _0809DC34 @ =0x06014000
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808BB14
	movs r0, #4
	bl sub_8003508
	bl sub_8097CFC
	ldr r0, _0809DC38 @ =0x02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_0809DBF6:
	adds r0, r5, #0
	movs r1, #7
	bl InitTextDb
	adds r0, r6, #0
	movs r1, #7
	bl InitTextDb
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809DBF6
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x40]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0809DC3C
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x34]
	b _0809DC56
	.align 2, 0
_0809DC28: .4byte 0x081F561C
_0809DC2C: .4byte 0x08A93F34
_0809DC30: .4byte 0x03003020
_0809DC34: .4byte 0x06014000
_0809DC38: .4byte 0x02013510
_0809DC3C:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809DC50
	movs r0, #8
	mov r2, r8
	str r0, [r2, #0x34]
	b _0809DC56
_0809DC50:
	movs r0, #0
	mov r3, r8
	str r0, [r3, #0x34]
_0809DC56:
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	bl sub_8018FCC
	adds r1, r0, #0
	movs r4, #4
	rsbs r4, r4, #0
	ldr r0, _0809DDE8 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl sub_80063F8
	mov r1, r8
	ldr r0, [r1, #0x30]
	bl sub_8018FCC
	adds r1, r0, #0
	ldr r0, _0809DDEC @ =0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl sub_80063F8
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804F0EC
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804F0EC
	movs r0, #7
	bl BG_EnableSyncByMask
	mov r2, r8
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r7, r0, #0
	bl sub_8003E0C
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _0809DDF0 @ =0x02022CA8
	mov sb, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, sb
	movs r2, #0
	bl sub_8004374
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r7, r0, #0
	bl sub_8003E0C
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, sb
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_8004374
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, sb
	ldr r4, _0809DDF4 @ =0x02013510
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809DA14
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, sb
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809DA14
	mov r0, r8
	bl sub_80B1460
	mov r0, r8
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80B1FBC
	movs r0, #0xc8
	movs r1, #0x93
	movs r2, #2
	mov r3, r8
	bl sub_808B750
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80B261C
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r4, #1
	rsbs r4, r4, #0
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_80B269C
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl sub_80B269C
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DDE8: .4byte 0x00000203
_0809DDEC: .4byte 0x00000202
_0809DDF0: .4byte 0x02022CA8
_0809DDF4: .4byte 0x02013510

