	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_809B600, 0x0809B600 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809B92C, "ax", %progbits
@ sub_809B92C @ JP 0x0809B92C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B92C
	.thumb_func
sub_809B92C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0809B980 @ =0x02022F0E
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809B600
	ldr r0, _0809B984 @ =sub_809AEA0
	adds r1, r4, #0
	bl sub_80B1D98
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r4, #0
	bl sub_808B750
	adds r4, #0x2e
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl sub_80B1FBC
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B980: .4byte 0x02022F0E
_0809B984: .4byte 0x0809AEA1  @ sub_809AEA0

