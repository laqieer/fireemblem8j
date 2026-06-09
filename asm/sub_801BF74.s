	.syntax unified
	.set StartOrphanMenu, 0x0804F970 + 1
	.section .text.sub_801BF74, "ax", %progbits
@ sub_801BF74 @ JP 0x0801BF74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BF74
	.thumb_func
sub_801BF74:
	push {lr}
	ldr r0, _0801BF84 @ =0x085C54B4
	bl StartOrphanMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801BF84: .4byte 0x085C54B4

