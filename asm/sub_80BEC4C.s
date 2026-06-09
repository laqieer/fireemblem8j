	.syntax unified
	.set WmMergeMonsters, 0x080C6898 + 1
	.section .text.sub_80BEC4C, "ax", %progbits
@ sub_80BEC4C @ JP 0x080BEC4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEC4C
	.thumb_func
sub_80BEC4C:
	push {lr}
	bl WmMergeMonsters
	pop {r0}
	bx r0
	.align 2, 0

