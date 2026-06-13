	.syntax unified
	.set Text_Skip, 0x08003D88 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.TextPrint_OnLoop, "ax", %progbits
@ TextPrint_OnLoop @ JP 0x080047B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global TextPrint_OnLoop
	.thumb_func
TextPrint_OnLoop:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _08004826
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x36
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r6, r0, #0
	cmp r5, r1
	bge _08004826
_080047E4:
	ldr r0, [r4, #0x30]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	blt _08004814
	cmp r2, #1
	ble _080047F8
	cmp r2, #4
	beq _08004806
	b _08004814
_080047F8:
	ldr r1, [r4, #0x2c]
	movs r0, #0
	strb r0, [r1, #7]
	adds r0, r4, #0
	bl sub_8002DE4
	b _08004826
_08004806:
	adds r0, r1, #1
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	movs r1, #6
	bl Text_Skip
	b _0800481C
_08004814:
	ldr r0, [r4, #0x2c]
	bl sub_80040B8
	str r0, [r4, #0x30]
_0800481C:
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r5, r0
	blt _080047E4
_08004826:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

