	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80B9CEC, 0x080B9CEC + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80B8F44, "ax", %progbits
@ sub_80B8F44 @ JP 0x080B8F44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8F44
	.thumb_func
sub_80B8F44:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #6
	bl sub_80D637C
	adds r4, r0, #0
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r4, r4, #3
	ldr r0, _080B8F98 @ =0x0203EF64
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8003CF8
	lsls r5, r5, #1
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldrh r1, [r0]
	cmp r1, #0
	beq _080B8F90
	ldr r2, [r6, #0x2c]
	movs r3, #0x1f
	ands r3, r5
	lsls r3, r3, #6
	ldr r0, _080B8F9C @ =0x02023CB6
	adds r3, r3, r0
	adds r0, r4, #0
	bl sub_80B9CEC
_080B8F90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F98: .4byte 0x0203EF64
_080B8F9C: .4byte 0x02023CB6

