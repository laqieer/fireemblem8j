	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundTypeFlags, 0x08059864 + 1
	.set GetEfxHp, 0x08059890 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8052FFC, "ax", %progbits
@ sub_8052FFC @ JP 0x08052FFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8052FFC
	.thumb_func
sub_8052FFC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080530D4
	ldr r1, _08053048 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _080530D4
	movs r0, #1
	str r0, [r1]
	ldr r0, _0805304C @ =0x085E37E4
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r4, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08053054
	ldr r0, _08053050 @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0805305C
	.align 2, 0
_08053048: .4byte 0x02017728
_0805304C: .4byte 0x085E37E4
_08053050: .4byte 0x02000000
_08053054:
	ldr r0, _080530AC @ =0x02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0805305C:
	str r0, [r6, #0x60]
	ldr r4, _080530B0 @ =0x0203E14E
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #1
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _080530B4
	movs r0, #1
	rsbs r0, r0, #0
	b _080530B6
	.align 2, 0
_080530AC: .4byte 0x02000000
_080530B0: .4byte 0x0203E14E
_080530B4:
	movs r0, #1
_080530B6:
	str r0, [r6, #0x48]
	movs r1, #0
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, _080530DC @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_080530D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080530DC: .4byte 0x02017780

