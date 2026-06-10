	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8038EB0, 0x08038EB0 + 1
	.section .text.sub_8038F20, "ax", %progbits
@ sub_8038F20 @ JP 0x08038F20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038F20
	.thumb_func
sub_8038F20:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8038EB0
	ldr r0, _08038F44 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08038F3C
	adds r0, r4, #0
	bl sub_8002DE4
_08038F3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038F44: .4byte 0x085775CC

