	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C4514, "ax", %progbits
@ sub_80C4514 @ JP 0x080C4514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4514
	.thumb_func
sub_80C4514:
	push {lr}
	ldr r0, _080C4528 @ =0x08AC1F1C
	bl Proc_Find
	cmp r0, #0
	beq _080C4522
	movs r0, #1
_080C4522:
	pop {r1}
	bx r1
	.align 2, 0
_080C4528: .4byte 0x08AC1F1C

