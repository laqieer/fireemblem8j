	.syntax unified
	.section .text.sub_80C2EF0, "ax", %progbits
@ sub_80C2EF0 @ JP 0x080C2EF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C2EF0
	.thumb_func
sub_80C2EF0:
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x29
	movs r0, #1
	ands r2, r0
	lsls r2, r2, #3
	ldrb r3, [r1]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0

