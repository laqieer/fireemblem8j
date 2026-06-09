	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806C38C, "ax", %progbits
@ sub_806C38C @ JP 0x0806C38C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C38C
	.thumb_func
sub_806C38C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806C3D4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806C3D8 @ =0x08602DFC
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0806C3DC @ =0x080E41BE
	str r1, [r0, #0x48]
	ldr r1, _0806C3E0 @ =0x08602DCC
	str r1, [r0, #0x4c]
	ldr r1, _0806C3E4 @ =0x08602DDC
	str r1, [r0, #0x54]
	ldr r0, _0806C3E8 @ =0x086E93FC
	movs r1, #0x20
	bl sub_80567E0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0806C3EC @ =OnHBlank_0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C3D4: .4byte 0x0201774C
_0806C3D8: .4byte 0x08602DFC
_0806C3DC: .4byte 0x080E41BE
_0806C3E0: .4byte 0x08602DCC
_0806C3E4: .4byte 0x08602DDC
_0806C3E8: .4byte 0x086E93FC
_0806C3EC: .4byte 0x0806D3AD  @ OnHBlank_0

