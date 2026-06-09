	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806EC28, "ax", %progbits
@ sub_806EC28 @ JP 0x0806EC28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EC28
	.thumb_func
sub_806EC28:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806EC88 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806EC8C @ =0x0860342C
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806EC90 @ =0x080E44EA
	str r0, [r5, #0x48]
	ldr r0, _0806EC94 @ =0x08603444
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806EC98 @ =0x08615D28
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _0806EC9C @ =0x08615960
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056158
	ldr r0, _0806ECA0 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806ECAE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806ECA4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806ECAE
	.align 2, 0
_0806EC88: .4byte 0x0201774C
_0806EC8C: .4byte 0x0860342C
_0806EC90: .4byte 0x080E44EA
_0806EC94: .4byte 0x08603444
_0806EC98: .4byte 0x08615D28
_0806EC9C: .4byte 0x08615960
_0806ECA0: .4byte 0x0203E11C
_0806ECA4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806ECAE:
	pop {r4, r5}
	pop {r0}
	bx r0

