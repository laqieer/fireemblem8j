	.syntax unified
	.section .text.sub_80B7B48, "ax", %progbits
@ sub_80B7B48 @ JP 0x080B7B48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7B48
	.thumb_func
sub_80B7B48:
	movs r1, #0
	strh r1, [r0, #0x2a]
	ldr r3, [r0, #0x14]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	ldrh r3, [r3, #0x2c]
	adds r1, r1, r3
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0

