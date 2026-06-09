	.syntax unified
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_8019E4C, "ax", %progbits
@ sub_8019E4C @ JP 0x08019E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019E4C
	.thumb_func
sub_8019E4C:
	push {r4, lr}
	movs r0, #0
	bl sub_802EAC4
	adds r4, r0, #0
	b _08019E6C
_08019E58:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	bne _08019E6A
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #3]
	movs r3, #1
	bl MapAddInRange
_08019E6A:
	adds r4, #8
_08019E6C:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08019E58
	pop {r4}
	pop {r0}
	bx r0

