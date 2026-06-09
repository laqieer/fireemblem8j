	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B3F58, 0x080B3F58 + 1
	.set sub_80B3F70, 0x080B3F70 + 1
	.set sub_80B46D4, 0x080B46D4 + 1
	.section .text.sub_80B4910, "ax", %progbits
@ sub_80B4910 @ JP 0x080B4910 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4910
	.thumb_func
sub_80B4910:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r1]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080B4932
	adds r0, #0x3f
_080B4932:
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80B46D4
	ldrb r0, [r4]
	cmp r0, #0
	bne _080B4958
	adds r0, r5, #0
	bl sub_80B3F70
	adds r0, r5, #0
	bl sub_80B3F58
	adds r0, r5, #0
	bl sub_8002DE4
_080B4958:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

