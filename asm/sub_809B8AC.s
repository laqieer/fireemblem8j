	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set IsCoordHiddenByMinimug, 0x0809C4EC + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_809AEC0, 0x0809AEC0 + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_809AF64, 0x0809AF64 + 1
	.set sub_809B79C, 0x0809B79C + 1
	.set sub_80B1568, 0x080B1568 + 1
	.set sub_80B1584, 0x080B1584 + 1
	.section .text.sub_809B8AC, "ax", %progbits
@ sub_809B8AC @ JP 0x0809B8AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B8AC
	.thumb_func
sub_809B8AC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0809B914 @ =0x02022F06
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_809AF64
	adds r0, r6, #0
	bl sub_809B79C
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl IsCoordHiddenByMinimug
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B918
	bl sub_80B1568
	b _0809B91C
	.align 2, 0
_0809B914: .4byte 0x02022F06
_0809B918:
	bl sub_80B1584
_0809B91C:
	bl sub_809AEC0
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0

