	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8012BDC, "ax", %progbits
@ sub_8012BDC @ JP 0x08012BDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012BDC
	.thumb_func
sub_8012BDC:
	push {lr}
	ldr r0, _08012BF0 @ =0x085BA2FC
	bl Proc_Find
	cmp r0, #0
	beq _08012BEA
	movs r0, #1
_08012BEA:
	pop {r1}
	bx r1
	.align 2, 0
_08012BF0: .4byte 0x085BA2FC

