	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_801729C, 0x0801729C + 1
	.section .text.sub_8036728, "ax", %progbits
@ sub_8036728 @ JP 0x08036728 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036728
	.thumb_func
sub_8036728:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	mov r8, r0
	adds r6, r1, #0
	adds r0, r2, #0
	bl sub_801729C
	adds r4, r0, #0
	movs r0, #0x38
	adds r1, r4, #0
	bl sub_8003EAC
	adds r5, r0, #0
	adds r0, r6, #0
	bl sub_8003CF8
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0
	adds r3, r5, #0
	bl sub_8004374
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

