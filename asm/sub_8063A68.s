	.syntax unified
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8063A68, "ax", %progbits
@ sub_8063A68 @ JP 0x08063A68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063A68
	.thumb_func
sub_8063A68:
	push {r4, lr}
	movs r3, #0x8e
	lsls r3, r3, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r0, #0x5c]
	movs r4, #2
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	movs r3, #1
	bl sub_8074E80
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

