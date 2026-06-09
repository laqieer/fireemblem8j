	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8013DA4, "ax", %progbits
@ sub_8013DA4 @ JP 0x08013DA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013DA4
	.thumb_func
sub_8013DA4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013DBC @ =0x085C24C8
	movs r1, #3
	bl sub_8002BCC
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013DBC: .4byte 0x085C24C8

