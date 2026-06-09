	.syntax unified
	.section .text.ShouldDisplayUpArrow, "ax", %progbits
@ ShouldDisplayUpArrow @ JP 0x080BA274 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ShouldDisplayUpArrow
	.thumb_func
ShouldDisplayUpArrow:
	push {lr}
	ldr r0, _080BA284 @ =0x08ABCAD0
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	cmp r0, #0
	bne _080BA288
	movs r0, #0
	b _080BA28A
	.align 2, 0
_080BA284: .4byte 0x08ABCAD0
_080BA288:
	movs r0, #1
_080BA28A:
	pop {r1}
	bx r1
	.align 2, 0

