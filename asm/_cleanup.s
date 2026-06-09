	.syntax unified
	.set _cleanup_r, 0x080D8C5C + 1
	.section .text._cleanup, "ax", %progbits
@ _cleanup @ JP 0x080D8C6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _cleanup
	.thumb_func
_cleanup:
	push {lr}
	ldr r0, _080D8C78 @ =0x08BB8A74
	ldr r0, [r0]
	bl _cleanup_r
	pop {pc}
	.align 2, 0
_080D8C78: .4byte 0x08BB8A74

