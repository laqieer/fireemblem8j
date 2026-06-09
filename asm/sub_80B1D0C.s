	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B1D0C, "ax", %progbits
@ sub_80B1D0C @ JP 0x080B1D0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1D0C
	.thumb_func
sub_80B1D0C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B1D28 @ =0x08A9DB3C
	bl Proc_Find
	cmp r0, #0
	beq _080B1D22
	adds r0, #0x4a
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080B1D22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D28: .4byte 0x08A9DB3C

