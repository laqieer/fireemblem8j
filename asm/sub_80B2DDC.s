	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B2DDC, "ax", %progbits
@ sub_80B2DDC @ JP 0x080B2DDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2DDC
	.thumb_func
sub_80B2DDC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B2DFC @ =0x08A9DD0C
	movs r1, #4
	bl sub_8002BCC
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080B2E00 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2DFC: .4byte 0x08A9DD0C
_080B2E00: .4byte 0x0000FFFF

