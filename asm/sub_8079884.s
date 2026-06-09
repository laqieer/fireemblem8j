	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8079884, "ax", %progbits
@ sub_8079884 @ JP 0x08079884 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079884
	.thumb_func
sub_8079884:
	push {lr}
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	bl sub_8002DE4
	pop {r0}
	bx r0
	.align 2, 0

