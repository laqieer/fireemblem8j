	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_8005890, 0x08005890 + 1
	.set sub_8018FEC, 0x08018FEC + 1
	.section .text.sub_80C3744, "ax", %progbits
@ sub_80C3744 @ JP 0x080C3744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3744
	.thumb_func
sub_80C3744:
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _080C3760
	bl GetUnitFromCharId
	bl sub_8018FEC
	adds r3, r0, #0
	b _080C376C
_080C3760:
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C376C
	ldr r3, _080C3784 @ =0x00007F04
_080C376C:
	ldr r1, _080C3788 @ =0x0201B7DA
	movs r2, #0x88
	lsls r2, r2, #2
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #4
	bl sub_8005890
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C3784: .4byte 0x00007F04
_080C3788: .4byte 0x0201B7DA

