	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set ClearGoldBoxTextTm2Line, 0x080B9A3C + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set PutNumber, 0x08004A90 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.section .text.sub_80B9A5C, "ax", %progbits
@ sub_80B9A5C @ JP 0x080B9A5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9A5C
	.thumb_func
sub_80B9A5C:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	adds r0, r4, #0
	movs r1, #6
	bl ClearGoldBoxTextTm2Line
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0

