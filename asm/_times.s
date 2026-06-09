	.syntax unified
	.section .text._times, "ax", %progbits
@ _times @ JP 0x080DA808 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _times
	.thumb_func
_times:
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r3, r0, #0
	cmp r2, #0
	beq _080DA826
	str r3, [r2]
	movs r0, #0
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
_080DA826:
	adds r0, r3, #0
	pop {r4, r5, pc}
	.align 2, 0

