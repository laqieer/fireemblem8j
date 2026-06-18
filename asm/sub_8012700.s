	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8012700, "ax", %progbits
@ StoreUnitWordStructs @ JP 0x08012700 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StoreUnitWordStructs
	.thumb_func
StoreUnitWordStructs:
	push {r4, r5, lr}
	ldr r4, _08012738 @ =0x030005F8
	movs r5, #1
_08012706:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08012726
	ldr r0, [r1]
	cmp r0, #0
	beq _08012726
	ldrb r0, [r0, #4]
	strb r0, [r4]
	ldrb r0, [r1, #0x10]
	strb r0, [r4, #1]
	ldrb r0, [r1, #0x11]
	strb r0, [r4, #2]
	adds r4, #4
_08012726:
	adds r5, #1
	cmp r5, #0x3f
	ble _08012706
	movs r0, #0
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012738: .4byte 0x030005F8

