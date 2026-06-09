	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806D458, "ax", %progbits
@ sub_806D458 @ JP 0x0806D458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D458
	.thumb_func
sub_806D458:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806D49C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D4A0 @ =0x086030C8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806D4A4 @ =0x080E4274
	str r1, [r0, #0x48]
	ldr r1, _0806D4A8 @ =0x08603008
	str r1, [r0, #0x4c]
	ldr r1, _0806D4AC @ =0x08603048
	str r1, [r0, #0x54]
	ldr r1, _0806D4B0 @ =0x08603088
	str r1, [r0, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0806D4B4 @ =OnHBlank_0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D49C: .4byte 0x0201774C
_0806D4A0: .4byte 0x086030C8
_0806D4A4: .4byte 0x080E4274
_0806D4A8: .4byte 0x08603008
_0806D4AC: .4byte 0x08603048
_0806D4B0: .4byte 0x08603088
_0806D4B4: .4byte 0x0806D3AD  @ OnHBlank_0

