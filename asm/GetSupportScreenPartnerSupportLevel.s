	.syntax unified
	.section .text.GetSupportScreenPartnerSupportLevel, "ax", %progbits
@ GetSupportScreenPartnerSupportLevel @ JP 0x080A48BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSupportScreenPartnerSupportLevel
	.thumb_func
GetSupportScreenPartnerSupportLevel:
	ldr r2, _080A48D0 @ =0x08A95B10
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_080A48D0: .4byte 0x08A95B10

