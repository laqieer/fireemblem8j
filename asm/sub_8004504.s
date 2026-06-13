	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.SpriteText_DrawBackground, "ax", %progbits
@ SpriteText_DrawBackground @ JP 0x08004504 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SpriteText_DrawBackground
	.thumb_func
SpriteText_DrawBackground:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _0800454E
	movs r0, #0
	strb r0, [r7, #2]
	ldr r4, _08004558 @ =0x44444444
	str r4, [sp]
	ldr r5, _0800455C @ =0x02028E70
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl sub_80D65C0
	adds r1, r0, #0
	ldr r6, _08004560 @ =0x010000D8
	mov r0, sp
	adds r2, r6, #0
	bl sub_80D636C
	str r4, [sp, #4]
	add r4, sp, #4
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl sub_80D65C0
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r6, #0
	bl sub_80D636C
_0800454E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004558: .4byte 0x44444444
_0800455C: .4byte 0x02028E70
_08004560: .4byte 0x010000D8

