	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_807A548, "ax", %progbits
@ sub_807A548 @ JP 0x0807A548 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A548
	.thumb_func
sub_807A548:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807A560 @ =0x08855DD8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A560: .4byte 0x08855DD8

