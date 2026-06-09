	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B2488, "ax", %progbits
@ sub_80B2488 @ JP 0x080B2488 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2488
	.thumb_func
sub_80B2488:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B24AC @ =0x08A9DBB4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B24A6
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #0
	strb r1, [r0]
_080B24A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B24AC: .4byte 0x08A9DBB4

