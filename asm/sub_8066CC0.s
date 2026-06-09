	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8066CC0, "ax", %progbits
@ sub_8066CC0 @ JP 0x08066CC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066CC0
	.thumb_func
sub_8066CC0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08066D0C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066D10 @ =0x08601978
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08066D14 @ =0x080E3592
	str r1, [r0, #0x48]
	ldr r1, _08066D18 @ =0x08601990
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08066D1C @ =0x08763B10
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08066D20 @ =0x08764488
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
_08066D0C: .4byte 0x0201774C
_08066D10: .4byte 0x08601978
_08066D14: .4byte 0x080E3592
_08066D18: .4byte 0x08601990
_08066D1C: .4byte 0x08763B10
_08066D20: .4byte 0x08764488

