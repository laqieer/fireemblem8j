	.syntax unified
	.set sub_802C0F8, 0x0802C0F8 + 1
	.section .text.sub_807CB90, "ax", %progbits
@ sub_807CB90 @ JP 0x0807CB90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CB90
	.thumb_func
sub_807CB90:
	push {lr}
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0807CBB0
	adds r0, r2, #0
	bl sub_802C0F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CBB0
	movs r0, #1
	b _0807CBB2
_0807CBB0:
	movs r0, #0
_0807CBB2:
	pop {r1}
	bx r1
	.align 2, 0

