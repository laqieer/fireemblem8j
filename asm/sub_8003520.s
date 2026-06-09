	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8003520, "ax", %progbits
@ sub_8003520 @ JP 0x08003520 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003520
	.thumb_func
sub_8003520:
	push {lr}
	lsls r0, r0, #5
	ldr r2, _08003534 @ =0x085C1470
	adds r0, r0, r2
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_08003534: .4byte 0x085C1470

