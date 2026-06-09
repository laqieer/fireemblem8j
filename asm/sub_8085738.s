	.syntax unified
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.section .text.sub_8085738, "ax", %progbits
@ sub_8085738 @ JP 0x08085738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085738
	.thumb_func
sub_8085738:
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r1, [r0, #0x3c]
	ldrb r1, [r1, #1]
	strb r1, [r4]
	ldr r1, [r0, #0x40]
	ldrb r1, [r1, #1]
	strb r1, [r4, #1]
	ldr r0, [r0, #0x44]
	ldrb r0, [r0, #1]
	strb r0, [r4, #2]
	pop {r4}
	pop {r0}
	bx r0

