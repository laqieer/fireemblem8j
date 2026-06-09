	.syntax unified
	.set InitTextInitInfo, 0x08003CDC + 1
	.section .text.sub_80890AC, "ax", %progbits
@ sub_80890AC @ JP 0x080890AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80890AC
	.thumb_func
sub_80890AC:
	push {lr}
	ldr r0, _080890B8 @ =0x08A727B4
	bl InitTextInitInfo
	pop {r0}
	bx r0
	.align 2, 0
_080890B8: .4byte 0x08A727B4

