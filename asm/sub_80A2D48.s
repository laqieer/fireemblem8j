	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.section .text.sub_80A2D48, "ax", %progbits
@ sub_80A2D48 @ JP 0x080A2D48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2D48
	.thumb_func
sub_80A2D48:
	push {r4, lr}
	ldr r4, _080A2DEC @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl sub_8001ACC
	movs r0, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrb r1, [r4, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetFaces
	bl ResetText
	bl sub_80034C4
	bl sub_804F8F4
	bl sub_801569C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #4
	bl sub_8003508
	bl sub_8097CFC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2DEC: .4byte 0x03003020

