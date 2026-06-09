	.syntax unified
	.set PrintProcessNameRecursive, 0x0800332C + 1
	.set nullsub_5, 0x08003328 + 1
	.section .text.PrintProcessTree, "ax", %progbits
@ PrintProcessTree @ JP 0x08003364 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrintProcessTree
	.thumb_func
PrintProcessTree:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	bl nullsub_5
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _0800338E
	ldr r0, [sp]
	adds r0, #2
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sp
	bl PrintProcessNameRecursive
	ldr r0, [sp]
	subs r0, #2
	str r0, [sp]
_0800338E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

