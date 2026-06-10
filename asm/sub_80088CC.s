	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80088CC, "ax", %progbits
@ sub_80088CC @ JP 0x080088CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80088CC
	.thumb_func
sub_80088CC:
	push {lr}
	ldr r0, _080088E0 @ =0x085B90F0
	bl Proc_Find
	cmp r0, #0
	beq _080088DA
	movs r0, #1
_080088DA:
	pop {r1}
	bx r1
	.align 2, 0
_080088E0: .4byte 0x085B90F0

