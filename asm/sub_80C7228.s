	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C7228, "ax", %progbits
@ sub_80C7228 @ JP 0x080C7228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7228
	.thumb_func
sub_80C7228:
	push {lr}
	ldr r0, _080C723C @ =0x08AC2510
	bl Proc_Find
	cmp r0, #0
	beq _080C7236
	movs r0, #1
_080C7236:
	pop {r1}
	bx r1
	.align 2, 0
_080C723C: .4byte 0x08AC2510

