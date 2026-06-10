	.syntax unified
	.set sub_802BFFC, 0x0802BFFC + 1
	.section .text.UpdateUnitDuringBattle, "ax", %progbits
@ UpdateUnitDuringBattle @ JP 0x0802C21C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UpdateUnitDuringBattle
	.thumb_func
UpdateUnitDuringBattle:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4, #0x13]
	strb r0, [r5, #0x13]
	adds r0, r4, #0
	bl sub_802BFFC
	adds r2, r0, #0
	cmp r2, #0
	ble _0802C240
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r2, [r0]
_0802C240:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

