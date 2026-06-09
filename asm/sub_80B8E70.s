	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80B9A8C, 0x080B9A8C + 1
	.section .text.sub_80B8E70, "ax", %progbits
@ sub_80B8E70 @ JP 0x080B8E70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8E70
	.thumb_func
sub_80B8E70:
	push {lr}
	ldr r0, _080B8E8C @ =0x08ABC808
	bl Proc_Find
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B8E88
	adds r0, r1, #0
	bl sub_80B9A8C
_080B8E88:
	pop {r0}
	bx r0
	.align 2, 0
_080B8E8C: .4byte 0x08ABC808

