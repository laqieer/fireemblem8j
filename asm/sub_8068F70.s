	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8068F70, "ax", %progbits
@ sub_8068F70 @ JP 0x08068F70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068F70
	.thumb_func
sub_8068F70:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08068FA4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068FA8 @ =0x086023A8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x32]
	str r1, [r0, #0x44]
	ldr r1, _08068FAC @ =0x080E3A8E
	str r1, [r0, #0x48]
	ldr r1, _08068FB0 @ =0x088481AC
	str r1, [r0, #0x4c]
	ldr r0, _08068FB4 @ =0x08630728
	movs r1, #0x20
	bl sub_80567E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068FA4: .4byte 0x0201774C
_08068FA8: .4byte 0x086023A8
_08068FAC: .4byte 0x080E3A8E
_08068FB0: .4byte 0x088481AC
_08068FB4: .4byte 0x08630728

