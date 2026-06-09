	.syntax unified
	.section .text.GetSupportScreenPartnerCount, "ax", %progbits
@ GetSupportScreenPartnerCount @ JP 0x080A5944 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSupportScreenPartnerCount
	.thumb_func
GetSupportScreenPartnerCount:
	push {lr}
	ldr r2, _080A595C @ =0x088582BC
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080A5960
	ldrb r0, [r0, #0x15]
	b _080A5962
	.align 2, 0
_080A595C: .4byte 0x088582BC
_080A5960:
	movs r0, #0
_080A5962:
	pop {r1}
	bx r1
	.align 2, 0

