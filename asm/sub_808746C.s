	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_808746C, "ax", %progbits
@ sub_808746C @ JP 0x0808746C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808746C
	.thumb_func
sub_808746C:
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	adds r4, r5, #1
	b _0808749E
_0808747A:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808749C
	ldr r2, [r0]
	cmp r2, #0
	beq _0808749C
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808749C
	ldrb r0, [r2, #4]
	cmp r0, r7
	bne _0808749C
	adds r6, #1
_0808749C:
	adds r4, #1
_0808749E:
	adds r0, r5, #0
	adds r0, #0x40
	cmp r4, r0
	blt _0808747A
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

