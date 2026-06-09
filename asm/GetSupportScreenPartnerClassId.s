	.syntax unified
	.section .text.GetSupportScreenPartnerClassId, "ax", %progbits
@ GetSupportScreenPartnerClassId @ JP 0x080A48D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSupportScreenPartnerClassId
	.thumb_func
GetSupportScreenPartnerClassId:
	ldr r2, _080A48E8 @ =0x08A95B10
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_080A48E8: .4byte 0x08A95B10

