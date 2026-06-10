	.syntax unified
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_801BCA8, "ax", %progbits
@ sub_801BCA8 @ JP 0x0801BCA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BCA8
	.thumb_func
sub_801BCA8:
	push {lr}
	bl sub_804F610
	ldr r0, _0801BCBC @ =0x085C5490
	bl StartOrphanMenu
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_0801BCBC: .4byte 0x085C5490

