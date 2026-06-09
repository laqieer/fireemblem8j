	.syntax unified
	.set sub_80502F4, 0x080502F4 + 1
	.set sub_80BA8C0, 0x080BA8C0 + 1
	.section .text.sub_802259C, "ax", %progbits
@ sub_802259C @ JP 0x0802259C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802259C
	.thumb_func
sub_802259C:
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _080225B0
	bl sub_80BA8C0
	movs r0, #0x17
	b _080225BA
_080225B0:
	ldr r1, _080225C0 @ =0x000007E2
	adds r0, r2, #0
	bl sub_80502F4
	movs r0, #8
_080225BA:
	pop {r1}
	bx r1
	.align 2, 0
_080225C0: .4byte 0x000007E2

