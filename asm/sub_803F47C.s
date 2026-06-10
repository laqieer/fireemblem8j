	.syntax unified
	.set AiUpdateDecision, 0x08039CDC + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.section .text.sub_803F47C, "ax", %progbits
@ sub_803F47C @ JP 0x0803F47C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F47C
	.thumb_func
sub_803F47C:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldrb r5, [r0, #0xb]
	ldrb r0, [r4, #1]
	bl GetUnitFromCharId
	ldrb r3, [r0, #0xb]
	movs r0, #0xff
	str r0, [sp]
	movs r0, #8
	movs r1, #0
	adds r2, r5, #0
	bl AiUpdateDecision
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

