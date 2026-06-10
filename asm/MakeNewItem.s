	.syntax unified
	.section .text.MakeNewItem, "ax", %progbits
@ MakeNewItem @ JP 0x080162E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MakeNewItem
	.thumb_func
MakeNewItem:
	push {lr}
	adds r2, r0, #0
	movs r0, #0xff
	ands r2, r0
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _08016318 @ =0x0885E068
	adds r3, r0, r1
	ldr r1, [r3, #8]
	movs r0, #8
	ands r1, r0
	movs r0, #0xff
	cmp r1, #0
	bne _08016308
	ldrb r0, [r3, #0x14]
_08016308:
	cmp r1, #0
	beq _0801630E
	movs r0, #0
_0801630E:
	lsls r0, r0, #8
	adds r0, r0, r2
	pop {r1}
	bx r1
	.align 2, 0
_08016318: .4byte 0x0885E068

