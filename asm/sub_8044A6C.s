	.syntax unified
	.set sub_8043190, 0x08043190 + 1
	.set sub_8044694, 0x08044694 + 1
	.section .text.sub_8044A6C, "ax", %progbits
@ TacticianTryDeleteChar @ JP 0x08044A6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global TacticianTryDeleteChar
	.thumb_func
TacticianTryDeleteChar:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044ABC
	movs r0, #2
	bl sub_8043190
	ldrb r1, [r4]
	lsrs r0, r1, #1
	lsls r0, r0, #1
	adds r2, r5, #0
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne _08044A96
	subs r0, r1, #2
	strb r0, [r4]
_08044A96:
	ldrb r0, [r4]
	adds r0, r0, r5
	adds r0, #0x3d
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x39
	strb r2, [r0]
	adds r0, r5, #0
	bl sub_8044694
	b _08044AC2
_08044ABC:
	movs r0, #0
	bl sub_8043190
_08044AC2:
	pop {r4, r5}
	pop {r0}
	bx r0

