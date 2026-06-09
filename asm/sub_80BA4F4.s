	.syntax unified
	.set sub_802C134, 0x0802C134 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AB0C, 0x0807AB0C + 1
	.section .text.sub_80BA4F4, "ax", %progbits
@ sub_80BA4F4 @ JP 0x080BA4F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA4F4
	.thumb_func
sub_80BA4F4:
	push {lr}
	ldr r0, _080BA510 @ =0x0203A8EC
	ldr r0, [r0]
	ldr r1, _080BA514 @ =0x0203A4E8
	bl sub_802C134
	ldr r0, _080BA518 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_807A888
	bl sub_807AB0C
	pop {r0}
	bx r0
	.align 2, 0
_080BA510: .4byte 0x0203A8EC
_080BA514: .4byte 0x0203A4E8
_080BA518: .4byte 0x03004DF0

