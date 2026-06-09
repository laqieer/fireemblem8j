	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8069904, "ax", %progbits
@ sub_8069904 @ JP 0x08069904 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069904
	.thumb_func
sub_8069904:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08069964 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08069968 @ =0x08602488
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806996C @ =0x080E3C70
	str r0, [r5, #0x48]
	ldr r0, _08069970 @ =0x086024EC
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08069974 @ =0x086024A0
	str r0, [r5, #0x54]
	ldr r0, _08069978 @ =0x086F44E4
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	ldr r0, _0806997C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806998A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069980
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0806998A
	.align 2, 0
_08069964: .4byte 0x0201774C
_08069968: .4byte 0x08602488
_0806996C: .4byte 0x080E3C70
_08069970: .4byte 0x086024EC
_08069974: .4byte 0x086024A0
_08069978: .4byte 0x086F44E4
_0806997C: .4byte 0x0203E11C
_08069980:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0806998A:
	pop {r4, r5}
	pop {r0}
	bx r0

