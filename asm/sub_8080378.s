	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_8080378, "ax", %progbits
@ sub_8080378 @ JP 0x08080378 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080378
	.thumb_func
sub_8080378:
	push {lr}
	ldr r1, [r0, #0x30]
	movs r0, #0x82
	bl sub_8014B50
	ldr r0, _08080390 @ =0x086A817C
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_08080390: .4byte 0x086A817C

