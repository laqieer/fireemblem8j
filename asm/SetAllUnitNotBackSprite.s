	.syntax unified
	.section .text.SetAllUnitNotBackSprite, "ax", %progbits
@ SetAllUnitNotBackSprite @ JP 0x08018670 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetAllUnitNotBackSprite
	.thumb_func
SetAllUnitNotBackSprite:
	push {r4, r5, lr}
	movs r2, #1
	ldr r5, _080186A0 @ =0x085C2A50
	movs r4, #0xff
	ldr r3, _080186A4 @ =0xFFFFFEFF
_0801867A:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018694
	ldr r0, [r1]
	cmp r0, #0
	beq _08018694
	ldr r0, [r1, #0xc]
	ands r0, r3
	str r0, [r1, #0xc]
_08018694:
	adds r2, #1
	cmp r2, #0xbf
	ble _0801867A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080186A0: .4byte 0x085C2A50
_080186A4: .4byte 0xFFFFFEFF

