	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.section .text.sub_80A7814, "ax", %progbits
@ sub_80A7814 @ JP 0x080A7814 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7814
	.thumb_func
sub_80A7814:
	push {lr}
	ldr r1, _080A7824 @ =0x08A9CA20
	ldr r1, [r1]
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A7824: .4byte 0x08A9CA20

