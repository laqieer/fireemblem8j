	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C1490, "ax", %progbits
@ sub_80C1490 @ JP 0x080C1490 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1490
	.thumb_func
sub_80C1490:
	push {lr}
	ldr r0, _080C14AC @ =0x03005270
	adds r0, #0xcd
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080C14B0 @ =0x08AC1108
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	movs r0, #0x1b
	pop {r1}
	bx r1
	.align 2, 0
_080C14AC: .4byte 0x03005270
_080C14B0: .4byte 0x08AC1108

