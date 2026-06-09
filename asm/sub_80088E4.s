	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80088E4, "ax", %progbits
@ sub_80088E4 @ JP 0x080088E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80088E4
	.thumb_func
sub_80088E4:
	push {lr}
	ldr r0, _080088F8 @ =0x085B8EEC
	bl Proc_Find
	cmp r0, #0
	beq _080088F2
	movs r0, #1
_080088F2:
	pop {r1}
	bx r1
	.align 2, 0
_080088F8: .4byte 0x085B8EEC

