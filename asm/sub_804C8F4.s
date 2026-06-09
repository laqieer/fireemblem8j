	.syntax unified
	.set InitWindowScanlineBounds, 0x08013288 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.section .text.sub_804C8F4, "ax", %progbits
@ sub_804C8F4 @ JP 0x0804C8F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C8F4
	.thumb_func
sub_804C8F4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0804C928 @ =0x02001180
	ldr r0, _0804C92C @ =0x02000F00
	str r0, [r1]
	ldr r5, _0804C930 @ =0x02001184
	ldr r2, _0804C934 @ =0xFFFFFD80
	adds r1, r0, r2
	str r1, [r5]
	ldr r1, _0804C938 @ =0x02001188
	str r0, [r1]
	bl InitWindowScanlineBounds
	ldr r0, [r5]
	bl InitWindowScanlineBounds
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0804C93C @ =Sio_BoxTransitionHBlankHandler
	bl SetPrimaryHBlankHandler
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C928: .4byte 0x02001180
_0804C92C: .4byte 0x02000F00
_0804C930: .4byte 0x02001184
_0804C934: .4byte 0xFFFFFD80
_0804C938: .4byte 0x02001188
_0804C93C: .4byte 0x0804C705  @ Sio_BoxTransitionHBlankHandler

