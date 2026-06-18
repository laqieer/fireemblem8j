	.syntax unified
	.set GetGMapBaseMenuKind, 0x080C8E28 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_809AD4C, "ax", %progbits
@ PutWmItemScreenPromptText @ JP 0x0809AD4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutWmItemScreenPromptText
	.thumb_func
PutWmItemScreenPromptText:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	movs r2, #8
	movs r3, #0
	bl j_TmFillRect
	ldr r4, _0809AD88 @ =0x02013560
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	adds r0, #8
	bl sub_8003CF8
	adds r4, #0x10
	adds r0, r4, #0
	bl sub_8003CF8
	bl GetGMapBaseMenuKind
	cmp r0, #1
	beq _0809ADA0
	cmp r0, #1
	bgt _0809AD8C
	cmp r0, #0
	beq _0809AD96
	b _0809ADB2
	.align 2, 0
_0809AD88: .4byte 0x02013560
_0809AD8C:
	cmp r0, #2
	beq _0809ADA8
	cmp r0, #3
	beq _0809ADB0
	b _0809ADB2
_0809AD96:
	ldr r5, _0809AD9C @ =0x00000604
	b _0809ADB2
	.align 2, 0
_0809AD9C: .4byte 0x00000604
_0809ADA0:
	ldr r5, _0809ADA4 @ =0x00000605
	b _0809ADB2
	.align 2, 0
_0809ADA4: .4byte 0x00000605
_0809ADA8:
	ldr r5, _0809ADAC @ =0x00000606
	b _0809ADB2
	.align 2, 0
_0809ADAC: .4byte 0x00000606
_0809ADB0:
	ldr r5, _0809AE10 @ =0x00000607
_0809ADB2:
	adds r0, r5, #0
	bl sub_8009FA8
	ldr r4, _0809AE14 @ =0x02013560
	adds r1, r6, #0
	adds r1, #0x82
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809AE18 @ =0x0000050E
	bl sub_8009FA8
	adds r2, r4, #0
	adds r2, #8
	movs r3, #0x81
	lsls r3, r3, #1
	adds r1, r6, r3
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809AE1C @ =0x0000050F
	bl sub_8009FA8
	adds r4, #0x10
	movs r2, #0xc1
	lsls r2, r2, #1
	adds r1, r6, r2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AE10: .4byte 0x00000607
_0809AE14: .4byte 0x02013560
_0809AE18: .4byte 0x0000050E
_0809AE1C: .4byte 0x0000050F

