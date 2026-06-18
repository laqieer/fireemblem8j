	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B762C, 0x080B762C + 1
	.section .text.sub_80B7BE8, "ax", %progbits
@ ClassIntroLetter_LoopFadeOut @ JP 0x080B7BE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClassIntroLetter_LoopFadeOut
	.thumb_func
ClassIntroLetter_LoopFadeOut:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r0, r5
	subs r0, r5, r0
	adds r7, r4, #0
	adds r7, #0x2c
	ldrb r2, [r7]
	movs r6, #0x2e
	ldrsh r3, [r4, r6]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r4, #0x2a]
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #0x18
	adds r3, r6, #0
	bl sub_80B762C
	ldrh r0, [r4, #0x2a]
	cmp r0, r5
	bne _080B7C3C
	ldr r0, [r4, #0x14]
	ldrb r1, [r7]
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl sub_8002DE4
_080B7C3C:
	ldrh r0, [r4, #0x2a]
	adds r0, #8
	strh r0, [r4, #0x2a]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

