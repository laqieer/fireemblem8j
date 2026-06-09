	.syntax unified
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_80801B0, "ax", %progbits
@ sub_80801B0 @ JP 0x080801B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80801B0
	.thumb_func
sub_80801B0:
	push {lr}
	ldr r1, [r0, #0x30]
	movs r0, #0x86
	bl sub_8014B50
	pop {r0}
	bx r0
	.align 2, 0

