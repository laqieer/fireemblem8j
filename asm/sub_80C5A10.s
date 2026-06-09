	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetPortraitData, 0x0800541C + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set ResetText, 0x08003BC4 + 1
	.set StartUiMu, 0x0807A918 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8005D9C, 0x08005D9C + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_80C5868, 0x080C5868 + 1
	.set sub_80C59F4, 0x080C59F4 + 1
	.section .text.sub_80C5A10, "ax", %progbits
@ sub_80C5A10 @ JP 0x080C5A10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5A10
	.thumb_func
sub_80C5A10:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _080C5A80 @ =0x03005270
	ldrb r1, [r2, #0x10]
	movs r0, #2
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _080C5A28
	movs r0, #0x12
	ldrsh r1, [r2, r0]
_080C5A28:
	adds r0, r1, #0
	bl GetUnitFromCharId
	str r0, [r5, #0x2c]
	bl sub_8018FCC
	adds r4, r0, #0
	ldr r0, [r5, #0x2c]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080C5A46
	adds r4, #1
_080C5A46:
	bl ResetText
	bl sub_80034C4
	adds r0, r5, #0
	bl sub_80C59F4
	ldr r1, _080C5A84 @ =0x02023D0C
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0xd
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_8005D9C
	adds r0, r4, #0
	bl GetPortraitData
	ldr r0, [r0]
	cmp r0, #0
	beq _080C5A8C
	ldr r0, _080C5A88 @ =0x08A73F9C
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	b _080C5A96
	.align 2, 0
_080C5A80: .4byte 0x03005270
_080C5A84: .4byte 0x02023D0C
_080C5A88: .4byte 0x08A73F9C
_080C5A8C:
	ldr r0, _080C5ABC @ =0x08A73FBC
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
_080C5A96:
	bl sub_807B4B8
	ldr r0, [r5, #0x2c]
	movs r1, #0xd8
	movs r2, #0x87
	bl StartUiMu
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_80C5868
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5ABC: .4byte 0x08A73FBC

