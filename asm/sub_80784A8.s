	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8077F8C, 0x08077F8C + 1
	.set sub_80780DC, 0x080780DC + 1
	.section .text.sub_80784A8, "ax", %progbits
@ sub_80784A8 @ JP 0x080784A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80784A8
	.thumb_func
sub_80784A8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	cmp r2, #0
	beq _080784C4
	movs r1, #0
	bl sub_80780DC
	bl sub_8077F8C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_080784C4:
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

