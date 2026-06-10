	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8033518, "ax", %progbits
@ sub_8033518 @ JP 0x08033518 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033518
	.thumb_func
sub_8033518:
	push {lr}
	ldr r0, _0803352C @ =0x08A97BEC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_0803352C: .4byte 0x08A97BEC

