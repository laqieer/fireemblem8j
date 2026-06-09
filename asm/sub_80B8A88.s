	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B8A88, "ax", %progbits
@ sub_80B8A88 @ JP 0x080B8A88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8A88
	.thumb_func
sub_80B8A88:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B8AA4 @ =0x08AAFDEC
	adds r1, r4, #0
	bl sub_8002BCC
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B8AA4: .4byte 0x08AAFDEC

