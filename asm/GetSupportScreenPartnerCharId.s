	.syntax unified
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.section .text.GetSupportScreenPartnerCharId, "ax", %progbits
@ GetSupportScreenPartnerCharId @ JP 0x080A4908 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSupportScreenPartnerCharId
	.thumb_func
GetSupportScreenPartnerCharId:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _080A4928 @ =0x088582BC
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A4928: .4byte 0x088582BC

