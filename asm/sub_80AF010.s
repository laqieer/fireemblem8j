	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80AF010, "ax", %progbits
@ sub_80AF010 @ JP 0x080AF010 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF010
	.thumb_func
sub_80AF010:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080AF030 @ =0x08A9CFE4
	bl Proc_Find
	cmp r0, #0
	beq _080AF02A
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	adds r0, #0x3d
	strb r5, [r0]
_080AF02A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF030: .4byte 0x08A9CFE4

