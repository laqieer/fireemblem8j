	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8098994, "ax", %progbits
@ sub_8098994 @ JP 0x08098994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098994
	.thumb_func
sub_8098994:
	push {lr}
	ldr r0, _080989A8 @ =0x08A93FE8
	bl Proc_Find
	cmp r0, #0
	beq _080989A2
	movs r0, #1
_080989A2:
	pop {r1}
	bx r1
	.align 2, 0
_080989A8: .4byte 0x08A93FE8

