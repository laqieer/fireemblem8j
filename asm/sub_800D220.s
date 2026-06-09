	.syntax unified
	.set CallNextQueuedEvent, 0x0800D308 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set UnlockGame, 0x08015394 + 1
	.set memset, 0x080D6968 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8006980, 0x08006980 + 1
	.set sub_800BE84, 0x0800BE84 + 1
	.set sub_800BFC8, 0x0800BFC8 + 1
	.set sub_800E854, 0x0800E854 + 1
	.set sub_8015710, 0x08015710 + 1
	.set sub_8018DC8, 0x08018DC8 + 1
	.set sub_801964C, 0x0801964C + 1
	.set sub_803113C, 0x0803113C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_80503A0, 0x080503A0 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_808DE84, 0x0808DE84 + 1
	.set sub_8091544, 0x08091544 + 1
	.section .text.sub_800D220, "ax", %progbits
@ sub_800D220 @ JP 0x0800D220 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D220
	.thumb_func
sub_800D220:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	bl sub_804F8F4
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #4
	beq _0800D28A
	cmp r0, #4
	bgt _0800D246
	cmp r0, #2
	beq _0800D27A
	b _0800D28A
_0800D246:
	cmp r0, #5
	bne _0800D28A
	bl sub_8015710
	bl sub_801964C
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BFC8
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800D27A
	bl sub_807B4B8
	bl sub_803113C
	ldr r0, _0800D2CC @ =0x03000430
	movs r1, #0
	movs r2, #0x80
	bl memset
_0800D27A:
	bl UnlockGame
	bl sub_80503A0
	bl sub_800BE84
	bl sub_8018DC8
_0800D28A:
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	cmp r0, #3
	beq _0800D2B6
	bl sub_8006980
	bl sub_8091544
	bl sub_808DE84
	ldrb r0, [r5]
	cmp r0, #1
	bne _0800D2B0
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BFC8
_0800D2B0:
	adds r0, r4, #0
	bl sub_800E854
_0800D2B6:
	ldrh r1, [r4, #0x3c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D2C4
	bl CallNextQueuedEvent
_0800D2C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D2CC: .4byte 0x03000430

