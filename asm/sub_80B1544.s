	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B1544, "ax", %progbits
@ sub_80B1544 @ JP 0x080B1544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1544
	.thumb_func
sub_80B1544:
	push {lr}
	ldr r0, _080B1564 @ =0x08A9DAB4
	bl Proc_Find
	cmp r0, #0
	beq _080B1560
	adds r1, r0, #0
	adds r1, #0x3c
	movs r2, #0
	adds r0, #0x43
_080B1558:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080B1558
_080B1560:
	pop {r0}
	bx r0
	.align 2, 0
_080B1564: .4byte 0x08A9DAB4

