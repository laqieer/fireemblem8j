	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80B9D44, 0x080B9D44 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80B9C50, "ax", %progbits
@ sub_80B9C50 @ JP 0x080B9C50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9C50
	.thumb_func
sub_80B9C50:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	movs r4, #0
	ldr r5, _080B9C80 @ =0x0203EF64
_080B9C62:
	adds r0, r4, #0
	movs r1, #6
	bl sub_80D637C
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r5
	bl sub_8003CF8
	adds r4, #1
	cmp r4, #4
	ble _080B9C62
	movs r4, #0
	b _080B9C9E
	.align 2, 0
_080B9C80: .4byte 0x0203EF64
_080B9C84:
	lsls r0, r1, #3
	ldr r1, _080B9CC8 @ =0x0203EF64
	adds r0, r0, r1
	movs r1, #0x1f
	ands r3, r1
	lsls r3, r3, #6
	ldr r1, _080B9CCC @ =0x02023CB6
	adds r3, r3, r1
	adds r1, r2, #0
	adds r2, r5, #0
	bl sub_80B9D44
	adds r4, #1
_080B9C9E:
	cmp r4, #4
	bgt _080B9CBC
	adds r0, r4, #0
	movs r1, #6
	bl sub_80D637C
	adds r1, r0, #0
	ldr r5, [r6, #0x2c]
	lsls r3, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r3
	ldrh r2, [r0]
	cmp r2, #0
	bne _080B9C84
_080B9CBC:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9CC8: .4byte 0x0203EF64
_080B9CCC: .4byte 0x02023CB6

