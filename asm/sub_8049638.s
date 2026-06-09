	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8049638, "ax", %progbits
@ sub_8049638 @ JP 0x08049638 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049638
	.thumb_func
sub_8049638:
	push {lr}
	adds r2, r0, #0
	ldr r0, _08049654 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08049650
	adds r0, r2, #0
	bl sub_8002DE4
_08049650:
	pop {r0}
	bx r0
	.align 2, 0
_08049654: .4byte 0x085775CC

