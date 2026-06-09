	.syntax unified
	.section .text.ResetKeyStatus, "ax", %progbits
@ ResetKeyStatus @ JP 0x080013DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetKeyStatus
	.thumb_func
ResetKeyStatus:
	movs r2, #0
	movs r1, #0xc
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	movs r1, #0
	strh r2, [r0, #0xa]
	strh r2, [r0, #4]
	strh r2, [r0, #8]
	strb r1, [r0, #2]
	strh r2, [r0, #0x12]
	ldr r0, _080013F8 @ =0x0300000E
	strh r2, [r0]
	bx lr
	.align 2, 0
_080013F8: .4byte 0x0300000E

