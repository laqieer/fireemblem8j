	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80A22D0, "ax", %progbits
@ sub_80A22D0 @ JP 0x080A22D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A22D0
	.thumb_func
sub_80A22D0:
	push {r4, r5, lr}
	ldr r4, _080A2310 @ =0x02022E90
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r5, r4, r0
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	ldr r0, _080A2314 @ =0x0000028E
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2310: .4byte 0x02022E90
_080A2314: .4byte 0x0000028E

