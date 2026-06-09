	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807116C, 0x0807116C + 1
	.set sub_8071218, 0x08071218 + 1
	.section .text.sub_807114C, "ax", %progbits
@ sub_807114C @ JP 0x0807114C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807114C
	.thumb_func
sub_807114C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_807116C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071218
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

