	.syntax unified
	.set SetIRQHandler, 0x08000B50 + 1
	.section .text.sub_800125C, "ax", %progbits
@ sub_800125C @ JP 0x0800125C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800125C
	.thumb_func
sub_800125C:
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0800128C
	ldr r2, _08001284 @ =0x03003020
	ldrb r0, [r2, #4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #2
	adds r1, r4, #0
	bl SetIRQHandler
	ldr r2, _08001288 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	b _080012A4
	.align 2, 0
_08001284: .4byte 0x03003020
_08001288: .4byte 0x04000200
_0800128C:
	ldr r2, _080012AC @ =0x03003020
	ldrb r1, [r2, #4]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #4]
	ldr r3, _080012B0 @ =0x04000200
	ldrh r1, [r3]
	ldr r0, _080012B4 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r3]
	strb r4, [r2, #5]
_080012A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080012AC: .4byte 0x03003020
_080012B0: .4byte 0x04000200
_080012B4: .4byte 0x0000FFFB

