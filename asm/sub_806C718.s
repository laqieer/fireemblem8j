	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806C718, "ax", %progbits
@ sub_806C718 @ JP 0x0806C718 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C718
	.thumb_func
sub_806C718:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806C75C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806C760 @ =0x08603314
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806C764 @ =0x080E43DC
	str r1, [r0, #0x48]
	ldr r1, _0806C768 @ =0x086032CC
	str r1, [r0, #0x4c]
	ldr r1, _0806C76C @ =0x086032F0
	str r1, [r0, #0x54]
	ldr r0, _0806C770 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806C784
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806C774
	movs r0, #1
	movs r1, #0x18
	b _0806C778
	.align 2, 0
_0806C75C: .4byte 0x0201774C
_0806C760: .4byte 0x08603314
_0806C764: .4byte 0x080E43DC
_0806C768: .4byte 0x086032CC
_0806C76C: .4byte 0x086032F0
_0806C770: .4byte 0x0203E11C
_0806C774:
	ldr r1, _0806C780 @ =0x0000FFE8
	movs r0, #1
_0806C778:
	movs r2, #0
	bl BG_SetPosition
	b _0806C78E
	.align 2, 0
_0806C780: .4byte 0x0000FFE8
_0806C784:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806C78E:
	ldr r0, _0806C79C @ =0x086E2604
	movs r1, #0x20
	bl sub_80567E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C79C: .4byte 0x086E2604

