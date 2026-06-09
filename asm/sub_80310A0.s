	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AB0C, 0x0807AB0C + 1
	.section .text.sub_80310A0, "ax", %progbits
@ sub_80310A0 @ JP 0x080310A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80310A0
	.thumb_func
sub_80310A0:
	push {lr}
	bl sub_801569C
	ldr r0, _080310BC @ =0x0203A4E8
	bl sub_807A888
	bl sub_807AB0C
	ldr r0, _080310C0 @ =0x085C5EC4
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080310BC: .4byte 0x0203A4E8
_080310C0: .4byte 0x085C5EC4

