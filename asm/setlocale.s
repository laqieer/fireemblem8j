	.syntax unified
	.set _setlocale_r, 0x080D91C8 + 1
	.section .text.setlocale, "ax", %progbits
@ setlocale @ JP 0x080D920C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global setlocale
	.thumb_func
setlocale:
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _080D9220 @ =0x08BB8A74
	ldr r0, [r0]
	adds r1, r3, #0
	bl _setlocale_r
	pop {pc}
	.align 2, 0
_080D9220: .4byte 0x08BB8A74

