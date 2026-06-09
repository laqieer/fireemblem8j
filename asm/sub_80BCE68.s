	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80BCE68, "ax", %progbits
@ sub_80BCE68 @ JP 0x080BCE68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCE68
	.thumb_func
sub_80BCE68:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BCE90 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080BCE88
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_800226C
	adds r0, r4, #0
	bl sub_8002DE4
_080BCE88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCE90: .4byte 0x085775CC

