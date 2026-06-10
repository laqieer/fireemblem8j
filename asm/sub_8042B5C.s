	.syntax unified
	.set Sio_ResetSession, 0x08041698 + 1
	.section .text.sub_8042B5C, "ax", %progbits
@ sub_8042B5C @ JP 0x08042B5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042B5C
	.thumb_func
sub_8042B5C:
	push {lr}
	ldr r2, _08042B80 @ =0x085D31E8
	ldr r1, [r2]
	adds r3, r1, #0
	adds r3, #0x2e
	movs r0, #0
	strb r0, [r3]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl Sio_ResetSession
	pop {r0}
	bx r0
	.align 2, 0
_08042B80: .4byte 0x085D31E8

