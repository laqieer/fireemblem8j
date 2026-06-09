	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_8090710, "ax", %progbits
@ sub_8090710 @ JP 0x08090710 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8090710
	.thumb_func
sub_8090710:
	push {r4, r5, lr}
	ldr r5, _08090774 @ =0x02023028
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	adds r0, r5, #0
	adds r0, #0x18
	ldr r1, _08090778 @ =0x0202BCEC
	ldrh r2, [r1, #0x10]
	movs r1, #2
	bl PutNumber
	adds r4, r5, #0
	adds r4, #0x96
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r0, r5, #0
	adds r0, #0x98
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	ldr r1, _0809077C @ =0xFFFFFEE2
	adds r0, r5, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	adds r0, r5, #0
	subs r0, #0x9e
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090774: .4byte 0x02023028
_08090778: .4byte 0x0202BCEC
_0809077C: .4byte 0xFFFFFEE2

