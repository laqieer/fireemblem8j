	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8075510, "ax", %progbits
@ sub_8075510 @ JP 0x08075510 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8075510
	.thumb_func
sub_8075510:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

