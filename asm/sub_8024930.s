	.syntax unified
	.set sub_8037B04, 0x08037B04 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_8024930, "ax", %progbits
@ sub_8024930 @ JP 0x08024930 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024930
	.thumb_func
sub_8024930:
	push {r4, lr}
	ldr r1, _08024954 @ =0x0203A954
	movs r0, #0x22
	strb r0, [r1, #0x11]
	ldr r4, _08024958 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_8037B04
	bl sub_807B4B8
	ldr r0, [r4]
	bl sub_807A888
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024954: .4byte 0x0203A954
_08024958: .4byte 0x03004DF0

