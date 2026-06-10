	.syntax unified
	.section .text.HasUnitGainedSupportLevel, "ax", %progbits
@ HasUnitGainedSupportLevel @ JP 0x08028720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HasUnitGainedSupportLevel
	.thumb_func
HasUnitGainedSupportLevel:
	adds r0, #0x39
	movs r2, #1
	lsls r2, r1
	ldrb r0, [r0]
	ands r2, r0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0

