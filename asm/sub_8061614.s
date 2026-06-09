	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8061614, "ax", %progbits
@ sub_8061614 @ JP 0x08061614 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061614
	.thumb_func
sub_8061614:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061654 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061658 @ =0x08600754
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0806165C @ =0x080E26EE
	str r1, [r0, #0x48]
	ldr r1, _08061660 @ =0x0860076C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08061664 @ =0x086007D8
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08061668 @ =0x0867B388
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061654: .4byte 0x0201774C
_08061658: .4byte 0x08600754
_0806165C: .4byte 0x080E26EE
_08061660: .4byte 0x0860076C
_08061664: .4byte 0x086007D8
_08061668: .4byte 0x0867B388

