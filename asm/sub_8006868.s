	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8006868, "ax", %progbits
@ sub_8006868 @ JP 0x08006868 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006868
	.thumb_func
sub_8006868:
	push {lr}
	ldr r0, _08006878 @ =0x085C7420
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_08006878: .4byte 0x085C7420

