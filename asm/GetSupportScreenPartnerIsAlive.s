	.syntax unified
	.section .text.GetSupportScreenPartnerIsAlive, "ax", %progbits
@ GetSupportScreenPartnerIsAlive @ JP 0x080A48EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSupportScreenPartnerIsAlive
	.thumb_func
GetSupportScreenPartnerIsAlive:
	ldr r2, _080A4904 @ =0x08A95B10
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_080A4904: .4byte 0x08A95B10

