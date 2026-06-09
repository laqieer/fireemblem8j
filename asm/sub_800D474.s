	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_800D474, "ax", %progbits
@ sub_800D474 @ JP 0x0800D474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D474
	.thumb_func
sub_800D474:
	push {lr}
	ldr r0, _0800D488 @ =0x085B98D8
	bl Proc_Find
	cmp r0, #0
	beq _0800D482
	movs r0, #1
_0800D482:
	pop {r1}
	bx r1
	.align 2, 0
_0800D488: .4byte 0x085B98D8

