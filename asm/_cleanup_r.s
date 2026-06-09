	.syntax unified
	.set sub_80D9188, 0x080D9188 + 1
	.section .text._cleanup_r, "ax", %progbits
@ _cleanup_r @ JP 0x080D8C5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _cleanup_r
	.thumb_func
_cleanup_r:
	push {lr}
	ldr r1, _080D8C68 @ =sub_80D8AEC
	bl sub_80D9188
	pop {pc}
	.align 2, 0
_080D8C68: .4byte 0x080D8AED  @ sub_80D8AEC

