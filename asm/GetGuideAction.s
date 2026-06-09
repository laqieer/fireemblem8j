	.syntax unified
	.section .text.GetGuideAction, "ax", %progbits
@ GetGuideAction @ JP 0x080D3C44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetGuideAction
	.thumb_func
GetGuideAction:
	push {r4, lr}
	ldr r1, _080D3C60 @ =0x08BABAF4
	ldr r1, [r1]
	adds r1, #0x2f
	ldrb r2, [r1]
	ldr r4, _080D3C64 @ =0x085775CC
	cmp r2, #1
	beq _080D3C7E
	cmp r2, #1
	bgt _080D3C68
	cmp r2, #0
	beq _080D3C6E
	b _080D3CBC
	.align 2, 0
_080D3C60: .4byte 0x08BABAF4
_080D3C64: .4byte 0x085775CC
_080D3C68:
	cmp r2, #2
	beq _080D3C9A
	b _080D3CBC
_080D3C6E:
	ldr r1, [r4]
	ldrh r2, [r1, #8]
	movs r1, #4
	ands r1, r2
	cmp r1, #0
	beq _080D3C7E
	movs r0, #4
	b _080D3CCA
_080D3C7E:
	ldr r1, [r4]
	ldrh r2, [r1, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080D3C8E
	movs r0, #2
	b _080D3CCA
_080D3C8E:
	movs r1, #2
	ands r1, r2
	cmp r1, #0
	beq _080D3CBC
_080D3C96:
	movs r0, #3
	b _080D3CCA
_080D3C9A:
	ldr r1, [r4]
	ldrh r3, [r1, #8]
	ands r2, r3
	cmp r2, #0
	bne _080D3C96
	movs r1, #0x11
	ands r1, r3
	cmp r1, #0
	beq _080D3CB0
	movs r0, #5
	b _080D3CCA
_080D3CB0:
	movs r1, #0x20
	ands r1, r3
	cmp r1, #0
	beq _080D3CBC
	movs r0, #6
	b _080D3CCA
_080D3CBC:
	ldr r1, [r4]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	ands r1, r2
	cmp r1, #0
	beq _080D3CCA
	movs r0, #1
_080D3CCA:
	pop {r4}
	pop {r1}
	bx r1

