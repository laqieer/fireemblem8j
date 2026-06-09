	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806486C, "ax", %progbits
@ sub_806486C @ JP 0x0806486C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806486C
	.thumb_func
sub_806486C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080648A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080648A4 @ =0x08601204
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080648A8 @ =0x080E30FA
	str r1, [r0, #0x48]
	ldr r1, _080648AC @ =0x08753BCC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl sub_80567E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080648A0: .4byte 0x0201774C
_080648A4: .4byte 0x08601204
_080648A8: .4byte 0x080E30FA
_080648AC: .4byte 0x08753BCC

