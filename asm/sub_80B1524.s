	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B1524, "ax", %progbits
@ sub_80B1524 @ JP 0x080B1524 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1524
	.thumb_func
sub_80B1524:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B1540 @ =0x08A9DAB4
	bl Proc_Find
	cmp r0, #0
	beq _080B153A
	adds r0, #0x3c
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080B153A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1540: .4byte 0x08A9DAB4

