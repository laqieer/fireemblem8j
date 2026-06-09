	.syntax unified
	.section .text.FlushLCDControl, "ax", %progbits
@ FlushLCDControl @ JP 0x08000E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global FlushLCDControl
	.thumb_func
FlushLCDControl:
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r2, _08000EF0 @ =0x03003020
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #4]
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #0xc]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x14]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x18]
	strh r0, [r1]
	adds r1, #2
	ldr r0, [r2, #0x1c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x20]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x24]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x28]
	str r0, [r1]
	adds r1, #0x24
	ldr r0, [r2, #0x2c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x30]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x34]
	str r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #0x38]
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #0x3c]
	strh r0, [r1]
	adds r1, #2
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r0, r2, #0
	adds r0, #0x46
	ldrb r0, [r0]
	strb r0, [r1]
	subs r1, #0x34
	ldr r0, [r2, #0x48]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x4c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x50]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x54]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x58]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x5c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x60]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x64]
	str r0, [r1]
	bx lr
	.align 2, 0
_08000EF0: .4byte 0x03003020

