	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806FD38, "ax", %progbits
@ sub_806FD38 @ JP 0x0806FD38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FD38
	.thumb_func
sub_806FD38:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806FD74 @ =0x0860375C
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0806FD78 @ =0x086157DC
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _0806FD7C @ =0x0861589C
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, [r4, #0x5c]
	ldr r2, _0806FD80 @ =0x086158BC
	adds r1, r2, #0
	bl sub_805660C
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806FD74: .4byte 0x0860375C
_0806FD78: .4byte 0x086157DC
_0806FD7C: .4byte 0x0861589C
_0806FD80: .4byte 0x086158BC

