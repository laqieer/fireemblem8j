	.syntax unified
	.section .text.GetPortraitData, "ax", %progbits
@ GetPortraitData @ JP 0x0800541C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetPortraitData
	.thumb_func
GetPortraitData:
	adds r1, r0, #0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0800542C @ =0x0890111C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0800542C: .4byte 0x0890111C

