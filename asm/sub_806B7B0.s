	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_806B7B0, "ax", %progbits
@ sub_806B7B0 @ JP 0x0806B7B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B7B0
	.thumb_func
sub_806B7B0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806B7F8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B7FC @ =0x08602AD4
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806B800 @ =0x080E40F6
	str r1, [r0, #0x48]
	ldr r1, _0806B804 @ =0x08602A08
	str r1, [r0, #0x4c]
	ldr r1, _0806B808 @ =0x08602A48
	str r1, [r0, #0x54]
	ldr r1, _0806B80C @ =0x08602A88
	str r1, [r0, #0x58]
	ldr r0, _0806B810 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806B820
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B814
	movs r0, #1
	movs r1, #0x28
	b _0806B82E
	.align 2, 0
_0806B7F8: .4byte 0x0201774C
_0806B7FC: .4byte 0x08602AD4
_0806B800: .4byte 0x080E40F6
_0806B804: .4byte 0x08602A08
_0806B808: .4byte 0x08602A48
_0806B80C: .4byte 0x08602A88
_0806B810: .4byte 0x0203E11C
_0806B814:
	ldr r1, _0806B81C @ =0x0000FFE8
	movs r0, #1
	b _0806B82E
	.align 2, 0
_0806B81C: .4byte 0x0000FFE8
_0806B820:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B836
	movs r0, #1
	movs r1, #0x10
_0806B82E:
	movs r2, #0
	bl BG_SetPosition
	b _0806B840
_0806B836:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806B840:
	bl sub_8056158
	movs r0, #0
	bl SetBlendBackdropB
	pop {r4}
	pop {r0}
	bx r0

