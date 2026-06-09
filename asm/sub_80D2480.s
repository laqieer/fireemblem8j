	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EndPrepScreenSpriteDraw, 0x08098F04 + 1
	.set sub_80096B0, 0x080096B0 + 1
	.set sub_8010F98, 0x08010F98 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.section .text.sub_80D2480, "ax", %progbits
@ sub_80D2480 @ JP 0x080D2480 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2480
	.thumb_func
sub_80D2480:
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x29
	movs r1, #0xff
	strb r1, [r0]
	bl sub_8010F98
	bl EndPrepScreenSpriteDraw
	bl sub_80096B0
	bl sub_8097D18
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #4
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #8
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _080D24E8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080D24E8: .4byte 0x03003020

