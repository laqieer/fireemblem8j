	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_809C250, 0x0809C250 + 1
	.section .text.sub_809BD80, "ax", %progbits
@ sub_809BD80 @ JP 0x0809BD80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809BD80
	.thumb_func
sub_809BD80:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldr r4, _0809BDD0 @ =0x02013510
	ldr r5, _0809BDD4 @ =0x02022EEC
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809C250
	adds r4, #0x28
	adds r5, #0x1e
	adds r6, #0x2a
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809C250
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BDD0: .4byte 0x02013510
_0809BDD4: .4byte 0x02022EEC

