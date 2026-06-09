	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80717F8, 0x080717F8 + 1
	.section .text.sub_80717E0, "ax", %progbits
@ sub_80717E0 @ JP 0x080717E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80717E0
	.thumb_func
sub_80717E0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_80717F8
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

