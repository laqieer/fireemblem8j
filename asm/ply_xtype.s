	.syntax unified
	.section .text.ply_xtype, "ax", %progbits
@ ply_xtype @ JP 0x080D62BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ply_xtype
	.thumb_func
ply_xtype:
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x24
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

