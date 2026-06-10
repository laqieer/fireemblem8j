	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_800D45C, "ax", %progbits
@ sub_800D45C @ JP 0x0800D45C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D45C
	.thumb_func
sub_800D45C:
	push {lr}
	ldr r0, _0800D470 @ =0x085B98A0
	bl Proc_Find
	cmp r0, #0
	beq _0800D46A
	movs r0, #1
_0800D46A:
	pop {r1}
	bx r1
	.align 2, 0
_0800D470: .4byte 0x085B98A0

