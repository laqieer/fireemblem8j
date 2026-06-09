	.syntax unified
	.set sub_80C0368, 0x080C0368 + 1
	.section .text.sub_80C3218, "ax", %progbits
@ sub_80C3218 @ JP 0x080C3218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3218
	.thumb_func
sub_80C3218:
	push {lr}
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	movs r2, #0
	bl sub_80C0368
	pop {r0}
	bx r0
	.align 2, 0

