	.syntax unified
	.set sub_802E9C8, 0x0802E9C8 + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_8086DD8, "ax", %progbits
@ sub_8086DD8 @ JP 0x08086DD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086DD8
	.thumb_func
sub_8086DD8:
	push {r4, lr}
	movs r0, #0
	bl sub_802EAC4
	adds r4, r0, #0
	b _08086DF2
_08086DE4:
	cmp r0, #0xd
	bne _08086DF0
	adds r0, r4, #0
	bl sub_802E9C8
	subs r4, #8
_08086DF0:
	adds r4, #8
_08086DF2:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08086DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

