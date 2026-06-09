	.syntax unified
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_80036D8, 0x080036D8 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_804FC34, 0x0804FC34 + 1
	.section .text.sub_801B7E8, "ax", %progbits
@ sub_801B7E8 @ JP 0x0801B7E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B7E8
	.thumb_func
sub_801B7E8:
	push {lr}
	bl sub_804FC34
	bl sub_804F610
	ldr r0, _0801B808 @ =0x085C5520
	bl StartOrphanMenu
	movs r0, #2
	movs r1, #0
	bl sub_80036D8
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0801B808: .4byte 0x085C5520

