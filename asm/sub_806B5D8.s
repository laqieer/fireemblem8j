	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806B5D8, "ax", %progbits
@ sub_806B5D8 @ JP 0x0806B5D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B5D8
	.thumb_func
sub_806B5D8:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806B634 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _0806B638 @ =0x0201FB28
	movs r0, #0x10
	str r0, [r1]
	ldr r0, _0806B63C @ =0x086029F0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806B640 @ =0x080E40B8
	str r0, [r5, #0x48]
	ldr r0, _0806B644 @ =0x08602998
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806B648 @ =0x086029C4
	str r0, [r5, #0x54]
	ldr r0, _0806B64C @ =0x086D32B0
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _0806B650 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806B66C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B658
	ldr r2, _0806B654 @ =0x0000FFF0
	movs r0, #1
	movs r1, #0x18
	bl BG_SetPosition
	b _0806B676
	.align 2, 0
_0806B634: .4byte 0x0201774C
_0806B638: .4byte 0x0201FB28
_0806B63C: .4byte 0x086029F0
_0806B640: .4byte 0x080E40B8
_0806B644: .4byte 0x08602998
_0806B648: .4byte 0x086029C4
_0806B64C: .4byte 0x086D32B0
_0806B650: .4byte 0x0203E11C
_0806B654: .4byte 0x0000FFF0
_0806B658:
	ldr r1, _0806B664 @ =0x0000FFE8
	ldr r2, _0806B668 @ =0x0000FFF0
	movs r0, #1
	bl BG_SetPosition
	b _0806B676
	.align 2, 0
_0806B664: .4byte 0x0000FFE8
_0806B668: .4byte 0x0000FFF0
_0806B66C:
	ldr r2, _0806B680 @ =0x0000FFF0
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
_0806B676:
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B680: .4byte 0x0000FFF0

