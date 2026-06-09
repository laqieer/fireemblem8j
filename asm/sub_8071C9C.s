	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8071CB4, 0x08071CB4 + 1
	.section .text.sub_8071C9C, "ax", %progbits
@ sub_8071C9C @ JP 0x08071C9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071C9C
	.thumb_func
sub_8071C9C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071CB4
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

