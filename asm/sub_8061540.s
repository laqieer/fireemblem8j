	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8061540, "ax", %progbits
@ sub_8061540 @ JP 0x08061540 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061540
	.thumb_func
sub_8061540:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061594 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061598 @ =0x08600754
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0806159C @ =0x080E2646
	str r1, [r0, #0x48]
	ldr r1, _080615A0 @ =0x0860076C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080615A4 @ =0x086007D8
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _080615A8 @ =0x08663218
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	ldr r2, _080615AC @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061594: .4byte 0x0201774C
_08061598: .4byte 0x08600754
_0806159C: .4byte 0x080E2646
_080615A0: .4byte 0x0860076C
_080615A4: .4byte 0x086007D8
_080615A8: .4byte 0x08663218
_080615AC: .4byte 0x03003020

