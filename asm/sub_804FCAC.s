	.syntax unified
	.set sub_8002EE8, 0x08002EE8 + 1
	.section .text.sub_804FCAC, "ax", %progbits
@ sub_804FCAC @ JP 0x0804FCAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804FCAC
	.thumb_func
sub_804FCAC:
	push {lr}
	ldr r0, _0804FCBC @ =0x085E06B0
	ldr r1, _0804FCC0 @ =sub_804FC34
	bl sub_8002EE8
	pop {r0}
	bx r0
	.align 2, 0
_0804FCBC: .4byte 0x085E06B0
_0804FCC0: .4byte 0x0804FC35  @ sub_804FC34

