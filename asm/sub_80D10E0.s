	.syntax unified
	.set OpAnimHS_BrightenPalette, 0x080D0EC4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D0DB4, 0x080D0DB4 + 1
	.section .text.sub_80D10E0, "ax", %progbits
@ GameIntroIntelligentSystemsFadeIN @ JP 0x080D10E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GameIntroIntelligentSystemsFadeIN
	.thumb_func
GameIntroIntelligentSystemsFadeIN:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080D110A
	ldr r2, _080D113C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
_080D110A:
	ldr r3, [r4, #0x2c]
	adds r3, #1
	str r3, [r4, #0x2c]
	ldr r0, _080D1140 @ =0x08BAB604
	movs r1, #0x1e
	str r1, [sp]
	movs r1, #1
	movs r2, #3
	bl OpAnimHS_BrightenPalette
	ldr r0, [r4, #0x2c]
	cmp r0, #0x1d
	ble _080D112E
	movs r0, #0x3c
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_8002DE4
_080D112E:
	adds r0, r4, #0
	bl sub_80D0DB4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D113C: .4byte 0x03003020
_080D1140: .4byte 0x08BAB604

