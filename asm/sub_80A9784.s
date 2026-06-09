	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.section .text.sub_80A9784, "ax", %progbits
@ sub_80A9784 @ JP 0x080A9784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9784
	.thumb_func
sub_80A9784:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A9798 @ =0x0203EDB0
	ldr r2, _080A979C @ =0x00000D88
	adds r1, r1, r2
	movs r2, #4
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A9798: .4byte 0x0203EDB0
_080A979C: .4byte 0x00000D88

