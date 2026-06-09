	.syntax unified
	.set StartOrphanMenu, 0x0804F970 + 1
	.section .text.sub_801BF60, "ax", %progbits
@ sub_801BF60 @ JP 0x0801BF60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BF60
	.thumb_func
sub_801BF60:
	push {lr}
	ldr r0, _0801BF70 @ =0x085C54FC
	bl StartOrphanMenu
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0801BF70: .4byte 0x085C54FC

