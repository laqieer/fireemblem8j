	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C8FAC, "ax", %progbits
@ sub_80C8FAC @ JP 0x080C8FAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8FAC
	.thumb_func
sub_80C8FAC:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080C8FC4 @ =0x08B3B3D4
	adds r1, r2, #0
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8FC4: .4byte 0x08B3B3D4

