	.syntax unified
	.section .text.GetMuImgBufById, "ax", %progbits
@ GetMuImgBufById @ JP 0x0807B96C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetMuImgBufById
	.thumb_func
GetMuImgBufById:
	ldr r1, _0807B980 @ =0x08A13302
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #9
	ldr r1, _0807B984 @ =0x02004BE0
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0807B980: .4byte 0x08A13302
_0807B984: .4byte 0x02004BE0

