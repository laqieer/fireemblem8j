	.syntax unified
	.section .text.GetMuImg, "ax", %progbits
@ GetMuImg @ JP 0x0807B988 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetMuImg
	.thumb_func
GetMuImg:
	ldr r1, _0807B998 @ =0x08A13488
	adds r0, #0x41
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0807B998: .4byte 0x08A13488

