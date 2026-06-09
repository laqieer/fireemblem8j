	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80503A0, "ax", %progbits
@ sub_80503A0 @ JP 0x080503A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80503A0
	.thumb_func
sub_80503A0:
	push {lr}
	ldr r0, _080503BC @ =0x085E06B0
	bl Proc_Find
	cmp r0, #0
	beq _080503B8
	adds r2, r0, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
_080503B8:
	pop {r0}
	bx r0
	.align 2, 0
_080503BC: .4byte 0x085E06B0

