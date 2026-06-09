	.syntax unified
	.set sub_8037ACC, 0x08037ACC + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_80248D0, "ax", %progbits
@ sub_80248D0 @ JP 0x080248D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80248D0
	.thumb_func
sub_80248D0:
	push {r4, lr}
	ldr r1, _080248F4 @ =0x0203A954
	movs r0, #0x21
	strb r0, [r1, #0x11]
	ldr r4, _080248F8 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_8037ACC
	bl sub_807B4B8
	ldr r0, [r4]
	bl sub_807A888
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080248F4: .4byte 0x0203A954
_080248F8: .4byte 0x03004DF0

