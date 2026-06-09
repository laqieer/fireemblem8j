	.syntax unified
	.set sub_80D9204, 0x080D9204 + 1
	.section .text.localeconv, "ax", %progbits
@ localeconv @ JP 0x080D9224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global localeconv
	.thumb_func
localeconv:
	push {lr}
	ldr r0, _080D9230 @ =0x08BB8A74
	ldr r0, [r0]
	bl sub_80D9204
	pop {pc}
	.align 2, 0
_080D9230: .4byte 0x08BB8A74

