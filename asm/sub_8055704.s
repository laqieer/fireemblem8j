	.syntax unified
	.set EfxSplitColor, 0x080739D0 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8073A10, 0x08073A10 + 1
	.set sub_8073A68, 0x08073A68 + 1
	.section .text.sub_8055704, "ax", %progbits
@ sub_8055704 @ JP 0x08055704 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055704
	.thumb_func
sub_8055704:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805571C
	ldr r0, _08055718 @ =0x0203E184
	b _0805571E
	.align 2, 0
_08055718: .4byte 0x0203E184
_0805571C:
	ldr r0, _080557A4 @ =0x0203E188
_0805571E:
	ldr r6, [r0]
	ldr r0, _080557A8 @ =0x085E3C14
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	str r5, [r4, #0x5c]
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	ldr r0, _080557AC @ =0x080DFCC6
	str r0, [r4, #0x48]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	str r0, [r4, #0x4c]
	ldr r0, _080557B0 @ =0x0203E0F8
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _08055752
	str r1, [r4, #0x4c]
_08055752:
	str r1, [r4, #0x50]
	strh r1, [r4, #0x36]
	strh r1, [r4, #0x34]
	strh r1, [r4, #0x32]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r1, _080557B4 @ =0x0201776C
	lsls r0, r0, #2
	adds r0, r0, r1
	str r4, [r0]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080557C0
	ldr r5, _080557B8 @ =0x02000054
	ldr r0, [r5]
	ldr r4, _080557BC @ =0x020222A8
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl sub_8073A10
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl sub_8073A68
	b _080557F0
	.align 2, 0
_080557A4: .4byte 0x0203E188
_080557A8: .4byte 0x085E3C14
_080557AC: .4byte 0x080DFCC6
_080557B0: .4byte 0x0203E0F8
_080557B4: .4byte 0x0201776C
_080557B8: .4byte 0x02000054
_080557BC: .4byte 0x020222A8
_080557C0:
	ldr r5, _080557F8 @ =0x02000054
	ldr r0, [r5, #4]
	ldr r4, _080557FC @ =0x02022308
	adds r1, r4, #0
	movs r2, #0x10
	bl EfxSplitColor
	ldr r0, [r5, #4]
	adds r5, r4, #0
	adds r5, #0x30
	adds r1, r5, #0
	movs r2, #0x10
	bl sub_8073A10
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0x10
	bl sub_8073A68
_080557F0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080557F8: .4byte 0x02000054
_080557FC: .4byte 0x02022308

