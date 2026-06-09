	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80615B0, "ax", %progbits
@ sub_80615B0 @ JP 0x080615B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80615B0
	.thumb_func
sub_80615B0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080615FC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061600 @ =0x08600754
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08061604 @ =0x080E264C
	str r1, [r0, #0x48]
	ldr r1, _08061608 @ =0x0860076C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806160C @ =0x086007D8
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08061610 @ =0x0867B368
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	movs r0, #1
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl SetBlendConfig
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080615FC: .4byte 0x0201774C
_08061600: .4byte 0x08600754
_08061604: .4byte 0x080E264C
_08061608: .4byte 0x0860076C
_0806160C: .4byte 0x086007D8
_08061610: .4byte 0x0867B368

