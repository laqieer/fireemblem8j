	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C55EC, "ax", %progbits
@ sub_80C55EC @ JP 0x080C55EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C55EC
	.thumb_func
sub_80C55EC:
	push {lr}
	ldr r0, _080C5600 @ =0x08AC20A4
	bl Proc_Find
	cmp r0, #0
	beq _080C55FA
	movs r0, #1
_080C55FA:
	pop {r1}
	bx r1
	.align 2, 0
_080C5600: .4byte 0x08AC20A4

