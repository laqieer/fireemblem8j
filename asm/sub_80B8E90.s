	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80B9BE4, 0x080B9BE4 + 1
	.section .text.sub_80B8E90, "ax", %progbits
@ sub_80B8E90 @ JP 0x080B8E90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8E90
	.thumb_func
sub_80B8E90:
	push {lr}
	ldr r0, _080B8EAC @ =0x08ABC808
	bl Proc_Find
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #1
	beq _080B8EA8
	adds r0, r1, #0
	bl sub_80B9BE4
_080B8EA8:
	pop {r0}
	bx r0
	.align 2, 0
_080B8EAC: .4byte 0x08ABC808

