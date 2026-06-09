	.syntax unified
	.section .text.GetSupportScreenClassIdAt, "ax", %progbits
@ GetSupportScreenClassIdAt @ JP 0x080A4940 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSupportScreenClassIdAt
	.thumb_func
GetSupportScreenClassIdAt:
	ldr r1, _080A4950 @ =0x08A95B10
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_080A4950: .4byte 0x08A95B10

