	.syntax unified
	.set SetIRQHandler, 0x08000B50 + 1
	.section .text.sub_8001208, "ax", %progbits
@ sub_8001208 @ JP 0x08001208 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001208
	.thumb_func
sub_8001208:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08001234
	ldr r2, _0800122C @ =0x03003020
	ldrb r0, [r2, #4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #0
	adds r1, r3, #0
	bl SetIRQHandler
	ldr r2, _08001230 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	b _08001248
	.align 2, 0
_0800122C: .4byte 0x03003020
_08001230: .4byte 0x04000200
_08001234:
	ldr r2, _08001250 @ =0x03003020
	ldrb r1, [r2, #4]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #4]
	ldr r2, _08001254 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08001258 @ =0x0000FFFE
	ands r0, r1
_08001248:
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08001250: .4byte 0x03003020
_08001254: .4byte 0x04000200
_08001258: .4byte 0x0000FFFE

