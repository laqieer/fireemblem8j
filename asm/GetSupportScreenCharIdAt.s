	.syntax unified
	.section .text.GetSupportScreenCharIdAt, "ax", %progbits
@ GetSupportScreenCharIdAt @ JP 0x080A492C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSupportScreenCharIdAt
	.thumb_func
GetSupportScreenCharIdAt:
	ldr r1, _080A493C @ =0x08A95B10
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080A493C: .4byte 0x08A95B10

