	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80890A0, 0x080890A0 + 1
	.set sub_808ABD8, 0x0808ABD8 + 1
	.set sub_809AC94, 0x0809AC94 + 1
	.section .text.sub_809B3AC, "ax", %progbits
@ sub_809B3AC @ JP 0x0809B3AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B3AC
	.thumb_func
sub_809B3AC:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_809AC94
	movs r0, #0x31
	bl sub_80890A0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_808ABD8
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

