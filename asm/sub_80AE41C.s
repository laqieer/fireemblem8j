	.syntax unified
	.set sub_80B0A28, 0x080B0A28 + 1
	.section .text.sub_80AE41C, "ax", %progbits
@ sub_80AE41C @ JP 0x080AE41C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE41C
	.thumb_func
sub_80AE41C:
	push {lr}
	adds r0, #0x35
	ldrb r0, [r0]
	bl sub_80B0A28
	pop {r0}
	bx r0
	.align 2, 0

