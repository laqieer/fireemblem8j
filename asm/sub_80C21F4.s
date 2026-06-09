	.syntax unified
	.set sub_80BFD3C, 0x080BFD3C + 1
	.section .text.sub_80C21F4, "ax", %progbits
@ sub_80C21F4 @ JP 0x080C21F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C21F4
	.thumb_func
sub_80C21F4:
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x2b
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080C2214
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_80BFD3C
	movs r0, #0xff
	strb r0, [r4]
_080C2214:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

