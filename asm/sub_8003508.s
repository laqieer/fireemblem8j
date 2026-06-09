	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8003508, "ax", %progbits
@ sub_8003508 @ JP 0x08003508 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003508
	.thumb_func
sub_8003508:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0800351C @ =0x085C1470
	lsls r1, r1, #5
	movs r2, #0x40
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_0800351C: .4byte 0x085C1470

