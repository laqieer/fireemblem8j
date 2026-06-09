	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056120, 0x08056120 + 1
	.section .text.sub_807032C, "ax", %progbits
@ sub_807032C @ JP 0x0807032C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807032C
	.thumb_func
sub_807032C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8056120
	ldr r0, _08070348 @ =0x086038F4
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070348: .4byte 0x086038F4

