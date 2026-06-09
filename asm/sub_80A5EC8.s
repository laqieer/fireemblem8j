	.syntax unified
	.set GetClassSMSId, 0x08018AA4 + 1
	.set GetSupportScreenPartnerClassId, 0x080A48D4 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_80A5A64, 0x080A5A64 + 1
	.section .text.sub_80A5EC8, "ax", %progbits
@ sub_80A5EC8 @ JP 0x080A5EC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5EC8
	.thumb_func
sub_80A5EC8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ResetUnitSprites
	movs r4, #0
	b _080A5EF0
_080A5ED4:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerClassId
	adds r1, r5, #0
	adds r1, #0x4d
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl sub_80267A0
	adds r4, #1
_080A5EF0:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A5ED4
	bl sub_8026F38
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _080A5F12
_080A5F08:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80A5A64
	adds r4, #1
_080A5F12:
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A5F08
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

