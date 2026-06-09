	.syntax unified
	.set sub_80A7650, 0x080A7650 + 1
	.section .text.sub_80A4088, "ax", %progbits
@ sub_80A4088 @ JP 0x080A4088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4088
	.thumb_func
sub_80A4088:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	bl sub_80A7650
	pop {r0}
	bx r0
	.align 2, 0

