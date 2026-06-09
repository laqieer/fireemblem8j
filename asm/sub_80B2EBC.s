	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B2EBC, "ax", %progbits
@ sub_80B2EBC @ JP 0x080B2EBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2EBC
	.thumb_func
sub_80B2EBC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B2EDC @ =0x08A9DD0C
	movs r1, #4
	bl sub_8002BCC
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080B2EE0 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2EDC: .4byte 0x08A9DD0C
_080B2EE0: .4byte 0x0000FFFF

