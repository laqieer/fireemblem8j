	.syntax unified
	.section .text.__negdi2, "ax", %progbits
@ __negdi2 @ JP 0x080DC0BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __negdi2
	.thumb_func
__negdi2:
	push {r4, lr}
	rsbs r2, r0, #0
	adds r3, r2, #0
	rsbs r1, r1, #0
	cmp r2, #0
	beq _080DC0CA
	subs r1, #1
_080DC0CA:
	adds r4, r1, #0
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}
	.align 2, 0

