	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_806F678, 0x0806F678 + 1
	.section .text.sub_806F63C, "ax", %progbits
@ sub_806F63C @ JP 0x0806F63C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F63C
	.thumb_func
sub_806F63C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0806F664 @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _0806F65E
	ldr r0, _0806F668 @ =0x0860366C
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_806F678
_0806F65E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F664: .4byte 0x0201774C
_0806F668: .4byte 0x0860366C

