	.syntax unified
	.set GetClassReelEntry, 0x080B8C80 + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B75A0, "ax", %progbits
@ sub_80B75A0 @ JP 0x080B75A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B75A0
	.thumb_func
sub_80B75A0:
	push {lr}
	ldr r0, _080B75C4 @ =0x08AAFC54
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B75C8
	adds r0, #0x33
	ldrb r0, [r0]
	adds r1, #0x34
	ldrb r1, [r1]
	bl GetClassReelEntry
	cmp r0, #0
	bne _080B75C8
	movs r0, #1
	b _080B75CA
	.align 2, 0
_080B75C4: .4byte 0x08AAFC54
_080B75C8:
	movs r0, #0
_080B75CA:
	pop {r1}
	bx r1
	.align 2, 0

