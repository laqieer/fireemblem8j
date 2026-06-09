	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80BEEE8, "ax", %progbits
@ sub_80BEEE8 @ JP 0x080BEEE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEEE8
	.thumb_func
sub_80BEEE8:
	push {lr}
	ldr r0, _080BEEFC @ =0x08AC1108
	bl Proc_Find
	cmp r0, #0
	beq _080BEEF6
	movs r0, #1
_080BEEF6:
	pop {r1}
	bx r1
	.align 2, 0
_080BEEFC: .4byte 0x08AC1108

