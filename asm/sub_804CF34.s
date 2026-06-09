	.syntax unified
	.set SetMuScreenPosition, 0x0807BBF8 + 1
	.section .text.sub_804CF34, "ax", %progbits
@ sub_804CF34 @ JP 0x0804CF34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CF34
	.thumb_func
sub_804CF34:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	lsls r1, r1, #4
	ldr r2, [r4, #0x38]
	lsls r2, r2, #4
	bl SetMuScreenPosition
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	strb r0, [r1, #0x10]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0

