	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set PrepItemTrade_ApplyItemSwap, 0x0809D800 + 1
	.set PrepItemTrade_DpadKeyHandler, 0x0809D82C + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set StartPrepErrorHelpbox, 0x0809A080 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_809A178, 0x0809A178 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809DDF8, "ax", %progbits
@ sub_809DDF8 @ JP 0x0809DDF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809DDF8
	.thumb_func
sub_809DDF8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _0809DE24
	ldr r0, _0809DE20 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809DE18
	b _0809E07C
_0809DE18:
	bl sub_808B2A4
	movs r0, #0xff
	b _0809E0DC
	.align 2, 0
_0809DE20: .4byte 0x085775CC
_0809DE24:
	ldr r0, _0809DE60 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809DE64
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _0809DE54
	b _0809E0DE
_0809DE54:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _0809E0D4
	.align 2, 0
_0809DE60: .4byte 0x085775CC
_0809DE64:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _0809DE6C
	b _0809DFC4
_0809DE6C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809DE76
	b _0809DF7C
_0809DE76:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl sub_809A178
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809DEB8
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _0809DEB4 @ =0x000006FC
	adds r0, r1, #0
	adds r3, r6, #0
	bl StartPrepErrorHelpbox
	b _0809E0DE
	.align 2, 0
_0809DEB4: .4byte 0x000006FC
_0809DEB8:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl PrepItemTrade_ApplyItemSwap
	ldr r4, _0809DF1C @ =0x02022EEC
	ldr r5, _0809DF20 @ =0x02013510
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809DA14
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809DA14
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _0809DF24
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _0809DF38
	.align 2, 0
_0809DF1C: .4byte 0x02022EEC
_0809DF20: .4byte 0x02013510
_0809DF24:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _0809DF3A
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_0809DF38:
	str r0, [r6, #0x38]
_0809DF3A:
	ldr r0, _0809DF78 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DF4C
	movs r0, #0x6a
	bl m4aSongNumStart
_0809DF4C:
	movs r0, #0
	bl sub_80B1524
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
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
	b _0809E0DE
	.align 2, 0
_0809DF78: .4byte 0x0202BCEC
_0809DF7C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0809DF86
	b _0809E07C
_0809DF86:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80B1FBC
	ldr r0, _0809DFC0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DFB8
	movs r0, #0x6b
	bl m4aSongNumStart
_0809DFB8:
	movs r0, #0
	bl sub_80B1524
	b _0809E0DE
	.align 2, 0
_0809DFC0: .4byte 0x0202BCEC
_0809DFC4:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E054
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl sub_80B1474
	cmp r4, #4
	bgt _0809E014
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _0809E01C
_0809E014:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_0809E01C:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
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
	ldr r0, _0809E050 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E0DE
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809E0DE
	.align 2, 0
_0809E050: .4byte 0x0202BCEC
_0809E054:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809E07C
	adds r0, r6, #0
	bl sub_8002DE4
	ldr r0, _0809E078 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E0DE
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809E0DE
	.align 2, 0
_0809E078: .4byte 0x0202BCEC
_0809E07C:
	adds r0, r6, #0
	bl PrepItemTrade_DpadKeyHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809E0DE
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80B1FBC
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _0809E0DE
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809E0DE
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_0809E0D4:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_0809E0DC:
	str r0, [r6, #0x3c]
_0809E0DE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

