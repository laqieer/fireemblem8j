	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8006DDC, "ax", %progbits
@ sub_8006DDC @ JP 0x08006DDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006DDC
	.thumb_func
sub_8006DDC:
	push {lr}
	ldr r0, _08006DF0 @ =0x085B9120
	bl Proc_Find
	cmp r0, #0
	beq _08006DEA
	movs r0, #1
_08006DEA:
	pop {r1}
	bx r1
	.align 2, 0
_08006DF0: .4byte 0x085B9120

