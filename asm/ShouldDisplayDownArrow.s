	.syntax unified
	.section .text.ShouldDisplayDownArrow, "ax", %progbits
@ ShouldDisplayDownArrow @ JP 0x080BA290 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ShouldDisplayDownArrow
	.thumb_func
ShouldDisplayDownArrow:
	push {lr}
	ldr r0, _080BA2A8 @ =0x08ABCAD0
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	ldrh r1, [r1, #2]
	cmp r0, r1
	blt _080BA2AC
	movs r0, #0
	b _080BA2AE
	.align 2, 0
_080BA2A8: .4byte 0x08ABCAD0
_080BA2AC:
	movs r0, #1
_080BA2AE:
	pop {r1}
	bx r1
	.align 2, 0

