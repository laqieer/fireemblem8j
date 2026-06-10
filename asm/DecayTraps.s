	.syntax unified
	.set RemoveTrap, 0x0802E234 + 1
	.set sub_802E9C8, 0x0802E9C8 + 1
	.section .text.DecayTraps, "ax", %progbits
@ DecayTraps @ JP 0x0802E9F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DecayTraps
	.thumb_func
DecayTraps:
	push {r4, lr}
	ldr r4, _0802EA00 @ =0x0203A610
	b _0802EA3A
	.align 2, 0
_0802EA00: .4byte 0x0203A610
_0802EA04:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	beq _0802EA10
	cmp r0, #0xd
	beq _0802EA24
	b _0802EA38
_0802EA10:
	ldrb r0, [r4, #3]
	subs r0, #1
	strb r0, [r4, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EA38
	adds r0, r4, #0
	bl RemoveTrap
	b _0802EA36
_0802EA24:
	ldrb r0, [r4, #6]
	subs r0, #1
	strb r0, [r4, #6]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EA38
	adds r0, r4, #0
	bl sub_802E9C8
_0802EA36:
	subs r4, #8
_0802EA38:
	adds r4, #8
_0802EA3A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802EA04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

