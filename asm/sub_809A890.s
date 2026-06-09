	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_809A7A4, 0x0809A7A4 + 1
	.section .text.sub_809A890, "ax", %progbits
@ sub_809A890 @ JP 0x0809A890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A890
	.thumb_func
sub_809A890:
	push {r4, r5, lr}
	ldr r0, _0809A8D0 @ =0x02013580
	ldr r4, _0809A8D4 @ =0x0202310E
	adds r1, r4, #0
	bl PutText
	adds r5, r4, #0
	adds r5, #0x10
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	adds r4, #0x12
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #0xa8
	movs r1, #0x85
	bl sub_809A7A4
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A8D0: .4byte 0x02013580
_0809A8D4: .4byte 0x0202310E

