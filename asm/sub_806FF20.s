	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806FF20, "ax", %progbits
@ sub_806FF20 @ JP 0x0806FF20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FF20
	.thumb_func
sub_806FF20:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806FFA0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806FFA4 @ =0x086038AC
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0806FFA8 @ =0x080E47F0
	str r1, [r0, #0x48]
	ldr r1, _0806FFAC @ =0x086038C4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0806FFB0 @ =0x0861D9DC
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _0806FFB4 @ =0x0861CD68
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056158
	ldr r3, _0806FFB8 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806FFA0: .4byte 0x0201774C
_0806FFA4: .4byte 0x086038AC
_0806FFA8: .4byte 0x080E47F0
_0806FFAC: .4byte 0x086038C4
_0806FFB0: .4byte 0x0861D9DC
_0806FFB4: .4byte 0x0861CD68
_0806FFB8: .4byte 0x03003020

