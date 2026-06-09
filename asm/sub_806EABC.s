	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806EABC, "ax", %progbits
@ sub_806EABC @ JP 0x0806EABC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EABC
	.thumb_func
sub_806EABC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806EAF8 @ =0x086033DC
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0806EAFC @ =0x08613C00
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _0806EB00 @ =0x08614CE0
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, [r4, #0x5c]
	ldr r1, _0806EB04 @ =0x08614EE0
	ldr r2, _0806EB08 @ =0x08615380
	bl sub_805660C
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EAF8: .4byte 0x086033DC
_0806EAFC: .4byte 0x08613C00
_0806EB00: .4byte 0x08614CE0
_0806EB04: .4byte 0x08614EE0
_0806EB08: .4byte 0x08615380

