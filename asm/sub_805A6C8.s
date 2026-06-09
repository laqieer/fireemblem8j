	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_805A6E0, 0x0805A6E0 + 1
	.section .text.sub_805A6C8, "ax", %progbits
@ sub_805A6C8 @ JP 0x0805A6C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805A6C8
	.thumb_func
sub_805A6C8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_805A6E0
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

