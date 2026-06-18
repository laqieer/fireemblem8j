	.syntax unified
	.set CheckGameEndFlag, 0x080A96F8 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C8FF0, 0x080C8FF0 + 1
	.set sub_80C916C, 0x080C916C + 1
	.set sub_80C9398, 0x080C9398 + 1
	.section .text.sub_80C941C, "ax", %progbits
@ EndingCredits_Loop_Main @ JP 0x080C941C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EndingCredits_Loop_Main
	.thumb_func
EndingCredits_Loop_Main:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C9440 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C9444
	bl CheckGameEndFlag
	cmp r0, #0
	beq _080C9444
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080C9492
	.align 2, 0
_080C9440: .4byte 0x085775CC
_080C9444:
	ldr r1, [r4, #0x30]
	ldr r0, _080C9498 @ =0x000037FF
	cmp r1, r0
	bgt _080C9454
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r1, r2
	str r0, [r4, #0x30]
_080C9454:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C9468
	ldr r0, [r4, #0x30]
	adds r0, #0x80
	str r0, [r4, #0x30]
_080C9468:
	adds r0, r4, #0
	bl sub_80C8FF0
	adds r0, r4, #0
	bl sub_80C916C
	adds r0, r4, #0
	bl sub_80C9398
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x13
	bls _080C9492
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_080C9492:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9498: .4byte 0x000037FF

