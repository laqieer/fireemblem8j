	.syntax unified
	.set AP_SwitchAnimation, 0x08009408 + 1
	.section .text.sub_80BFDB4, "ax", %progbits
@ sub_80BFDB4 @ JP 0x080BFDB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFDB4
	.thumb_func
sub_80BFDB4:
	push {lr}
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x37
	strb r2, [r1]
	ldr r0, [r0, #0x40]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AP_SwitchAnimation
	pop {r0}
	bx r0

