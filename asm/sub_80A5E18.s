	.syntax unified
	.set GetSupportScreenPartnerSupportLevel, 0x080A48BC + 1
	.section .text.sub_80A5E18, "ax", %progbits
@ sub_80A5E18 @ JP 0x080A5E18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5E18
	.thumb_func
sub_80A5E18:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _080A5E40
	adds r7, r5, #0
	adds r7, #0x46
	adds r6, r0, #0
_080A5E2C:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerSupportLevel
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A5E2C
_080A5E40:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

