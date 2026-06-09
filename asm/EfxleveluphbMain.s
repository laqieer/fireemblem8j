	.syntax unified
	.section .text.EfxleveluphbMain, "ax", %progbits
@ EfxleveluphbMain @ JP 0x08076BDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxleveluphbMain
	.thumb_func
EfxleveluphbMain:
	push {lr}
	ldr r0, _08076C00 @ =0x0202BCAC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _08076C04 @ =0x0201FB30
	ldr r2, _08076C08 @ =0x0201FDBC
	cmp r0, #0
	beq _08076C4C
	ldr r1, _08076C0C @ =0x0201FB2C
	ldr r0, [r1]
	cmp r0, #1
	bne _08076C14
	movs r0, #0
	str r0, [r1]
	ldr r0, _08076C10 @ =0x0201FB38
	b _08076C1A
	.align 2, 0
_08076C00: .4byte 0x0202BCAC
_08076C04: .4byte 0x0201FB30
_08076C08: .4byte 0x0201FDBC
_08076C0C: .4byte 0x0201FB2C
_08076C10: .4byte 0x0201FB38
_08076C14:
	movs r0, #1
	str r0, [r1]
	ldr r0, _08076C30 @ =0x0201FC78
_08076C1A:
	str r0, [r3]
	ldr r1, _08076C34 @ =0x0201FDB8
	ldr r0, [r1]
	cmp r0, #1
	bne _08076C40
	movs r0, #0
	str r0, [r1]
	ldr r1, _08076C38 @ =0x0201FDBC
	ldr r0, _08076C3C @ =0x0201FDC4
	b _08076C48
	.align 2, 0
_08076C30: .4byte 0x0201FC78
_08076C34: .4byte 0x0201FDB8
_08076C38: .4byte 0x0201FDBC
_08076C3C: .4byte 0x0201FDC4
_08076C40:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08076C5C @ =0x0201FDBC
	ldr r0, _08076C60 @ =0x0201FF04
_08076C48:
	str r0, [r1]
	adds r2, r1, #0
_08076C4C:
	ldr r1, _08076C64 @ =0x0201FB34
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _08076C68 @ =0x0201FDC0
	ldr r0, [r2]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08076C5C: .4byte 0x0201FDBC
_08076C60: .4byte 0x0201FF04
_08076C64: .4byte 0x0201FB34
_08076C68: .4byte 0x0201FDC0

