	.syntax unified
	.section .text.strcmp, "ax", %progbits
@ strcmp @ JP 0x080DA36C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global strcmp
	.thumb_func
strcmp:
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	orrs r0, r3
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080DA3B2
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	bne _080DA3B2
	ldr r5, _080DA398 @ =0xFEFEFEFF
	ldr r4, _080DA39C @ =0x80808080
_080DA388:
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
	ands r0, r4
	cmp r0, #0
	beq _080DA3A0
	movs r0, #0
	b _080DA3C4
	.align 2, 0
_080DA398: .4byte 0xFEFEFEFF
_080DA39C: .4byte 0x80808080
_080DA3A0:
	adds r2, #4
	adds r3, #4
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	beq _080DA388
	b _080DA3B2
_080DA3AE:
	adds r2, #1
	adds r3, #1
_080DA3B2:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080DA3BE
	ldrb r1, [r3]
	cmp r0, r1
	beq _080DA3AE
_080DA3BE:
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r0, r2, r3
_080DA3C4:
	pop {r4, r5, pc}
	.align 2, 0

