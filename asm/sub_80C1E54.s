	.syntax unified
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.section .text.sub_80C1E54, "ax", %progbits
@ sub_80C1E54 @ JP 0x080C1E54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1E54
	.thumb_func
sub_80C1E54:
	push {lr}
	ldr r0, _080C1E68 @ =0x03005270
	bl GetNextUnclearedNode
	cmp r0, #0
	blt _080C1E6C
	bl WMLoc_GetChapterId
	b _080C1E70
	.align 2, 0
_080C1E68: .4byte 0x03005270
_080C1E6C:
	movs r0, #1
	rsbs r0, r0, #0
_080C1E70:
	pop {r1}
	bx r1

