	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_809C250, 0x0809C250 + 1
	.set sub_809C7D4, 0x0809C7D4 + 1
	.section .text.sub_809B988, "ax", %progbits
@ sub_809B988 @ JP 0x0809B988 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B988
	.thumb_func
sub_809B988:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_809C7D4
	ldr r0, _0809B9B8 @ =0x02013510
	ldr r1, _0809B9BC @ =0x02022EEC
	adds r2, r5, #0
	movs r3, #0
	bl sub_809C250
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B9B8: .4byte 0x02013510
_0809B9BC: .4byte 0x02022EEC

