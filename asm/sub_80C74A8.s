	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C74A8, "ax", %progbits
@ sub_80C74A8 @ JP 0x080C74A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C74A8
	.thumb_func
sub_80C74A8:
	push {lr}
	ldr r0, _080C74BC @ =0x08AC25A8
	bl Proc_Find
	cmp r0, #0
	beq _080C74B6
	movs r0, #1
_080C74B6:
	pop {r1}
	bx r1
	.align 2, 0
_080C74BC: .4byte 0x08AC25A8

