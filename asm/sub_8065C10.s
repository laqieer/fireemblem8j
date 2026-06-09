	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8065C10, "ax", %progbits
@ sub_8065C10 @ JP 0x08065C10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065C10
	.thumb_func
sub_8065C10:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08065C44 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065C48 @ =0x08601690
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08065C4C @ =0x080E32F8
	str r1, [r0, #0x48]
	ldr r1, _08065C50 @ =0x0875CE7C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl sub_80567E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065C44: .4byte 0x0201774C
_08065C48: .4byte 0x08601690
_08065C4C: .4byte 0x080E32F8
_08065C50: .4byte 0x0875CE7C

