	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8067D6C, "ax", %progbits
@ sub_8067D6C @ JP 0x08067D6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067D6C
	.thumb_func
sub_8067D6C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08067DB8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08067DBC @ =0x08601CF0
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08067DC0 @ =0x080E37E2
	str r1, [r0, #0x48]
	ldr r1, _08067DC4 @ =0x08601D08
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08067DC8 @ =0x086C0398
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08067DCC @ =0x086C119C
	movs r1, #0x20
	bl sub_80567E0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08067DB8: .4byte 0x0201774C
_08067DBC: .4byte 0x08601CF0
_08067DC0: .4byte 0x080E37E2
_08067DC4: .4byte 0x08601D08
_08067DC8: .4byte 0x086C0398
_08067DCC: .4byte 0x086C119C

