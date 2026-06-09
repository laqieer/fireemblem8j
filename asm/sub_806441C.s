	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806441C, "ax", %progbits
@ sub_806441C @ JP 0x0806441C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806441C
	.thumb_func
sub_806441C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08064460 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064464 @ =0x08601120
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08064468 @ =0x080E2FAE
	str r1, [r0, #0x48]
	ldr r1, _0806446C @ =0x08601138
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08064470 @ =0x086BAB34
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _08064474 @ =0x086BA2A8
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064460: .4byte 0x0201774C
_08064464: .4byte 0x08601120
_08064468: .4byte 0x080E2FAE
_0806446C: .4byte 0x08601138
_08064470: .4byte 0x086BAB34
_08064474: .4byte 0x086BA2A8

