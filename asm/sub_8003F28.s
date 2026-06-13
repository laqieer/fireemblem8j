	.syntax unified
	.set sub_8004400, 0x08004400 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.Text_DrawString, "ax", %progbits
@ Text_DrawString @ JP 0x08003F28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Text_DrawString
	.thumb_func
Text_DrawString:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _08003F40 @ =0x02028E70
	ldr r0, [r0]
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	beq _08003F8C
	adds r0, r6, #0
	bl sub_8004400
	b _08003F92
	.align 2, 0
_08003F40: .4byte 0x02028E70
_08003F44:
	ldrb r3, [r4]
	adds r4, #1
	cmp r3, #0x1f
	bls _08003F8C
	ldrb r2, [r4]
	adds r4, #1
	ldr r5, _08003F68 @ =0x02028E70
_08003F52:
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _08003F6C @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08003F8C
	b _08003F7C
	.align 2, 0
_08003F68: .4byte 0x02028E70
_08003F6C: .4byte 0xFFFFFF00
_08003F70:
	ldr r1, [r1]
	cmp r1, #0
	bne _08003F7C
	movs r3, #0x81
	movs r2, #0xa7
	b _08003F52
_08003F7C:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08003F70
	ldr r0, [r5]
	ldr r2, [r0, #8]
	adds r0, r6, #0
	bl sub_80D65C4
_08003F8C:
	ldrb r0, [r4]
	cmp r0, #1
	bhi _08003F44
_08003F92:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

