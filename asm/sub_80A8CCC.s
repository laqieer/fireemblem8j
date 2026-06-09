	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.section .text.sub_80A8CCC, "ax", %progbits
@ sub_80A8CCC @ JP 0x080A8CCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8CCC
	.thumb_func
sub_80A8CCC:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8CDC @ =0x0203ECF0
	movs r2, #0xc0
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A8CDC: .4byte 0x0203ECF0

