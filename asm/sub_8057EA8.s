	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8057EA8, "ax", %progbits
@ sub_8057EA8 @ JP 0x08057EA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057EA8
	.thumb_func
sub_8057EA8:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08057ECC @ =0x085E3F74
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	cmp r4, #0
	bne _08057ED4
	ldr r2, _08057ED0 @ =0x0000FFA8
	movs r0, #2
	bl BG_SetPosition
	b _08057EDE
	.align 2, 0
_08057ECC: .4byte 0x085E3F74
_08057ED0: .4byte 0x0000FFA8
_08057ED4:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08057EDE:
	ldr r1, _08057EEC @ =0x0201FAD4
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057EEC: .4byte 0x0201FAD4

