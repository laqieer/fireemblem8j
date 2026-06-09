	.syntax unified
	.set nullsub_5, 0x08003328 + 1
	.section .text.PrintProcessNameRecursive, "ax", %progbits
@ PrintProcessNameRecursive @ JP 0x0800332C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrintProcessNameRecursive
	.thumb_func
PrintProcessNameRecursive:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0800333C
	bl PrintProcessNameRecursive
_0800333C:
	adds r0, r4, #0
	bl nullsub_5
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _0800335C
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
	adds r0, r1, #0
	adds r1, r5, #0
	bl PrintProcessNameRecursive
	ldr r0, [r5]
	subs r0, #2
	str r0, [r5]
_0800335C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

