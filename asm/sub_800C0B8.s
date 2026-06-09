	.syntax unified
	.set nullsub_16, 0x080BD0C8 + 1
	.set sub_80BEE9C, 0x080BEE9C + 1
	.section .text.sub_800C0B8, "ax", %progbits
@ sub_800C0B8 @ JP 0x0800C0B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C0B8
	.thumb_func
sub_800C0B8:
	push {r4, lr}
	ldr r0, [r0, #0x38]
	ldr r4, [r0, #4]
	adds r0, r4, #0
	bl sub_80BEE9C
	adds r0, r4, #0
	bl nullsub_16
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

