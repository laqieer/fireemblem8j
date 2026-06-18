	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C8F10, "ax", %progbits
@ CreditsBlendCG_2 @ JP 0x080C8F10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CreditsBlendCG_2
	.thumb_func
CreditsBlendCG_2:
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x34]
	subs r0, #1
	strh r0, [r3, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C8F36
	movs r0, #0
	strh r0, [r3, #0x30]
	ldr r1, [r3, #0x14]
	adds r1, #0x29
	ldrb r2, [r1]
	subs r0, #2
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	bl sub_8002DE4
_080C8F36:
	pop {r0}
	bx r0
	.align 2, 0

