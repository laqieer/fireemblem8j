	.syntax unified
	.section .text._lo0bits, "ax", %progbits
@ _lo0bits @ JP 0x080D9B4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _lo0bits
	.thumb_func
_lo0bits:
	adds r3, r0, #0
	ldr r1, [r3]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _080D9B7C
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D9B64
	movs r0, #0
	b _080D9BCC
_080D9B64:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D9B74
	lsrs r0, r1, #1
	str r0, [r3]
	movs r0, #1
	b _080D9BCC
_080D9B74:
	lsrs r0, r1, #2
	str r0, [r3]
	movs r0, #2
	b _080D9BCC
_080D9B7C:
	movs r2, #0
	ldr r0, _080D9BC4 @ =0x0000FFFF
	ands r0, r1
	cmp r0, #0
	bne _080D9B8A
	movs r2, #0x10
	lsrs r1, r1, #0x10
_080D9B8A:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	bne _080D9B96
	adds r2, #8
	lsrs r1, r1, #8
_080D9B96:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080D9BA2
	adds r2, #4
	lsrs r1, r1, #4
_080D9BA2:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080D9BAE
	adds r2, #2
	lsrs r1, r1, #2
_080D9BAE:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080D9BC8
	adds r2, #1
	lsrs r1, r1, #1
	cmp r1, #0
	bne _080D9BC8
	movs r0, #0x20
	b _080D9BCC
	.align 2, 0
_080D9BC4: .4byte 0x0000FFFF
_080D9BC8:
	str r1, [r3]
	adds r0, r2, #0
_080D9BCC:
	bx lr
	.align 2, 0

