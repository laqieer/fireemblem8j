	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.Text_DrawCharacterAscii, "ax", %progbits
@ Text_DrawCharacterAscii @ JP 0x0800443C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Text_DrawCharacterAscii
	.thumb_func
Text_DrawCharacterAscii:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0800446C @ =0x02028E70
	ldr r3, [r0]
	ldrb r0, [r4]
	ldr r2, [r3, #4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _0800445C
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_0800445C:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl sub_80D65C4
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800446C: .4byte 0x02028E70

