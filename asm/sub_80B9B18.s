	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80B9CEC, 0x080B9CEC + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80B9B18, "ax", %progbits
@ sub_80B9B18 @ JP 0x080B9B18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9B18
	.thumb_func
sub_80B9B18:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	adds r0, r6, #0
	adds r0, #0x5f
	ldrb r4, [r0]
	adds r0, r4, #5
	cmp r4, r0
	bge _080B9B54
_080B9B32:
	adds r0, r4, #0
	movs r1, #6
	bl sub_80D637C
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B9B60 @ =0x0203EF64
	adds r0, r0, r1
	bl sub_8003CF8
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x5f
	ldrb r0, [r0]
	adds r0, #5
	cmp r4, r0
	blt _080B9B32
_080B9B54:
	adds r0, r6, #0
	adds r0, #0x5f
	ldrb r4, [r0]
	adds r7, r0, #0
	b _080B9B7E
	.align 2, 0
_080B9B60: .4byte 0x0203EF64
_080B9B64:
	lsls r0, r1, #3
	ldr r1, _080B9BBC @ =0x0203EF64
	adds r0, r0, r1
	ldr r2, [r6, #0x2c]
	movs r1, #0x1f
	ands r3, r1
	lsls r3, r3, #6
	ldr r1, _080B9BC0 @ =0x02023CB6
	adds r3, r3, r1
	adds r1, r5, #0
	bl sub_80B9CEC
	adds r4, #1
_080B9B7E:
	ldrb r0, [r7]
	adds r0, #5
	cmp r4, r0
	bge _080B9B9E
	adds r0, r4, #0
	movs r1, #6
	bl sub_80D637C
	adds r1, r0, #0
	lsls r3, r4, #1
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r0, r3
	ldrh r5, [r0]
	cmp r5, #0
	bne _080B9B64
_080B9B9E:
	ldrb r2, [r7]
	lsls r2, r2, #0x14
	ldr r0, _080B9BC4 @ =0xFFB80000
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9BBC: .4byte 0x0203EF64
_080B9BC0: .4byte 0x02023CB6
_080B9BC4: .4byte 0xFFB80000

