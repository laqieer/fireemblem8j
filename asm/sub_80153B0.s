	.syntax unified
	.set sub_80283C8, 0x080283C8 + 1
	.section .text.sub_80153B0, "ax", %progbits
@ sub_80153B0 @ JP 0x080153B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80153B0
	.thumb_func
sub_80153B0:
	push {lr}
	ldr r2, _080153C4 @ =0x0202BCEC
	ldrb r0, [r2, #0xf]
	cmp r0, #0x40
	beq _080153DA
	cmp r0, #0x40
	bgt _080153C8
	cmp r0, #0
	beq _080153CE
	b _080153EE
	.align 2, 0
_080153C4: .4byte 0x0202BCEC
_080153C8:
	cmp r0, #0x80
	beq _080153D4
	b _080153EE
_080153CE:
	movs r0, #0x80
	strb r0, [r2, #0xf]
	b _080153EE
_080153D4:
	movs r0, #0x40
	strb r0, [r2, #0xf]
	b _080153EE
_080153DA:
	movs r0, #0
	strb r0, [r2, #0xf]
	ldrh r1, [r2, #0x10]
	ldr r0, _080153F4 @ =0x000003E6
	cmp r1, r0
	bhi _080153EA
	adds r0, r1, #1
	strh r0, [r2, #0x10]
_080153EA:
	bl sub_80283C8
_080153EE:
	pop {r0}
	bx r0
	.align 2, 0
_080153F4: .4byte 0x000003E6

