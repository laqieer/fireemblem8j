	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_809A7EC, "ax", %progbits
@ sub_809A7EC @ JP 0x0809A7EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A7EC
	.thumb_func
sub_809A7EC:
	push {lr}
	ldr r0, _0809A800 @ =0x085E0D94
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_0809A800: .4byte 0x085E0D94

