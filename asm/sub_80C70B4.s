	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C2BAC, 0x080C2BAC + 1
	.section .text.sub_80C70B4, "ax", %progbits
@ sub_80C70B4 @ JP 0x080C70B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C70B4
	.thumb_func
sub_80C70B4:
	push {lr}
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C70D0
	ldr r0, _080C70D4 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	movs r1, #0
	bl sub_80C2BAC
_080C70D0:
	pop {r0}
	bx r0
	.align 2, 0
_080C70D4: .4byte 0x08AC1108

