	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8087274, "ax", %progbits
@ sub_8087274 @ JP 0x08087274 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087274
	.thumb_func
sub_8087274:
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0808727A:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080872A0
	ldr r0, [r1]
	cmp r0, #0
	beq _080872A0
	ldr r1, [r1, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _080872A0
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080872A0
	adds r5, #1
_080872A0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808727A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

