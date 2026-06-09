	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C4FF4, "ax", %progbits
@ sub_80C4FF4 @ JP 0x080C4FF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4FF4
	.thumb_func
sub_80C4FF4:
	push {lr}
	ldr r0, _080C5008 @ =0x08AC1FE4
	bl Proc_Find
	cmp r0, #0
	beq _080C5002
	movs r0, #1
_080C5002:
	pop {r1}
	bx r1
	.align 2, 0
_080C5008: .4byte 0x08AC1FE4

