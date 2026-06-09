	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806D50C, "ax", %progbits
@ sub_806D50C @ JP 0x0806D50C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D50C
	.thumb_func
sub_806D50C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806D558 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D55C @ =0x0860310C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806D560 @ =0x080E42CC
	str r1, [r0, #0x48]
	ldr r1, _0806D564 @ =0x086030E8
	str r1, [r0, #0x4c]
	ldr r0, _0806D568 @ =0x08714A88
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _0806D56C @ =0x08715D90
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
_0806D558: .4byte 0x0201774C
_0806D55C: .4byte 0x0860310C
_0806D560: .4byte 0x080E42CC
_0806D564: .4byte 0x086030E8
_0806D568: .4byte 0x08714A88
_0806D56C: .4byte 0x08715D90

