	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C7290, "ax", %progbits
@ sub_80C7290 @ JP 0x080C7290 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7290
	.thumb_func
sub_80C7290:
	push {lr}
	ldr r0, _080C72AC @ =0x08AC2510
	bl Proc_Find
	cmp r0, #0
	beq _080C72A8
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
_080C72A8:
	pop {r0}
	bx r0
	.align 2, 0
_080C72AC: .4byte 0x08AC2510

