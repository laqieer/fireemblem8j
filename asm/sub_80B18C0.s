	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B18C0, "ax", %progbits
@ sub_80B18C0 @ JP 0x080B18C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B18C0
	.thumb_func
sub_80B18C0:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080B18D8 @ =0x08A9DB1C
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B18D8: .4byte 0x08A9DB1C

