	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_804A584, "ax", %progbits
@ sub_804A584 @ JP 0x0804A584 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A584
	.thumb_func
sub_804A584:
	push {lr}
	ldr r0, _0804A594 @ =0x085D7C6C
	ldr r1, _0804A598 @ =0x06013E00
	bl sub_8013008
	pop {r0}
	bx r0
	.align 2, 0
_0804A594: .4byte 0x085D7C6C
_0804A598: .4byte 0x06013E00

