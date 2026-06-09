	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80CA350, "ax", %progbits
@ sub_80CA350 @ JP 0x080CA350 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA350
	.thumb_func
sub_80CA350:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080CA370 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080CA36A
	ldr r0, [r2, #0x14]
	movs r1, #3
	bl Proc_Goto
_080CA36A:
	pop {r0}
	bx r0
	.align 2, 0
_080CA370: .4byte 0x085775CC

