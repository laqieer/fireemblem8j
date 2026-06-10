	.syntax unified
	.set sub_80502F4, 0x080502F4 + 1
	.section .text.sub_8023088, "ax", %progbits
@ sub_8023088 @ JP 0x08023088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023088
	.thumb_func
sub_8023088:
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _080230A4
	ldr r1, _080230A0 @ =0x0203A954
	movs r0, #0x10
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _080230AE
	.align 2, 0
_080230A0: .4byte 0x0203A954
_080230A4:
	ldr r1, _080230B4 @ =0x000007CA
	adds r0, r2, #0
	bl sub_80502F4
	movs r0, #8
_080230AE:
	pop {r1}
	bx r1
	.align 2, 0
_080230B4: .4byte 0x000007CA

