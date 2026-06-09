	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.section .text.sub_80A5708, "ax", %progbits
@ sub_80A5708 @ JP 0x080A5708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5708
	.thumb_func
sub_80A5708:
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A572A
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x43
	movs r2, #0xc0
	movs r3, #0x18
	bl ChangeBgm
	b _080A573C
_080A572A:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x18
	bl ChangeBgm
_080A573C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

