	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_8068B84, "ax", %progbits
@ sub_8068B84 @ JP 0x08068B84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068B84
	.thumb_func
sub_8068B84:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08068BC8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068BCC @ =0x086021DC
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08068BD0 @ =0x080E39EC
	str r1, [r0, #0x48]
	ldr r1, _08068BD4 @ =0x086021F4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08068BD8 @ =0x08602200
	str r1, [r0, #0x54]
	ldr r1, _08068BDC @ =0x0860220C
	str r1, [r0, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068BC8: .4byte 0x0201774C
_08068BCC: .4byte 0x086021DC
_08068BD0: .4byte 0x080E39EC
_08068BD4: .4byte 0x086021F4
_08068BD8: .4byte 0x08602200
_08068BDC: .4byte 0x0860220C

